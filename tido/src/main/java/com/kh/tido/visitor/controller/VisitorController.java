package com.kh.tido.visitor.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.tido.visitor.model.vo.VisitorCount;

@Controller
public class VisitorController {

	private VisitorCount vc;
	
	@ResponseBody
	@RequestMapping(value="visitor.kh",method=RequestMethod.POST)
	public String temp(HttpServletRequest request) {
		vc = new VisitorCount();
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
		String visitor = "hi";
		System.out.println(vc);
		return visitor;
	}
	
	
}
