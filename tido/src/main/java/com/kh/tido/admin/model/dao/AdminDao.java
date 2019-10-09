package com.kh.tido.admin.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.notice.model.vo.Notice;



@Repository("aDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 자유게시판 관리 부분
	
	public int getListCount() {
		return sqlSession.selectOne("adminMapper.getListCount");
	}
	
	public ArrayList<Board> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Board> selectListN(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectListN", null, rowBounds);
	}
	
	public ArrayList<Board> selectListAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.selectListAll", null, rowBounds);

	}
	
	public int updateBoard(Map bNo) {
		return sqlSession.update("adminMapper.updateBoardAdmin",bNo);
	}
	
	public int reviveBoard(Map bNo) {
		return sqlSession.update("adminMapper.reviveBoardAdmin",bNo);
	}

	public ArrayList<Board> searchList(Search search) {
		return (ArrayList)sqlSession
				.selectList("adminMapper.searchList",search);
	}
	
	
	// 공지사항 관리 부분 
		public int noticeGetListCount() {
		return sqlSession.selectOne("adminMapper.noticeGetListCount");

	}

	public ArrayList<Notice> noticeSearchList(Search search) {
		return (ArrayList)sqlSession
				.selectList("adminMapper.noticeSearchList",search);
	
	}
	
	public ArrayList<Notice> noticeSelectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.noticeSelectList", null, rowBounds);
	}
	
	public ArrayList<Notice> noticeSelectListN(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.noticeSelectListN", null, rowBounds);
	}
	
	public ArrayList<Notice> noticeSelectListAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.noticeSelectListAll", null, rowBounds);
	}
	

	public int noticeDeleteBoard(Map cNo) {
		return sqlSession.update("adminMapper.updateNoticeAdmin",cNo);
		
	}

	public int reviveNBoard(Map cNo) {
		return sqlSession.update("adminMapper.reviveNoticeAdmin",cNo);
	}
	
	
}
