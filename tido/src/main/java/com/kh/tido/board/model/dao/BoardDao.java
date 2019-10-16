package com.kh.tido.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.notice.model.vo.Notice;

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
		System.out.println();
		return sqlSession.insert("boardMapper.insertBoard", board);
	}

	public void addReadCount(int cBoardNo) {
		sqlSession.update("boardMapper.addReadCount", cBoardNo);
	}

	public Board selectBoard(int cBoardNo) {
		return sqlSession.selectOne("boardMapper.selectBoard", cBoardNo);
	}

	public int deleteBoard(int cBoardNo) {
		return sqlSession.update("boardMapper.deleteBoard", cBoardNo);
	}

	public int updateBoard(Board board) {
		System.out.println(board.getcBoardNo());
		return sqlSession.update("boardMapper.updateBoard",board);
	}

	public int insertReply(Reply reply) {
		return sqlSession.insert("boardMapper.insertReply", reply);
	}

	public ArrayList<Reply> selectReply(int cBoardNo) {
		return (ArrayList)sqlSession.selectList("boardMapper.selectReply", cBoardNo);
	}

	public ArrayList<Board> searchList(Search search) {
		return (ArrayList)sqlSession.selectList("boardMapper.searchList", search);
	}

}

