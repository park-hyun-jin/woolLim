package com.kh.tido.projectBoard.model.service;

import java.util.ArrayList;

import com.kh.tido.projectBoard.model.vo.ProjectBoard;

public interface ProjectBoardService {

	ArrayList<ProjectBoard> selectpBoardList(int currentPage);

}
