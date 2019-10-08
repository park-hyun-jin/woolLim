package com.kh.tido.member.model.service;

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
	
 		mem.setPwd(encPwd);
 		
 		if(!uploadFile.equals("")) {
 			
 		}
		
		return mDao.insertMember(mem);
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
