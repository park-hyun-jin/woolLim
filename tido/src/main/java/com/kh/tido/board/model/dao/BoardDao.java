package com.kh.tido.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Reply;

@Repository("bDao")
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount() {
		return sqlSession.selectOne("boardMapper.getListCount");
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}

	public int insertBoard(Board board) {
		return sqlSession.insert("boardMapper.insetBoard", board);
	}

	public void addReadCount(int bNo) {
		sqlSession.update("boardMapper.addReadCount", bNo);
	}

	public Board selectBoard(int bNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", bNo);
	}

	public int deleteBoard(int bNo) {
		return sqlSession.update("boardMapper.deleteBoard", bNo);
	}

	public int updateBoard(Board board) {
		return sqlSession.update("boardMapper.updateBoard",board);
	}

	public int insertReply(Reply reply) {
		return sqlSession.insert("boardMapper.insertReply", reply);
	}

	public ArrayList<Reply> selectReply(int bNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", bNo);
	}
}
