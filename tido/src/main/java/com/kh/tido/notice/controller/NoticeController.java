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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tido.common.Pagination;
import com.kh.tido.notice.model.service.NoticeService;
import com.kh.tido.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	

	@RequestMapping("nlist.kh")
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
	@RequestMapping(value="ninsert.kh", method=RequestMethod.POST)
	public String noticeInsert(Notice notice, HttpServletRequest request, Model model,
								@RequestParam(name="pnoticeFile", required=false) MultipartFile pnoticeFile)  {
		System.out.println(notice);
		System.out.println(pnoticeFile);
		// 업로된 파일을 서버에 저장하는 작업
		if(!pnoticeFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(pnoticeFile, request);
			if(filePath != null) {
				// DB에 저장할 파일 세팅
				notice.setPnoticeFilePath(pnoticeFile.getOriginalFilename());
			}
		}
		int result = nService.insertNotice(notice);
		if(result > 0) {
			return "redirect:nlist.kh";
		}else {
			model.addAttribute("msg","공지사항 등록 실패");
			return "common/errorPage";
		}
	}
	
	
	// 파일 저장 메소드
	public String saveFile(MultipartFile file, 
						   HttpServletRequest request) {
		
		// 파일 저장 경로 설정
		String root 
			= request.getSession().getServletContext().getRealPath("resources");
		
		String savePath = root + "\\nuploadFiles";
		
		System.out.println("savePath : " + savePath);
		
		// 저장 폴더 선택
		File folder = new File(savePath);
		
		// 만약 폴더가 없을 경우 자동 생성 시키기
		if(!folder.exists()) {
			folder.mkdir(); 
		}
		
		
		String filePath 
			= folder + "\\" 
			  + file.getOriginalFilename();
		
		// 공지사항 게시판은 관리자가 관리함
		// -> 관리자가 업로드할 파일을 별도로 규칙성 있게 
		//    관리하기 때문에 파일을 원본 이름 그대로 저장하겠음.
		
		try {
			file.transferTo(new File(filePath));
			// 이 때 파일 저장됨.
		}catch(Exception e) {
			System.out.println("파일 전송 에러  " + e.getMessage());
		}
		
		return filePath;
	}
	
	@RequestMapping("ndetail.kh")
	public String noticeDetail(int nNo, Model model) {
		
		Notice notice = nService.selectOne(nNo);
		
		if(notice != null) {
			model.addAttribute("notice", notice);
			return "notice/noticeDetailView";
		}else {
			model.addAttribute("msg", "공지사항 상세조회 실패");
			return "common/errorPage";
		}
		
	}

	public void deleteFile(String fileName, HttpServletRequest request) {

		String root = request.getSession().getServletContext().getRealPath("resources");

		String savePath = root + "\\nuploadFiles";


		File deleteFile = new File(savePath + "\\" + fileName);


		if (deleteFile.exists()) {
			deleteFile.delete();
		}

	}
	
	@RequestMapping(value="nupView.kh")
	public String noticeUpdateView(int nNo, Model model) {
		model.addAttribute("notice", nService.selectOne(nNo));
		
		return "notice/noticeUpdateView";
	}
	
	@RequestMapping(value="nupdate.kh", method=RequestMethod.POST)
	public String noticeUpdate(Notice notice, Model model,
							   HttpServletRequest request,
							   MultipartFile reloadFile) {
		
		// 새로 업로드된 파일이 있을 경우
		if(reloadFile != null && !reloadFile.isEmpty()) {
			
			// 기존 업로드 파일이 있을 경우
			if(notice.getPnoticeFilePath() != null) { 

				// 기존 파일 삭제
				deleteFile(notice.getPnoticeFilePath(), request);
			}
			
			// 새로 업로드된 파일 저장
			String savePath = saveFile(reloadFile, request);
			
			// 새로운 파일이 잘 저장이 되었다면
			if(savePath != null) {
				notice.setPnoticeFilePath(reloadFile.getOriginalFilename());
			}else {
				notice.setPnoticeFilePath(null);
			}
			
		}
			
		int result = nService.updateNotice(notice);
			
		if (result > 0) {
			return "redirect:ndetail.kh?nNo="+notice.getnNo();
		} else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "common/errorPage";
		}	
	}
	
	// 삭제
	@RequestMapping("ndelete.kh")
	public String noticeDelete(int nNo, Model model, 
								HttpServletRequest request,
								RedirectAttributes rd) {

		// 파일 지우기 위해 nId의 공지사항 조회
		Notice notice = nService.selectOne(nNo); 
		
		int result = nService.deleteNotice(nNo); 

		
		if (result > 0) {
			// 해당 공지사항에 첨부파일이 존재했을 경우
			if (notice.getPnoticeFilePath() != null) { 
				deleteFile(notice.getPnoticeFilePath(), request);
			}

			rd.addFlashAttribute("msg", "게시글 삭제 성공");
			return "redirect:nlist.kh";
		} else {
			model.addAttribute("msg", "공지사항 수정 실패");
			return "common/errorPage";
		}
	}
	
	
	}
		


