package com.kh.tido.notice.model.service;

import java.util.ArrayList;

import com.kh.tido.board.model.vo.Search;
import com.kh.tido.notice.model.vo.Notice;

public interface NoticeService {

	/** 공지사항 목록 조회 Service
	 * @param currentPage
	 * @return list
	 */
	public abstract ArrayList<Notice> selectList(int currentPage);

	public abstract ArrayList<Notice> selectListN(int currentPage);
	
	public abstract ArrayList<Notice> selectListAll(int currentPage);
	
	public abstract int noticeList(Notice notice);
	
	public abstract ArrayList<Notice> searchList(Search search);

	public abstract int deleteBoard(ArrayList<Integer> deleteList);

	public abstract int reviveNBoard(ArrayList<Integer> reviveList);



	
	
	

}
