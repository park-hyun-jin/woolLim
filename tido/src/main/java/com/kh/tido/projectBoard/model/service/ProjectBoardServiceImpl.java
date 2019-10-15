package com.kh.tido.projectBoard.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.common.Pagination2;
import com.kh.tido.projectBoard.model.dao.ProjectBoardDao;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Service("pbService")
public class ProjectBoardServiceImpl implements ProjectBoardService {
	
	@Autowired
	private ProjectBoardDao pbDao;
	
	@Override
	public ArrayList<ProjectBoard> selectpBoardList(int currentPage) {
		int listCount = pbDao.getpbListCount();
		PageInfo pi = Pagination2.getPageInfo(currentPage, listCount);
		return pbDao. selectpBoardList(pi) ;
	}

}
