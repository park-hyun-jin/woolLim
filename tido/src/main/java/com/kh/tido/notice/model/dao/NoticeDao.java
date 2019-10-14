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

	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("noticeMapper.insertList", notice);
	}

	public Notice selectOne(int nNo) {
		
		return sqlSession.selectOne("noticeMapper.detailList", nNo);
	}


	public void addpnoticeViewCount(int nNo) {
		
		sqlSession.update("noticeMapper.addpnoticeViewCount", nNo);
		
	}

	public int deleteNotice(int nNo) {
		return sqlSession.delete("noticeMapper.deleteNotice", nNo);
	}

	public int updateNotice(Notice notice) {
		
		return sqlSession.update("noticeMapper.updateNotice", notice);
	}



	
	}

