package com.kh.tido.member.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.tido.member.controller.MailHandler;
import com.kh.tido.member.model.dao.MemberDao;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.TempKey;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	/*
	 * @Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	 */
	
	@Inject
    private JavaMailSender mailSender;

	@Override
	public Member loginMember(Member mem) {
		
		
		Member loginUser = mDao.selectMember(mem);
		
		return loginUser;
	}
	
	@Transactional
	@Override
	public void create(Member mem) throws Exception {
		String key = new TempKey().getKey(50, false); // 인증키 생성
		mDao.createAuthKey(key); // 인증키 DB저장
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[WooLim 이메일 인증]"); // 메일제목
		sendMail.setText( // 메일내용
				new StringBuffer().append("<h1>메일인증</h1>").append("<a href='http://localhost:8080/tido/emailConfirm?memberId=")
				.append(mem.getId()).append("&memberAuthKey=").append(key).append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("falling710@gmail.com", "WooLim"); // 보낸이
		sendMail.setTo(mem.getId()); // 받는이
		sendMail.send();
	}

	@Override
	public void userAuth(String memberId, String memberAuthKey) throws Exception {
		mDao.userAuth(memberId);
	}

}
