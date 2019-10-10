package com.kh.tido.inquiry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.tido.inquiry.model.service.InquiryService;

@Controller
public class InquiryContorller {

	@Autowired InquiryService iService;
	
	@RequestMapping("")
	public String InquiryInsert() {
		return null;
		
	}
}
