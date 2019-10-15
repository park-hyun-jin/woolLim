package com.kh.tido.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.kh.tido.board.model.service.BoardService;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.board.model.vo.Search;
import com.kh.tido.common.Pagination;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.notice.model.vo.Notice;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService bService;
	
	@RequestMapping("bList.kh")
	public ModelAndView boardList(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		ArrayList<Board> list = bService.selectList(currentPage);
		
		if(list != null) {
			mv.addObject("list", list).
			addObject("pi",Pagination.getPageInfo()).
			setViewName("board/boardListView");
		}else {
			mv.addObject("msg", "목록 조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}

	@RequestMapping("binsertView.kh")
	public String boardinsertView() {
		return "board/boardInsertForm";
	}

	@RequestMapping("binsert.kh")
	public String boardInsert(Board board, HttpServletRequest request, MultipartFile uploadFile, Model model) {
		System.out.println(board);
		int result = bService.insertBoard(board, uploadFile, request);

		String path = null;
		if(result > 0) {
			path = "redirect:bList.kh";
		}else {
			model.addAttribute("msg", "게시글 등록 실패");
			path = "common/errorPage";
		}
		return path;
	}

	@RequestMapping("bdetail.kh")
	public ModelAndView boardDetail(ModelAndView mv, Integer page, int cBoardNo) {
		int currentPage = page == null ? 1 : page;
		System.out.println(cBoardNo);
		Board board = bService.selectBoard(cBoardNo);		
		if(board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("board/boardDetailView");
		}else {
			mv.addObject("msg", "조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("bupView.kh")
	public ModelAndView boardUpdateView(ModelAndView mv, int cBoardNo, Integer page) {
		int currentPage = page == null ? 1 : page;
		
		Board board = bService.selectBoard(cBoardNo);
		mv.addObject("board", board).addObject("currentPage", currentPage)
		.setViewName("board/boardUpdateView");
		
		return mv;
	}
	
	@RequestMapping("bdelete.kh")
	public ModelAndView boardDelete(ModelAndView mv, int cBoardNo) {
		int result = bService.deleteBoard(cBoardNo);
		if(result > 0) {
			mv.setViewName("redirect:bList.kh");
		}else {
			mv.addObject("msg", "게시글 삭제 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("bupdate.kh")
	public ModelAndView boardUpdate(ModelAndView mv, Board board, HttpServletRequest request, MultipartFile reloadFile, Integer page) {
		
		int result = bService.updateBoard(board, reloadFile, request);
		
		if(result > 0) {
			mv.setViewName("redirect:bdetail.kh?cBoardNo="+board.getcBoardNo()+"&page="+page);
		}else {
			mv.addObject("msg", "게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("addReply.kh")
	@ResponseBody
	public String addReply(Reply reply, HttpSession session) {
		String cBoardContent = ((Member)session.getAttribute("loginUser")).getId();
		reply.setMemberId(cBoardContent);
		
		int result = bService.insertReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="rList.kh", produces="application/json; charset=UTF-8")
	@ResponseBody
	public String listReply(int cBoardNo) {
		ArrayList<Reply> list = bService.selectReply(cBoardNo);
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		return gson.toJson(list);

		}
	


	
	// 검색
		@RequestMapping("bSearch.kh")
		public String boardSearch(Search search, Model model){
			
			System.out.println(search.getSearchCondition());
			System.out.println(search.getSearchValue());
			System.out.println(search.getExistFile());
			// 체크 O : on
			// 체크 X : null
			
			ArrayList<Board> searchList 
				= bService.searchList(search);
			
			for(Board n : searchList) {
				System.out.println(n);
			}
			
			
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			return "board/boardListView";
		}
		
}

