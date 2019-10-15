package com.kh.tido.projectBoard.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.board.model.vo.PageInfo;
import com.kh.tido.common.Pagination;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.projectBoard.model.dao.ProjectBoardDao;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Service("pbService")
public class ProjectBoardServiceImpl implements ProjectBoardService {
	
	@Autowired
	private ProjectBoardDao pbDao;
	
	@Override
	public ArrayList<ProjectBoard> selectpBoardList(int currentPage) {
		int listCount = pbDao.getpbListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		return pbDao. selectpBoardList(pi) ;
	}

	@Override
	public int insertpBoard(ProjectBoard pBoard,HttpServletRequest request) {
		pBoard.setWriterId(((Member)request.getSession().getAttribute("loginUser")).getId());
		pBoard.setpBoardContent(pBoard.getpBoardContent().replace("\n","<br>"));
		return pbDao.insertpBoard(pBoard);
	}

	@Override
	public int updatepBoard(ProjectBoard pBoard) {
		pBoard.setpBoardContent(pBoard.getpBoardContent().replace("\n","<br>"));
		return pbDao.updatepBoard(pBoard);
	}

	@Override
	public int deletepBoard(int pbNo) {
		return pbDao.deletepBoard(pbNo);
	}


	
}
