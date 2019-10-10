package com.kh.tido.report.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tido.member.model.vo.Member;
import com.kh.tido.report.model.service.ReportService;
import com.kh.tido.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired ReportService rService;
	
	@ResponseBody
	@RequestMapping("insertReport.kh")
	public String ReportInsert(Report report,HttpServletRequest request ) {
		report.setrMemberId(((Member)request.getSession().getAttribute("loginUser")).getId());
		System.out.println(report);
		int result = rService.insertReport(report);
		return result+"";
	}
}
