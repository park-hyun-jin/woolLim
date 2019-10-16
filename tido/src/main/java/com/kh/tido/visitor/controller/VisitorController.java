package com.kh.tido.visitor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tido.visitor.model.service.VisitorService;
import com.kh.tido.visitor.model.vo.SetCount;
import com.kh.tido.visitor.model.vo.VisitorCount;

@Controller
public class VisitorController {
	
	@Autowired
	VisitorService vService;
	
	@RequestMapping("main.kh")
	public String mainView(Model model,HttpServletRequest request) {
		VisitorCount vc = new VisitorCount();
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
		vc.setVisit_agent(request.getHeader("User-Agent"));
		vc.setVisit_refer(request.getHeader("referer"));
		vc.setVisit_ip(ip);
		int result = vService.insertVisitor(vc);
		String visitor = vService.selectVisitor()+"";
		String projectCount = vService.projectCount();
		String boardCount = vService.boardCount();
		String memberCount = vService.memberCount();
		
		SetCount sc = new SetCount();
		sc.setProjectCount(projectCount);
		sc.setVisitCount(visitor);
		sc.setBoardCount(boardCount);
		sc.setMemberCount(memberCount);
		
		model.addAttribute("sc",sc);
		
		return "main";
	}
	
	
	public String temp(HttpServletRequest request) {
		VisitorCount vc = new VisitorCount();
		String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
		vc.setVisit_agent(request.getHeader("User-Agent"));
		vc.setVisit_refer(request.getHeader("referer"));
		vc.setVisit_ip(ip);
		int result = vService.insertVisitor(vc);
		String visitor = vService.selectVisitor()+"";
		
		return visitor;
	}
	
	@ResponseBody
	@RequestMapping(value="projectCount.kh",method=RequestMethod.POST)
	public String projectCount() {
		
		String result = vService.projectCount();
		return result;
	}
	
	
}
