package com.kh.tido.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.common.Pagination;
import com.kh.tido.member.model.dao.MemberDao;
import com.kh.tido.notice.model.dao.NoticeDao;
import com.kh.tido.notice.model.vo.Notice;

@Service("nService")
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public ArrayList<Notice> selectList(int currentPage) {
		
		int listCount = nDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		// 2) 목록조회 후 리턴
		return nDao.selectList(pi);

	}

	@Override
	public int insertNotice(Notice notice) {
		notice.setPnoticeContent(notice.getPnoticeContent().replace("\n", "<br>"));
		return nDao.insertNotice(notice);
	}

	@Override
	public Notice selectOne(int nNo) {
		
		nDao.addpnoticeViewCount(nNo);
		
		return nDao.selectOne(nNo);
	}



}
