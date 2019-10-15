package com.kh.tido.projectBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.common.Pagination;
import com.kh.tido.projectBoard.model.service.ProjectBoardService;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Controller
public class ProjectBoardController {

	@Autowired
	private ProjectBoardService pbService;

	@RequestMapping("pjtBoardListView.kh")
	public ModelAndView selectpBoardList(ModelAndView mv, Integer page) {
		int currentPage = (page == null ? 1 : page);

		ArrayList<ProjectBoard> pbList = pbService.selectpBoardList(currentPage);
		if (pbList != null) {
			// 메소드 체이닝(Method Chaining)
			mv.addObject("pbList", pbList).addObject("pi", Pagination.getPageInfo()).setViewName("projectBoard/pBoardListView");
		} else {
			mv.addObject("msg", "게시물 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

}
