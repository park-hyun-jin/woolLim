package com.kh.tido.notice.model.service;

import java.util.ArrayList;

import com.kh.tido.notice.model.vo.Notice;

public interface NoticeService {

	/** 공지사항 목록 조회 Service
	 * @param currentPage
	 * @return list
	 */
	public abstract ArrayList<Notice> selectList(int currentPage);

	public abstract int noticeList(Notice notice);

}
