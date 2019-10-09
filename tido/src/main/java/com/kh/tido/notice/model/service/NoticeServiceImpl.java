package com.kh.tido.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.board.model.vo.Search;
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
		
	
		return nDao.selectList(pi);

	}
	
	@Override
	public ArrayList<Notice> selectListN(int currentPage) {
		
		int listCount = nDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return nDao.selectListN(pi);
	}
	
	@Override
	public ArrayList<Notice> selectListAll(int currentPage) {
		int listCount = nDao.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
	
		return nDao.selectListAll(pi);
	}
	
	

	@Override
	public int noticeList(Notice notice) {
		
		notice.setPnoticeContent(notice.getPnoticeContent().replace("\n", "<br>"));
		return nDao.insertNotice(notice);

	}

	@Override
	public ArrayList<Notice> searchList(Search search) {
		return nDao.searchList(search);
	}

	@Override
	public int deleteBoard(ArrayList<Integer> deleteList) {
		Map<String,Object> cNo = new HashMap<String,Object>();
		cNo.put("deleteList",deleteList);
				
		return nDao.updateBoard(cNo);
	}

	@Override
	public int reviveNBoard(ArrayList<Integer> reviveList) {
		Map<String,Object> cNo = new HashMap<String,Object>();
		cNo.put("reviveList",reviveList);
				
		return nDao.reviveBoard(cNo);
	}

	

	
	
	

}
