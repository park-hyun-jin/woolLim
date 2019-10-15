package com.kh.tido.inquiry.model.service;

import java.io.File;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.kh.tido.common.Pagination3;
import com.kh.tido.inquiry.model.dao.InquiryDao;
import com.kh.tido.inquiry.model.exception.InquiryException;
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.inquiry.model.vo.PageInfo;
import com.kh.tido.inquiry.model.vo.Search;


@Service("iService")
public class InquiryServiceImpl implements InquiryService{

	@Autowired InquiryDao iDao;

	@Override
	public  ArrayList<Inquiry> selectList(int currentPage) {
		
		int listCount = iDao.getListCount();
		
		PageInfo pi = Pagination3.getPageInfo(currentPage, listCount);

		return iDao.selectList(pi);
	}

	@Override
	public int insertInquiry(Inquiry inquiry, MultipartFile uploadFile, HttpServletRequest request) {
		
		
		inquiry.setiInquiryContent(inquiry.getiInquiryContent().replace("\n", "<br>"));
				
				String renameFileName = null;
				
				// 업로드 된 파일이 있을 경우 파일명 변경
				if(!uploadFile.getOriginalFilename().equals("")) {
					renameFileName = renameFile(uploadFile);//변경된 파일명
					//System.out.println(renameFileName);
					
					inquiry.setiInquiryOriginFilename(uploadFile.getOriginalFilename());
					inquiry.setiInquiryChangeFilename(renameFileName);
				}
				
				// DB에 게시글 저장
				int result = iDao.insertInquiry(inquiry);
				
				
				// 서버에 파일 저장
				if(renameFileName != null && result == 1) {
					result = saveFile(renameFileName, uploadFile, request);
				}
				
				
				return result;
			}
			
			
			// 파일명 변경 메소드
			public String renameFile(MultipartFile file){
				
				// "년월일시분초.확장자" 로 파일명 변경
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				
				String originFileName = file.getOriginalFilename();
				
				String renameFileName = sdf.format(new Date()) + "." + originFileName.substring(originFileName.lastIndexOf(".") + 1);
				return renameFileName;
				
			}
			
			// 파일 저장 메소드
			
			public int saveFile(String renameFileName, MultipartFile uploadFile, HttpServletRequest request) {
				
				// 파일 저장 경로 설정
				String root = request.getSession().getServletContext().getRealPath("resources");
				
				String savePath = root + "\\iuploadFiles";
				
				// 저장 폴더 선택
				File folder = new File(savePath);
				
				// 만약 해당 폴더가 없는 경우
				if(!folder.exists()) {
					folder.mkdir(); //폴더 생성
				}
				
				String filePath =  folder + "\\" + renameFileName;
				
				// 파일 저장 성공 여부 ( 성공 1, 실패 0 )
				int result = 0;
				
				try {
					uploadFile.transferTo(new File(filePath));
					//	업로드된 파일을 filePath에 지정된
					//  경로 + 파일명으로 저장하겠다.
					//	-> IOException 예외 처리 필요
					result = 1;
					
				}catch (Exception e) {
					System.out.println("파일 전송 에러 : " + e.getMessage());
					throw new InquiryException("파일 전송 에러");
				}
				
				return result;
				
			}

			@Override
			public Inquiry selectinquiry(int iNo) {
				
				return iDao.selectinquiry(iNo);
			}

			@Override
			public int updateinquiry(Inquiry inquiry, MultipartFile reloadFile, HttpServletRequest request) {
				// textarea의 개행문자 <br> 변경
				
				inquiry.setiInquiryContent(inquiry.getiInquiryContent().replace("\n", "<br>"));
							
				// 새로 업로드된 파일이 있을 경우
				
				String iInquiryOriginFilename = null;	// 이전 파일명
				String iInquiryChangeFilename = null;	//	 새 파일 변경명
				
				if(!reloadFile.getOriginalFilename().equals("")) {

					// 이전 파일 삭제를 위해 이전 파일명 저장
					iInquiryOriginFilename = inquiry.getiInquiryChangeFilename();
					
					// 새로 업로드된 파일의 이름을 변경
					iInquiryChangeFilename = renameFile(reloadFile);
					
					inquiry.setiInquiryOriginFilename(reloadFile.getOriginalFilename());
					inquiry.setiInquiryChangeFilename(iInquiryChangeFilename);
				}
				// DB에 수정된 inquiry 정보를  update
				
				int result = iDao.updateInquiry(inquiry);
				
				// 새로 업로드된 파일 서버에 저장
				
				if(iInquiryChangeFilename != null  && result == 1) {
					result += saveFile(iInquiryChangeFilename, reloadFile, request);
				} 
				
				// 기존 파일 삭제
				if(result ==2 ) {
					deleteFile(iInquiryOriginFilename, request);
				}
				
				return result;
			
			}
			
			public int deleteFile(String fileName, 
					HttpServletRequest request) {
				// 파일 저장 경로 설정
				String root 
				= request.getSession().getServletContext().getRealPath("resources");
				
				String savePath = root + "\\iuploadFiles";
				
				// 삭제할 파일 경로 + 파일명
				File deleteFile = new File(savePath + "\\" + fileName);
				
				// 해당 파일이 존재할 경우 삭제
				if(deleteFile.exists()) {
					deleteFile.delete();
				}
				
				return 0;
			}

			@Override
			public int deleteInquiry(int iNo) {
				
				return iDao.deleteInquiry(iNo);
			}

			@Override
			public ArrayList<Inquiry> searchList(Search search, int currentPage) {
				int listCount = iDao.getListCount();
				
				PageInfo pi = Pagination3.getPageInfo(currentPage, listCount);
				
				return iDao.searchList(search, pi);
			}
			
	}

