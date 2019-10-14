package com.kh.tido.visitor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tido.visitor.model.service.VisitorService;
import com.kh.tido.visitor.model.vo.VisitorCount;

@Controller
public class VisitorController {
	
	@Autowired
	VisitorService vService;
	
	@ResponseBody
	@RequestMapping(value="visitor.kh",method=RequestMethod.POST, produces="application/text; charset=utf8")
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
	
	
}
