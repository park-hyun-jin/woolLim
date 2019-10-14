package com.kh.tido.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.member.model.vo.PageInfo;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;

@Repository("mDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectMember(Member mem) {
		System.out.println("member session" + sqlSession);
		Member loginUser = sqlSession.selectOne("memberMapper.selectOne", mem);
		
		return loginUser;
	}
	
	// mDao
	public void insertAuthKey(MemberAuth memberAuth) throws Exception { // 인증키 DB에 넣기
		sqlSession.insert("memberMapper.insertAuthKey", memberAuth);
	}

	public int updateAuth(MemberAuth memberAuth) throws Exception { // 인증키 일치하는지 확인
		return sqlSession.update("memberMapper.updateAuth", memberAuth);
	}

	public int insertMember(Member mem) {
		return sqlSession.insert("memberMapper.insertMember", mem);
	}

	public int selectId(String memberId) {
		return sqlSession.selectOne("memberMapper.selectId", memberId);
	}

	public int selectName(String name) {
		return sqlSession.selectOne("memberMapper.selectName", name);
	}

	public int deleteMemberAuth(String id) {
		return sqlSession.delete("memberMapper.deleteMemberAuth", id);
	}
	
	public int getMemberBoardCount(String id) {
		return sqlSession.selectOne("memberMapper.selectMemberBoardCount", id);
	}
	
	public ArrayList<Board> selectMemberBoard(String id, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemberBoard", id, rowBounds);
	}

	public int getMemberBoardSearchCount() {
		
		return 0;
	}
	
}
