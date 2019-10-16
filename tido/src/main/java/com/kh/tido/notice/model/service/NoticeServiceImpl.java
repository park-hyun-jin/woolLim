package com.kh.tido.notice.model.service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.notice.model.vo.Search;
import com.kh.tido.common.Pagination;
import com.kh.tido.member.model.dao.MemberDao;
import com.kh.tido.notice.model.dao.NoticeDao;
import com.kh.tido.notice.model.vo.Notice;
import com.kh.tido.notice.model.vo.PageInfo;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	
	@Autowired
	private NoticeDao nDao;
	
	@Override
	public ArrayList<Notice> selectList(int currentPage) {
		
		int listCount = nDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return nDao.selectList(pi);

	}
	
	
	@Override
	public int insertNotice(Notice notice) {
		notice.setPnoticeContent(notice.getPnoticeContent().replace("\n", "<br>"));
		return nDao.insertNotice(notice);
	}

	public Notice selectOne(int nNo) {
		
		nDao.addpnoticeViewCount(nNo);
		
		return nDao.selectOne(nNo);
	}

	@Override
	public int noticeList(Notice notice) {
		
		notice.setPnoticeContent(notice.getPnoticeContent().replace("\n", "<br>"));
		return nDao.insertNotice(notice);
	}
	
	public int deleteNotice(int nNo) {
		return nDao.deleteNotice(nNo);
	}

	@Override
	public int updateNotice(Notice notice) {
		notice.setPnoticeContent(notice.getPnoticeContent().replace("\n", "<br>"));
		return nDao.updateNotice(notice);
	}


	@Override
	public ArrayList<Notice> searchList(Search search, int currentPage) {
		
		int listCount = nDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		return nDao.searchList(search, pi);
	}



	

	}





