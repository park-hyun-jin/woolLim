package com.kh.tido.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.admin.model.dao.AdminUserDao;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.member.model.vo.Member;

@Service("auService")
public class AdminUserServiceImpl implements AdminUserService{
	
	@Autowired
	private AdminUserDao auDao;

	@Override
	public ArrayList<Member> memberList() {		
		return auDao.memberList();
	}

	@Override
	public int aDeleteMember(ArrayList<String> aMemberList) {
		Map<String,Object> memberList = new HashMap<String,Object>();
		memberList.put("aMemberList",aMemberList);
		return auDao.aDeleteMember(memberList);
	}

	@Override
	public int aReviveMember(ArrayList<String> aMemberList) {
		Map<String,Object> memberList = new HashMap<String,Object>();
		memberList.put("aMemberList",aMemberList);
		return auDao.aReviveMember(memberList);
	}

	@Override
	public Member aMemberDetail(String id) {
		return auDao.aMemberDetail(id);
	}

	@Override
	public ArrayList<Board> aMemberBoardList(String id) {
		return auDao.aMemberBoardList(id);
	}

}
