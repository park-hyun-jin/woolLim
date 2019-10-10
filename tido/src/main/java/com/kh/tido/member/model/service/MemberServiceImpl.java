package com.kh.tido.member.model.service;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.member.controller.MailHandler;
import com.kh.tido.member.model.dao.MemberDao;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;
import com.kh.tido.member.model.vo.TempKey;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
 	@Autowired
 	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Inject
    private JavaMailSender mailSender;

	@Override
	public Member loginMember(Member mem) {
		
		Member loginUser = mDao.selectMember(mem);
		

		if(!bCryptPasswordEncoder.matches(mem.getPwd(), loginUser.getPwd())) {
			loginUser = null;
		}
		
		return loginUser;
	}
	
	@Transactional
	@Override
	public void insertAuth(String email) throws Exception {
		String key = new TempKey().getKey(50, false); // 인증키 생성
		System.out.println("key : " + key);
		MemberAuth memberAuth = new MemberAuth(key, 0, email);
		mDao.insertAuthKey(memberAuth); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[WooLim 이메일 인증]"); // 메일제목
		sendMail.setText( // 메일내용
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/tido/emailConfirm.kh?memberId=")
				.append(email).append("&memberAuthKey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("falling710@gmail.com", "WooLim"); // 보낸이
		sendMail.setTo(email); // 받는이
		sendMail.send();
	}

	@Override
	public int updateAuth(MemberAuth memberAuth) throws Exception {
		int result = mDao.updateAuth(memberAuth);
		return result;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor=Exception.class)
	public int insertMember(Member mem, MultipartFile uploadFile, HttpServletRequest request) {
		
 		String encPwd = bCryptPasswordEncoder.encode(mem.getPwd());
 		String savePath = "";
 		String filePath = "";
	
 		mem.setPwd(encPwd);
 		
 		String fileName = null;
 		
 		// 업로드 된 파일이 있을 경우 멤버 프로필 사진 경로 저장
 		if(!uploadFile.getOriginalFilename().equals("")) {
 			fileName = uploadFile.getOriginalFilename();
 			
	 		// 파일 저장 경로 설정
 			// 각 멤버마다 이름이 멤버 아이디인 폴더 안에 원본파일을 가입하는 회원의 닉네임을 붙인 이름으로 저장한다
			String root = request.getSession().getServletContext().getRealPath("resources");
			savePath = root + "\\muploadFiles" + "\\" + mem.getId();
			filePath = savePath + "\\" + fileName;
			
 			mem.setImagePath(filePath);
 		}
 		
 		int result = mDao.insertMember(mem);
 		
 		if(!fileName.equals("") && result == 1) {
 			result = saveFile(savePath, filePath, uploadFile);
 		}
		
		return result;
	}
	
	// 파일 저장 메소드
		public int saveFile(String savePath, String filePath, MultipartFile uploadFile) {
			
			// 저장 폴더 선택
			File folder = new File(savePath);
			
			// 만약 해당 폴더가 없는 경우
			if(!folder.exists()) {
				folder.mkdir(); // 폴더 생성
			}
			
			// 파일 저장 성공 여부( 성공 1, 실패 0	)
			int result = 0;
			
			try {
				uploadFile.transferTo(new File(filePath));
				// 업로드된 파일을 filePath에 지정된
				// 경로 + 파일명으로 저장하겠다. 
				// -> IOException 예외 처리 필요
				result = 1;
			}catch(Exception e) {
				result = 2;
				System.out.println("파일 전송 에러 : " + e.getMessage());
			}
			
			return result;
		}

	@Override
	public int selectId(String memberId) {
		return mDao.selectId(memberId);
	}

	@Override
	public int selectName(String name) {
		return mDao.selectName(name);
	}

}
