package com.kh.tido.inquiry.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.inquiry.model.dao.InquiryDao;

@Service("iService")
public class InquiryServiceImpl implements InquiryService{

	@Autowired InquiryDao iDao;
}
