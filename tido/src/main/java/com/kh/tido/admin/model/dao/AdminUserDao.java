package com.kh.tido.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.member.model.vo.Member;

@Repository("auDao")
public class AdminUserDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> memberList() {
		return (ArrayList)sqlSession.selectList("adminUserMapper.selectList");
	}

	public int aDeleteMember(Map<String, Object> memberList) {
		return sqlSession.update("adminUserMapper.aDeleteMember",memberList);
	}

	public int aReviveMember(Map<String, Object> memberList) {
		return sqlSession.update("adminUserMapper.aReviveMember",memberList);
	}

	public Member aMemberDetail(String id) {
		return sqlSession.selectOne("adminUserMapper.aMemberDetail",id);
	}

	public ArrayList<Board> aMemberBoardList(String id) {		
		return (ArrayList)sqlSession.selectList("adminUserMapper.aMemberBoardList", id);
	}

	public Board detailBoard(int cBoardNo) {
		return sqlSession.selectOne("adminUserMapper.detailBoard",cBoardNo);
	}

}
