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
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.notice.model.vo.Notice;
import com.kh.tido.report.model.vo.Report;



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
	
	public int reviveCBoard(Map bNo) {
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
	
	//Q&A 부분
	
	public int inquiryGetListCount() {
		return sqlSession.selectOne("adminMapper.inquiryGetListCount");
	}
	

	public ArrayList<Inquiry> inquiryselectList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.inquiryselectList", null, rowBounds);
	}

	public ArrayList<Inquiry> inquirySelectListAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.inquirySelectListAll", null, rowBounds);
	}

	public ArrayList<Inquiry> inquirySelectListN(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.inquirySelectListN", null, rowBounds);
	}

	public ArrayList<Inquiry> inquirySearchList(Search search) {
		return (ArrayList)sqlSession
				.selectList("adminMapper.inquirySearchList",search);
	}

	public int inquiryDeleteBoard(Map iNo) {
		return sqlSession.update("adminMapper.inquiryDeleteBoard",iNo);
	}

	public int reviveIBoard(Map iNo) {
		return sqlSession.update("adminMapper.reviveIBoard",iNo);
	}

	public int reportGetListCount() {
		return sqlSession.selectOne("adminMapper.reportGetListCount");
	}

	public ArrayList<Report> rboardListAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		return (ArrayList)sqlSession.selectList("adminMapper.rboardListAll", null, rowBounds);
	}

	public ArrayList<Report> reportSearchList(Report report) {
		return (ArrayList)sqlSession
				.selectList("adminMapper.reportSearchList",report);
	}

	public ArrayList<Report> reportSearch(int rRrno) {
		return (ArrayList)sqlSession.selectList("adminMapper.reportSearch",rRrno);
	}

	public ArrayList<Report> adminRsearch(Search search) {
		return (ArrayList)sqlSession
				.selectList("adminMapper.adminRsearch",search);
	}

	public ArrayList<Report> adminReportTypeSearch(int rReportType) {
		return (ArrayList)sqlSession.selectList("adminMapper.adminReportTypeSearch",rReportType);
		}
	


	
	
}
