package com.kh.tido.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.member.model.vo.Member;

@Repository("auDao")
public class AdminUserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> memberList() {
		return (ArrayList)sqlSession.selectList("adminUserMapper.selectList");
	}

}
