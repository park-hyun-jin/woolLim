package com.kh.tido.notice.controller;

import java.io.File;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.tido.common.Pagination;
import com.kh.tido.notice.model.service.NoticeService;
import com.kh.tido.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("List.kh")
	public ModelAndView noticeList(ModelAndView mv, Integer page) {
		
		int currentPage = page == null ? 1 : page;
		
		ArrayList<Notice> list = nService.selectList(currentPage);
		
		if(list !=null) {
			mv.addObject("list", list).
			addObject("pi", Pagination.getPageInfo()).
			setViewName("notice/noticeListView");
		}else{
			mv.addObject("msg", "게시물 목록 조회 실패").
			setViewName("common/errorPage");
		}
		
		return mv;
	}
	// 공지사항 등록
		@RequestMapping(value="ninsert.kh",method=RequestMethod.POST)
		public String noticeInsert(String pnoticeTitle,String pnoticeContent,HttpServletRequest request, Model model,MultipartFile uploadFile )  {
			System.out.println(pnoticeTitle);
			System.out.println(pnoticeContent);
			System.out.println(uploadFile);
//			if(uploadFile.getOriginalFilename() != null) {
//				
//				String filePath = saveFile(uploadFile, request);
//				
//				if(filePath != null) {
//					// DB에 저장할 파일 세팅
//					notice.setPnoticeFilePath(uploadFile.getOriginalFilename());
//				}
//			}
//			int result = nService.noticeList(notice);
//			if(result > 0) {
//				return "redirect:nlist.kh";
//			}else {
//				
//				model.addAttribute("msg","공지사항 등록 실패");
//				return "common/errorPage";
//			}
			return null;
		}
		
		public String saveFile(MultipartFile file, 
				   HttpServletRequest request) {
			

			String root 
			= request.getSession().getServletContext().getRealPath("resources");
			
			String savePath = root + "\\nuploadFiles";
			
			System.out.println("savePath : " + savePath);
			

			File folder = new File(savePath);

	
			if(!folder.exists()) {
				folder.mkdir(); 
	
	String filePath 
	= folder + "\\" 
			+ file.getOriginalFilename();
	
	
	try {
		file.transferTo(new File(filePath));

	}catch(Exception e) {
		System.out.println("파일 전송 에러  " + e.getMessage());
	}
	
	
			}	return savePath;
		}

	
		}


