package com.kh.tido.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.admin.model.dao.AdminDao;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.common.Pagination;
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.notice.model.dao.NoticeDao;
import com.kh.tido.notice.model.vo.Notice;
import com.kh.tido.notice.model.vo.PageInfo;
import com.kh.tido.report.model.vo.Report;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDao aDao;
	
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public ArrayList<Board> selectList(int currentPage){
		
		int listCount = aDao.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return aDao.selectList(pi);
	}
	
	@Override
	public ArrayList<Board> selectListN(int currentPage) {
		int listCount = aDao.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return aDao.selectListN(pi);
	}
	
	@Override
	public ArrayList<Board> selectListAll(int currentPage) {
		int listCount = aDao.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return aDao.selectListAll(pi);
	}
	
	@Override
	public int deleteBoard(ArrayList<Integer> deleteList) {
		Map<String,Object> bNo = new HashMap<String,Object>();
		bNo.put("deleteList",deleteList);
				
		return aDao.updateBoard(bNo);
	}
	
	@Override
	public int reviveCBoard(ArrayList<Integer> reviveList) {
		Map<String,Object> bNo = new HashMap<String,Object>();
		bNo.put("reviveList",reviveList);
				
		return aDao.reviveCBoard(bNo);
	}
	
	@Override
	public ArrayList<Board> searchList(Search search) {
		return aDao.searchList(search);
	}
	
	
	@Override
	public ArrayList<Notice> noticeSearchList(Search search) {
		return aDao.noticeSearchList(search);
	}

	@Override
	public int noticeDeleteBoard(ArrayList<Integer> deleteList) {
		Map<String,Object> cNo = new HashMap<String,Object>();
		cNo.put("deleteList",deleteList);
				
		return aDao.noticeDeleteBoard(cNo);
	}

	@Override
	public int reviveNBoard(ArrayList<Integer> reviveList) {
		Map<String,Object> cNo = new HashMap<String,Object>();
		cNo.put("reviveList",reviveList);
				
		return aDao.reviveNBoard(cNo);
	}

	@Override
	public ArrayList<Notice> noticeSelectList(int currentPage) {
		
		int listCount = aDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.noticeSelectList(pi);

	}
	
	@Override
	public ArrayList<Notice> noticeSelectListN(int currentPage) {
		
		int listCount = aDao.noticeGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.noticeSelectListN(pi);
	}
	
	@Override
	public ArrayList<Notice> noticeSelectListAll(int currentPage) {
		int listCount = aDao.noticeGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.noticeSelectListAll(pi);
	}

	@Override
	public ArrayList<Inquiry> inquiryselectList(int currentPage) {
		int listCount = aDao.inquiryGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.inquiryselectList(pi);
	}

	@Override
	public ArrayList<Inquiry> inquiryselectListAll(int currentPage) {
		int listCount = aDao.inquiryGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.inquirySelectListAll(pi);
	}

	@Override
	public ArrayList<Inquiry> inquiryselectListN(int currentPage) {
		int listCount = aDao.inquiryGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.inquirySelectListN(pi);
	}

	@Override
	public ArrayList<Inquiry> inquirySearchList(Search search) {
		return aDao.inquirySearchList(search);
	}

	public int inquiryDeleteBoard(ArrayList<Integer> deleteList) {
		Map<String,Object> iNo = new HashMap<String,Object>();
		iNo.put("deleteList",deleteList);
				
		return aDao.inquiryDeleteBoard(iNo);
	}

	@Override
	public int reviveIBoard(ArrayList<Integer> reviveList) {
		Map<String,Object> iNo = new HashMap<String,Object>();
		iNo.put("reviveList",reviveList);
				
		return aDao.reviveIBoard(iNo);
	}

	@Override
	public ArrayList<Report> rboardListAll(int currentPage) {
		int listCount = aDao.reportGetListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return aDao.rboardListAll(pi);
	}

	@Override
	public ArrayList<Report> reportSearch(int rRrno) {
	
		
		return aDao.reportSearch(rRrno);
	}

	@Override
	public ArrayList<Report> adminRsearch(Search search) {
	
		return aDao.adminRsearch(search);
	
	}

	@Override
	public ArrayList<Report> adminReportTypeSearch(int rReportType) {
		return aDao.adminReportTypeSearch(rReportType);
	}

	@Override
	public ArrayList<Report> reportDetailBoard(int rReportNo) {
	
		return aDao.reportDetailBoard(rReportNo);
	}

	@Override
	public int adminReport(int rReportNo) {
		
		int result = aDao.adminReport(rReportNo);
		
		int result2 = aDao.adminReportPlus(rReportNo);
		
	}
	
	

	
		
	


	
	
}
