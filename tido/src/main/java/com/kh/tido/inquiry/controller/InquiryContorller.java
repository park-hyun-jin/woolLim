package com.kh.tido.inquiry.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.common.Pagination3;
import com.kh.tido.inquiry.model.service.InquiryService;
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.inquiry.model.vo.Search;

@Controller
public class InquiryContorller {

	@Autowired InquiryService iService;
	
	@RequestMapping("iList.kh")
	public ModelAndView inquiryList(ModelAndView mv, Integer page) {
			
			
			int currentPage = page == null ? 1 : page;
			
			
			
			
			ArrayList<Inquiry> list = iService.selectList(currentPage);
			
			if(list != null) { 
				
				mv.addObject("list", list).
				addObject("pi", Pagination3.getPageInfo()).
				setViewName("inquiry/inquiryListView");	
			}else{
				mv.addObject("msg", "게시물 목록 조회 실패").
				setViewName("common/errorPage");
			}
			
			return mv;
			
		}
	@RequestMapping(value="qinsert.kh" , method=RequestMethod.POST)
	public String inquiryinsert(Inquiry inquiry, HttpServletRequest request, MultipartFile uploadFile, Model model) {
		System.out.println(inquiry);
		int result = iService.insertInquiry(inquiry, uploadFile, request);
		
		String path = null;
		
		if(result >0) {
			path="redirect:iList.kh";
		}else {
			model.addAttribute("msg", "게시글 등록 실패");
			path = "common/errorPage";
		}
		return path;
		
	}
	@RequestMapping("idetail.kh")
	public ModelAndView inquiryDetail(int iNo,
			ModelAndView mv, 
			Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		Inquiry inquiry = iService.selectinquiry(iNo);
		
		if(inquiry != null) {
			mv.addObject("inquiry", inquiry)
			.addObject("currentPage", currentPage)
			.setViewName("inquiry/inquiryDetailView");
		}else {
			mv.addObject("msg", "게시물 목록 조회 실패").
			setViewName("common/errorPage");
		}
		return mv;
		
	}
	

	@RequestMapping(value="iupView.kh")
	public String inquiryUpdateView(int iNo, Model model) {
		Inquiry inquiry = iService.selectinquiry(iNo);
		
		model.addAttribute("inquiry", inquiry);
		
		return "inquiry/inquiryUpdateView";
	}
	
	@RequestMapping("iupdate.kh")
	public ModelAndView updateinquiry(ModelAndView mv, 
			Inquiry inquiry, 
			HttpServletRequest request,
			MultipartFile reloadFile,
			Integer page){
		System.out.println(inquiry);
		int result = iService.updateinquiry(inquiry, reloadFile, request);
		
		if(result > 0) {
			mv.setViewName("redirect:idetail.kh?iNo=" +inquiry.getiNo()+"&page"+page);
			
		}else {
			mv.addObject("msg", "게시글 수정 실패")
			.setViewName("common/errorPage");
		}
		
		return mv;
	}
		
	@RequestMapping("idelete.kh")
	public ModelAndView inquiryDelete(int iNo, ModelAndView mv) {

		int result = iService.deleteInquiry(iNo);

		if (result > 0) {
			mv.setViewName("redirect:iList.kh");

		} else {
			mv.addObject("msg", "삭제 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	@RequestMapping("isearch.kh")
	public String inquirySearch(Search search, Model model, Integer page){
		int currentPage = page == null ? 1 : page;
		ArrayList<Inquiry> searchList = iService.searchList(search,currentPage);
		
		if(searchList != null) {
			model.addAttribute("list", searchList);
			model.addAttribute("search", search);
			model.addAttribute("pi",Pagination3.getPageInfo());
			return "inquiry/inquiryListView";
		}else {
			model.addAttribute("msg","게시물 목록 조회 실패");
			return "common/errorPage";
		}

	}
}
