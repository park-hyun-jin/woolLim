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
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.notice.model.service.NoticeService;
import com.kh.tido.notice.model.vo.Notice;
import com.kh.tido.report.model.vo.Report;

@Controller
public class AdminController {

	@Autowired
	private BoardService bService;
	@Autowired
	private AdminService aService;

	@Autowired
	private NoticeService nService;

	@RequestMapping("admin.kh")
	public String compProjectView() {
		return "admin/adminDashboard";
	}

	@RequestMapping("chat-ws.kh")
	public String webSocket() {
		return "web/chat-ws";
	}

	@RequestMapping("adminBdetail.kh")
	public ModelAndView boardDetail(ModelAndView mv, Integer page, int cBoardNo) {
		int currentPage = page == null ? 1 : page;
		Board board = bService.selectBoard(cBoardNo);
		System.out.println(board);
		if (board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("board/boardDetailView");
		} else {
			mv.addObject("msg", "조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	// 게시판 관리 STATUS Y만
	@RequestMapping("adminCboardListY.kh")
	public ModelAndView cboardList(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Board> list = aService.selectList(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboardY");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	//// 게시판 관리 STATUS N만
	@RequestMapping("adminCboardListN.kh")
	public ModelAndView cboardListN(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Board> list = aService.selectListN(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboardN");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	// 게시판 관리 삭제,비삭제 게시글 모두 조회
	@RequestMapping("adminCboardListAll.kh")
	public ModelAndView cboardListAll(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Board> list = aService.selectListAll(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminCboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	// CBOARD 체크박스 삭제
	@ResponseBody
	@RequestMapping("deleteCboard.kh")
	public int deleteBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> deleteList) {

		int result = aService.deleteBoard(deleteList);
		return result;
		
	}

	// CBOARD 체크박스 삭제 복구
	@ResponseBody
	@RequestMapping("reviveCBoard.kh")
	public String reviveCBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> reviveList) {

		int result = aService.reviveCBoard(reviveList);
		return new Gson().toJson(result);
	}

	// 자유게시판 검색
	@RequestMapping("adminBsearch.kh")
	public String boardSearch(Search search, Model model) {

		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		System.out.println(search.getExistFile());
		// 체크 O : on
		// 체크 X : null

		ArrayList<Board> searchList = aService.searchList(search);

		for (Board b : searchList) {
			System.out.println(b);
		}

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "admin/adminCboardAll";
	}

	// 공지사항 리스트 STATS -Y-만
	@RequestMapping("adminNboardListY.kh")
	public ModelAndView nboardList(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Notice> list = aService.noticeSelectList(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboardY");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

////게시판 관리 STATUS N만
	@RequestMapping("adminNboardListN.kh")
	public ModelAndView nboardListN(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Notice> list = aService.noticeSelectListN(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboardN");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	// 게시판 관리 삭제,비삭제 게시글 모두 조회
	@RequestMapping("adminNboardListAll.kh")
	public ModelAndView nboardListAll(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Notice> list = aService.noticeSelectListAll(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminNboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	@RequestMapping("adminNdetail.kh")
	public String noticeDetail(int nNo, Model model) {

		Notice notice = nService.selectOne(nNo);

		if (notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		} else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}

	}

	// 공지사항 검색
	@RequestMapping("adminNsearch.kh")
	public String noticeSearch(Search search, Model model) {

		System.out.println(search.getSearchCondition());
		System.out.println(search.getSearchValue());
		System.out.println(search.getExistFile());
		// 체크 O : on
		// 체크 X : null

		ArrayList<Notice> searchList = aService.noticeSearchList(search);

		for (Notice n : searchList) {
			System.out.println(n);
		}

		model.addAttribute("list", searchList);
		model.addAttribute("search", search);
		return "admin/adminNboardAll";
	}

	// 공지사항 체크박스 삭제
	@ResponseBody
	@RequestMapping("deleteNBoard.kh")
	public String deleteNBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> deleteList) {

		int result = aService.noticeDeleteBoard(deleteList);
		return new Gson().toJson(result);
	}

	// 공지사항 체크박스 복구
	@ResponseBody
	@RequestMapping("reviveNBoard.kh")
	public String reviveNBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> reviveList) {

		int result = aService.reviveNBoard(reviveList);
		return new Gson().toJson(result);
	}

	// 문의사항 관리 STATUS Y만
	@RequestMapping("adminIboardListY.kh")
	public ModelAndView iboardList(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Inquiry> list = aService.inquiryselectList(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminIboardY");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	//// 문의사항 관리 STATUS N만

	@RequestMapping("adminIboardListN.kh")
	public ModelAndView iboardListN(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Inquiry> list = aService.inquiryselectListN(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminIboardN");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}

	// 문의사항 관리 삭제,비삭제 게시글 모두 조회
	@RequestMapping("adminIboardListAll.kh")
	public ModelAndView iboardListAll(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Inquiry> list = aService.inquiryselectListAll(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminIboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
			
		}
		return mv;
	}
		
		@RequestMapping("adminIsearch.kh")
		public String inquirySearch(Search search, Model model){
			
			System.out.println(search.getSearchCondition());
			System.out.println(search.getSearchValue());
			System.out.println(search.getExistFile());
			// 체크 O : on
			// 체크 X : null
			
			ArrayList<Inquiry> inquirySearchList 
				= aService.inquirySearchList(search);
			
			for(Inquiry i : inquirySearchList) {
				System.out.println(i);
			}
			
			
			model.addAttribute("list", inquirySearchList);
			model.addAttribute("search", search);
			return "admin/adminIboardAll";

		}

	
	

	

	// 문의사항 체크박스 삭제
	@ResponseBody
	@RequestMapping("deleteIBoard.kh")
	public String deleteIBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> deleteList) {

		int result = aService.inquiryDeleteBoard(deleteList);
		return new Gson().toJson(result);
	}

	// 문의사항 체크박스 복구
	@ResponseBody
	@RequestMapping("reviveIBoard.kh")
	public String reviveIBoard(@RequestParam(value = "checkArray[]") ArrayList<Integer> reviveList) {

		int result = aService.reviveIBoard(reviveList);
		return new Gson().toJson(result);
	}

	// 신고관리 삭제,비삭제 게시글 모두 조회
	
	@RequestMapping("adminRboardListAll.kh")
	public ModelAndView rboardListAll(ModelAndView mv, Integer page) {

		int currentPage = page == null ? 1 : page;

		ArrayList<Report> list = aService.rboardListAll(currentPage);

		System.out.println(list);

		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminRboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}

		return mv;
	}
	
	
	@RequestMapping("adminRrnosearch.kh")
	public ModelAndView reportSearch(int rRrno,ModelAndView mv) {
		ArrayList<Report> list = aService.reportSearch(rRrno);
		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminRboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	// 신고물 유형 옵션
	@RequestMapping("adminReportTypeSearch.kh")
	public ModelAndView adminReportTypeSearch(int rReportType, ModelAndView mv) {
		ArrayList<Report> list = aService.adminReportTypeSearch(rReportType);
		if (list != null) {

			mv.addObject("list", list).addObject("pi", Pagination.getPageInfo()).setViewName("admin/adminRboardAll");
		} else {
			mv.addObject("msg", "게시글 목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
		// 신고관리 게시판 검색
		@RequestMapping("adminRsearch.kh")
		public String adminRsearch(Search search, Model model) {

			ArrayList<Report> searchList = aService.adminRsearch(search);

			for (Report r : searchList) {
				System.out.println(r);
			}

			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			return "admin/adminRboardAll";
		}
		
		// 신고관리 상세
		@RequestMapping("adminRdetail.kh")
		public ModelAndView adminRdetail(ModelAndView mv, int rReportNo) {
			
			ArrayList<Report> list = aService.reportDetailBoard(rReportNo);
			
			if (list != null) {
				mv.addObject("list", list).setViewName("admin/adminRboarDetail");
			} else {
				mv.addObject("msg", "조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
		
		@RequestMapping("adminReport.kh")
		public ModelAndView adminReport(ModelAndView mv, int rReportNo) {
			
			int result = aService.adminReport(rReportNo);
			
			if (result>0) {
				mv.addObject("result", result).setViewName("admin/adminRboardAll");
			} else {
				mv.addObject("msg", "조회 실패").setViewName("common/errorPage");
			}
			return mv;
		}
		
		

}
