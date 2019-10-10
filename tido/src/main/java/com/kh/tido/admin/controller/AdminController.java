package com.kh.tido.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {	
		
	@RequestMapping("admin.kh")
	public String compProjectView() {
		return "admin/adminDashboard";
	}
	
	
	@RequestMapping("aManage.kh")
	public String adminManageView() {
		
		return "admin/userManagement";
	}
	
	
}
