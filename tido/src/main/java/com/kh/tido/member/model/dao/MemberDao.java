package com.kh.tido.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member mem) {
		System.out.println("member session" + sqlSession);
		Member loginUser = sqlSession.selectOne("memberMapper.selectOne", mem);
		
		return loginUser;
	}
	
	
}
