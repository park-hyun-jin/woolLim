package com.kh.tido.admin.model.service;

import java.util.ArrayList;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.notice.model.vo.Notice;
import com.kh.tido.report.model.vo.Report;

public interface AdminService {

	public abstract ArrayList<Board> selectList(int currentPage);
	
	public abstract ArrayList<Board> selectListN(int currentPage);

	public abstract ArrayList<Board> selectListAll(int currentPage);
	
	public abstract int deleteBoard(ArrayList<Integer> deleteList);
	
	public abstract int reviveCBoard(ArrayList<Integer> reviveList);

	public abstract ArrayList<Board> searchList(Search search);
	
	
	public abstract ArrayList<Notice> noticeSearchList(Search search);

	public abstract int noticeDeleteBoard(ArrayList<Integer> deleteList);

	public abstract int reviveNBoard(ArrayList<Integer> reviveList);
	
	public abstract ArrayList<Notice> noticeSelectList(int currentPage);

	public abstract ArrayList<Notice> noticeSelectListN(int currentPage);
	
	public abstract ArrayList<Notice> noticeSelectListAll(int currentPage);

	public abstract ArrayList<Inquiry> inquiryselectList(int currentPage);

	public abstract ArrayList<Inquiry> inquiryselectListAll(int currentPage);

	public abstract ArrayList<Inquiry> inquiryselectListN(int currentPage);

	public abstract ArrayList<Inquiry> inquirySearchList(Search search);

	public abstract int inquiryDeleteBoard(ArrayList<Integer> deleteList);

	public abstract int reviveIBoard(ArrayList<Integer> reviveList);

	public abstract ArrayList<Report> rboardListAll(int currentPage);

	public abstract ArrayList<Report> reportSearch(int rRrno);

	public abstract ArrayList<Report> adminRsearch(Search search);

	public abstract ArrayList<Report> adminReportTypeSearch(int rReportType);

	public abstract ArrayList<Report> reportDetailBoard(int rReportNo);

	public abstract int adminReport(int rReportNo);
	
	
	
	
}
