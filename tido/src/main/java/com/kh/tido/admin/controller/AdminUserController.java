package com.kh.tido.admin.controller;

import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.admin.model.service.AdminUserService;
import com.kh.tido.board.model.vo.Board;
import com.kh.tido.member.model.vo.Member;

@Controller
public class AdminUserController {	
	
	@Autowired
	private AdminUserService auService;

	
	@RequestMapping("adminUserManage.kh")
	public ModelAndView adminManageView(ModelAndView mv) {
		ArrayList<Member> list = auService.memberList();
		
		if(list != null) {			
			mv.addObject("list", list).			
			setViewName("admin/userManagement");
		}else {
			mv.addObject("msg","게시물 목록 조회 실패").setViewName("common/errorPage");			
		}		
		return mv;
	}
	
//	@RequestMapping("amdetail.kh")
//	public ModelAndView adminManageDetail(ModelAndView mv, int id) {
//		Member mem = 
//		
//		
//		return mv;
//	}
//	
	
	
	@ResponseBody
	@RequestMapping(value="aDeleteMember.kh",method=RequestMethod.POST)
	public int aDeleteMember(@RequestParam(value="checkArray[]") ArrayList<String> aMemberList) {
		int result = auService.aDeleteMember(aMemberList);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="aReviveMember.kh",method=RequestMethod.POST)
	public int aReviveMember(@RequestParam(value="checkArray[]") ArrayList<String> aMemberList) {
		int result = auService.aReviveMember(aMemberList);
		return result;
	}
	
	@RequestMapping("amdetail.kh")
	public String aMemberDetail(String id, Model model) {
		Member mem = auService.aMemberDetail(id);
		ArrayList<Board> bList = auService.aMemberBoardList(id);
		if(mem!=null) {
			model.addAttribute("member",mem);
			model.addAttribute("bList",bList);
			return "admin/adminUserDetail";
		}else {
			model.addAttribute("msg","게시물 목록 조회 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("abDetail.kh")
	public ModelAndView adminboardDetail(ModelAndView mv, Integer page, int cBoardNo) {
		int currentPage = page == null ? 1 : page;
		Board board = auService.detailBoard(cBoardNo);		
		if(board != null) {
			mv.addObject("board", board).addObject("currentPage", currentPage).setViewName("admin/adminBoardDetailView");
		}else {
			mv.addObject("msg", "조회 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
}
