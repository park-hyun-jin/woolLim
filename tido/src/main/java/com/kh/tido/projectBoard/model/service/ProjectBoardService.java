package com.kh.tido.projectBoard.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.tido.projectBoard.model.vo.ProjectBoard;

public interface ProjectBoardService {
	public abstract ArrayList<ProjectBoard> selectpBoardList(int currentPage);
	public abstract int insertpBoard(ProjectBoard pBoard,HttpServletRequest request);
	public abstract int updatepBoard(ProjectBoard pBoard);
	public abstract int deletepBoard(int pbNo);

}
