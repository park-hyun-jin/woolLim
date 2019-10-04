package com.kh.tido.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.tido.member.model.dao.MemberDao;
import com.kh.tido.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	/*
	 * @Autowired private BCryptPasswordEncoder bCryptPasswordEncoder;
	 */

	@Override
	public Member loginMember(Member mem) {
		
		
		Member loginUser = mDao.selectMember(mem);
		
		return loginUser;
	}

}
