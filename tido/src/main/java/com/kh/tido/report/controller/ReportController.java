package com.kh.tido.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.report.model.service.ReportService;
import com.kh.tido.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired ReportService rService;
	
	@RequestMapping(value="report.kh", method=RequestMethod.POST)
	public String ReportInsert(Report report ,HttpServletRequest request, Model model) {
		System.out.println(report);
		int result = rService.insertReport(report);
		if(result > 0) {
			return "redirect:";
		}else {
			model.addAttribute("msg","공지사항 등록 실패");
			return "common/errorPage";

		
	}
}
}
