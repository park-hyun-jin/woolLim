package com.kh.tido.projectBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.common.Pagination;
import com.kh.tido.project.model.service.ProjectService;
import com.kh.tido.project.model.vo.ProjectFile;
import com.kh.tido.projectBoard.model.service.ProjectBoardService;
import com.kh.tido.projectBoard.model.vo.ProjectBoard;

@Controller
public class ProjectBoardController {
	@Autowired
	private ProjectBoardService pbService;
	@Autowired
	private ProjectService pService;

	@RequestMapping("pjtBoardListView.kh")
	public ModelAndView selectpBoardList(ModelAndView mv, Integer page,HttpServletRequest request) {
		int currentPage = (page == null ? 1 : page);

		ArrayList<ProjectBoard> pbList = pbService.selectpBoardList(currentPage);
		ArrayList<ProjectFile> pfList = new ArrayList<ProjectFile>();
		for(ProjectBoard pb :pbList) {
			 pfList.add(pService.openProject(request,pb.getRefPNo()));
		}
		
		if (pbList != null) {
			// 메소드 체이닝(Method Chaining)
			mv.addObject("pbList", pbList)
			.addObject("pfList", pfList).addObject("pi", Pagination.getPageInfo()).setViewName("projectBoard/pBoardListView");
		} else {
			mv.addObject("msg", "게시물 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("insertSharePjt.kh")
	public String insertpBoard(ProjectBoard pBoard,HttpServletRequest request) {
		System.out.println(pBoard);
		int result = pbService.insertpBoard(pBoard,request);
		return result+"";
	}
	@ResponseBody
	@RequestMapping("updatepBoard.kh")
	public String updatepBoard(ProjectBoard pBoard) {
		System.out.println(pBoard);
		int result = pbService.updatepBoard(pBoard);
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("deletepBoard.kh")
	public String deletepBoard(int pbNo) {
		int result = pbService.deletepBoard(pbNo);
		return result +"";
	}

}
