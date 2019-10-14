package com.kh.tido.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.admin.model.service.AdminUserService;
import com.kh.tido.member.model.vo.Member;

@Controller
public class AdminUserController {	
	
	@Autowired
	private AdminUserService aService;
		
	@RequestMapping("admin.kh")
	public String compProjectView() {
		return "admin/adminDashboard";
	}
	
	
	@RequestMapping("adminUserManage.kh")
	public ModelAndView adminManageView(ModelAndView mv) {
		ArrayList<Member> list = aService.memberList();
		
		if(list != null) {			
			mv.addObject("list", list).			
			setViewName("admin/userManagement");
		}else {
			mv.addObject("msg","게시물 목록 조회 실패").setViewName("common/errorPage");			
		}		
		return mv;
	}
	
	
}
