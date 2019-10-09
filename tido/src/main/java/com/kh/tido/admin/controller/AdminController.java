package com.kh.tido.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.tido.admin.model.service.AdminService;
import com.kh.tido.board.model.service.BoardService;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.common.Pagination;
import com.kh.tido.notice.model.service.NoticeService;
import com.kh.tido.notice.model.vo.Notice;



@Controller
public class AdminController {
	
	@Autowired
	private BoardService bService;
	@Autowired
	private AdminService aService;
	
	
	@RequestMapping("admin.kh")
	public String compProjectView() {
		return "admin/adminDashboard";
	}
	
	
	// 게시판 관리 STATUS Y만
	@RequestMapping("cboardList.kh")
	public ModelAndView cboardList(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Board> list = aService.selectList(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboard");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//// 게시판 관리 STATUS N만
	@RequestMapping("cboardListN.kh")
	public ModelAndView cboardListN(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Board> list = aService.selectListN(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboardN");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 게시판 관리 삭제,비삭제 게시글 모두 조회
	@RequestMapping("cboardListAll.kh")
	public ModelAndView cboardListAll(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Board> list = aService.selectListAll(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboardAll");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	
	
	//CBOARD 체크박스 삭제
	@ResponseBody
	@RequestMapping("deleteBoard.kh")
	public String deleteBoard(@RequestParam(value="checkArray[]") ArrayList<Integer> deleteList) {
		
		int result = aService.deleteBoard(deleteList);
		return new Gson().toJson(result);
	}
	
	//CBOARD 체크박스 삭제 복구
	@ResponseBody
	@RequestMapping("reviveCBoard.kh")
	public String reviveCBoard(@RequestParam(value="checkArray[]") ArrayList<Integer> reviveList) {
		
		int result = aService.reviveBoard(reviveList);
		return new Gson().toJson(result);
	}
	
	
	
	
	// 자유게시판 검색
	@RequestMapping("bsearch.kh")
	public String boardSearch(Search search, Model model){
		
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		System.out.println(search.getExistFile());
		// 체크 O : on
		// 체크 X : null
		
		ArrayList<Board> searchList 
			= aService.searchList(search);
		
		for(Board b : searchList) {
			System.out.println(b);
		}
		
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "admin/adminCboard";
	}
	
	
	
	//공지사항 리스트 STATS -Y-만 
	@RequestMapping("nboardList.kh")
	public ModelAndView nboardList(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Notice> list = aService.noticeSelectList(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboard");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
////게시판 관리 STATUS N만
	@RequestMapping("nboardListN.kh")
	public ModelAndView nboardListN(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Notice> list = aService.noticeSelectListN(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboardN");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	// 게시판 관리 삭제,비삭제 게시글 모두 조회
	@RequestMapping("nboardListAll.kh")
	public ModelAndView nboardListAll(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		
		ArrayList<Notice> list = aService.noticeSelectListAll(currentPage);
		
		System.out.println(list);
		
		if(list != null) {
			
			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboardAll");
		}else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	
	
	// 공지사항 검색
	@RequestMapping("nsearch.kh")
	public String noticeSearch(Search search, Model model){
		
		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		System.out.println(search.getExistFile());
		// 체크 O : on
		// 체크 X : null
		
		ArrayList<Notice> searchList 
			= aService.noticeSearchList(search);
		
		for(Notice n : searchList) {
			System.out.println(n);
		}
		
		
		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "admin/adminNboard";
	}
	
	// 공지사항 체크박스 삭제
	@ResponseBody
	@RequestMapping("deleteNBoard.kh")
	public String deleteNBoard(@RequestParam(value="checkArray[]") ArrayList<Integer> deleteList) {
		
		int result = aService.noticeDeleteBoard(deleteList);
		return new Gson().toJson(result);
	}
	
	// 공지사항 체크박스 복구
	@ResponseBody
	@RequestMapping("reviveNBoard.kh")
	public String reviveNBoard(@RequestParam(value="checkArray[]") ArrayList<Integer> reviveList) {
		
		int result = aService.reviveNBoard(reviveList);
		return new Gson().toJson(result);
	}
	
	
	
	
	
	
}
