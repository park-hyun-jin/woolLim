package com.kh.tido.member.model.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.member.model.vo.Member;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "memberMapper";

	public Member selectMember(Member mem) {
		
		Member loginUser = sqlSession.selectOne("memberMapper.selectOne", mem);
		
		return loginUser;
	}
	
	// mDao
	public void createAuthKey(String memberAuthKey) throws Exception { // 인증키 DB에 넣기
		sqlSession.selectOne(namespace + ".createAuthKey", memberAuthKey);
	}

	public void userAuth(String userEmail) throws Exception { // 인증키 일치시 DB칼럼(인증여부) false->true 로 변경
		sqlSession.update(namespace + ".userAuth", userEmail);
	}

	public void create(Member mem) {
		
	}
	
}
