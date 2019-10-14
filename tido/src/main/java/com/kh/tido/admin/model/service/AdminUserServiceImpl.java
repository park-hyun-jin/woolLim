package com.kh.tido.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.admin.model.dao.AdminUserDao;
import com.kh.tido.member.model.vo.Member;

@Service("aService")
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	private AdminUserDao aDao;

	@Override
	public ArrayList<Member> memberList() {		
		return aDao.memberList();
	}

}
