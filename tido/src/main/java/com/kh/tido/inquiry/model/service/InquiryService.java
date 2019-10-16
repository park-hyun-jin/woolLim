package com.kh.tido.inquiry.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.inquiry.model.vo.Search;

public interface InquiryService {

	public abstract ArrayList<Inquiry> selectList(int currentPage);

	int insertInquiry(Inquiry inquiry, MultipartFile uploadFile, HttpServletRequest request);

	public abstract Inquiry selectinquiry(int iNo);

	public abstract int updateinquiry(Inquiry inquiry, MultipartFile reloadFile, HttpServletRequest request);

	public abstract int deleteInquiry(int iNo);

	public abstract ArrayList<Inquiry> searchList(Search search, int currentPage);
	
}
