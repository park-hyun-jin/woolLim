package com.kh.tido.notice.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.notice.model.vo.Notice;

@Repository("nDao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("noticeMapper.getListCount");

	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	public ArrayList<Notice> selectListN(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectListN", null, rowBounds);
	}
	
	public ArrayList<Notice> selectListAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectListAll", null, rowBounds);
	}

	

	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("noticeMapper.insertList", notice);
	}

	public ArrayList<Notice> searchList(Search search) {
		return (ArrayList)sqlSession
				.selectList("noticeMapper.searchList",search);
	
	}

	public int deleteBoard(ArrayList<Integer> deleteList) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateBoard(Map cNo) {
		return sqlSession.update("noticeMapper.updateBoardAdmin",cNo);
		
	}

	public int reviveBoard(Map cNo) {
		return sqlSession.update("noticeMapper.reviveBoardAdmin",cNo);
	}

	


	
	

	

	
	}

