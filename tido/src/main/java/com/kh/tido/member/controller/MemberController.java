package com.kh.tido.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tido.board.model.vo.Board;
import com.kh.tido.board.model.vo.Reply;
import com.kh.tido.common.PaginationMember;
import com.kh.tido.inquiry.model.vo.Inquiry;
import com.kh.tido.member.model.service.MemberService;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.member.model.vo.MemberAuth;

@SessionAttributes({"loginUser", "msg"})
@Controller
public class MemberController {
	
	@Autowired
	MemberService mService;
	
	@RequestMapping("loginPage.kh")
	public String LoginPage() {
		return "member/loginPage";
	}
	
	@RequestMapping("minsertPage.kh")
	public String InsertPage() {
		return "member/joinPage";
	}
	
	@RequestMapping("emailRegistPage.kh")
	public String emailRegistPage() {
		return "member/emailRegistPage";
	}
	
	@RequestMapping("searchEmailPage.kh")
	public String searchEmailPage() {
		return "member/searchEmailPage";
	}
	
	@RequestMapping("myPageInfo.kh")
	public String myPageInfo() {
		return "member/mypage_info";
	}
	
	@RequestMapping("updatePage.kh")
	public String myPageUpdate() {
		return "member/mypage_update";
	}
	
	
	@RequestMapping(value="login.kh", method=RequestMethod.POST)
	public String loginMember(Member mem, Model model) {
		
		Member loginUser = mService.loginMember(mem);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.kh";
		}else {
			model.addAttribute("msg", "로그인에 실패하였습니다.");
			return "redirect:loginPage.kh";
		}
	}

	@RequestMapping("logout.kh")
	public String logoutMember(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:main.kh";
		
	}
	
	@RequestMapping(value = "register.kh")
	public String register(String email) throws Exception { // 회원가입하기
		mService.insertAuth(email);
		return "member/joinPage";
	}
	
	@RequestMapping(value = "emailConfirm.kh")
	public String emailConfirm(MemberAuth memberAuth, Model model) throws Exception { // 이메일 인증 확인
		
		if((mService.selectId(memberAuth.getMemberId()) == 1)) {
			model.addAttribute("emailMsg", "이미 등록된 이메일입니다.");
		}else {
			int result = mService.updateAuth(memberAuth);
			if(result == 1) {
				model.addAttribute("memberId", memberAuth.getMemberId());			
			}else {
				model.addAttribute("emailMsg", "메일이 인증되지 않았습니다.");
			}
		}
		return "/member/joinPage";
		
	}
	
	@ResponseBody
	@RequestMapping(value="idCheck.kh", method=RequestMethod.POST)
	public String idCheck(String memberId) {
		int result = mService.selectId(memberId);
		String check;
		if(result == 0) {
			check = "fail";
		}else {
			check = "success";
		} 
		return check;
	}
	
	
	@ResponseBody
	@RequestMapping(value="nameCheck.kh", method=RequestMethod.POST)
	public String nameCheck(String name) {
		int result = mService.selectName(name);
		String check;
		if(result == 0) {
			check = "fail";
		}else {
			check = "success";
		}
		return check;
	}
	
	@RequestMapping("minsert.kh")
	public String insertMember(Member mem, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		int result = mService.insertMember(mem, uploadFile, request);
		if(result == 1) {
			model.addAttribute("loginUser", mem).addAttribute("msg", "회원가입이 완료되었습니다!");
			return "redirect:main.kh";
		}else if(result == 0) {
			model.addAttribute("msg", "회원가입에 실패하였습니다.");
			return "common/errorPage";
		}else {
			model.addAttribute("msg", "프로필 사진 등록에 실패하였습니다. 회원 정보 수정에서 다시 등록해주세요.");
			return "redirect:main.kh";
		}
	}
	
	@RequestMapping("mupdate.kh")
	public String updateMember(Member mem, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		System.out.println("mem : " + mem);
		int result = mService.updateMember(mem, uploadFile, request);
		if(result == 1) {
			Member loginUser = mService.loginMember(mem);
			model.addAttribute("loginUser", loginUser).addAttribute("msg", "회원수정이 완료되었습니다!");
			return "redirect:myPageInfo.kh";
		}else if(result == 0) {
			model.addAttribute("msg", "회원수정에 실패하였습니다.");
			return "common/errorPage";
		}else {
			Member loginUser = mService.loginMember(mem);
			model.addAttribute("msg", "프로필 사진 등록에 실패하였습니다. 회원 정보 수정에서 다시 등록해주세요.");
			return "redirect:myPageInfo.kh";
		}
	}
	
	@RequestMapping("mdelete.kh")
	public String deleteMember(String id, SessionStatus status, Model model) {
		int result = mService.deleteMember(id);
		if(result > 0) {
			status.setComplete();
			model.addAttribute("msg", "회원탈퇴가 처리 되었습니다.");
			return "redirect:main.kh";
		}else {
			model.addAttribute("msg", "회원탈퇴 중 오류 발생 실패하였습니다.");
			return "redirect:common/errorPage";
		}
	}
	
	@RequestMapping("memberBoardList.kh")
	public String selectMemberBoard(Model model, String id, Integer page, String search, String sort) {
		
		int currentPage = page == null ? 1 : page;
		
		ArrayList<Board> list = null;
		
		if(search != null && search != "") {
			list = mService.selectMemberBoardSearch(id, currentPage, search, sort);
		}else {
			list = mService.selectMemberBoard(id, currentPage);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getcBoardContent().length() > 10) {
				list.get(i).setcBoardContent(list.get(i).getcBoardContent().substring(0, 9));
			}
		}
		
		System.out.println("list : " + list);
		
		System.out.println("search : " + search);
		System.out.println("sort : " + sort);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", PaginationMember.getPageInfo());
			if(search != null && search != "") {
				model.addAttribute("search", search);
				model.addAttribute("sort", sort);
			}
			return "member/mypage_board";
		}else {
			model.addAttribute("msg", "로그인 유저 글 조회 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("memberReplyList.kh")
	public String selectMemberReply(Model model, String id, Integer page, String search, String sort) {
		
		int currentPage = page == null ? 1 : page;
		
		System.out.println("id : " + id + ", currentPage : " + currentPage + ", search : " + search + ", sort : " + sort); 
		
		ArrayList<Reply> list = null;
		
		if(search != null && search != "") {
			list = mService.selectMemberReplySearch(id, currentPage, search);
		}else {
			list = mService.selectMemberReply(id, currentPage);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getCbReplyContent().length() > 10) {
				list.get(i).setCbReplyContent(list.get(i).getCbReplyContent().substring(0, 9));
			}
		}
		
		System.out.println("list : " + list);
		
		System.out.println("search : " + search);
		System.out.println("sort : " + sort);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", PaginationMember.getPageInfo());
			if(search != null && search != "") {
				model.addAttribute("search", search);
				model.addAttribute("sort", sort);
			}
			return "member/mypage_cbreply";
		}else {
			model.addAttribute("msg", "로그인 유저 댓글 조회 중 오류 발생");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("memberQnaList.kh")
	public String selectMemberQna(Model model, String id, Integer page, String search, String sort) {
		
		int currentPage = page == null ? 1 : page;
		
		System.out.println("id : " + id + ", currentPage : " + currentPage + ", search : " + search + ", sort : " + sort); 
		
		ArrayList<Inquiry> list = null;
		
		if(search != null && search != "") {
			list = mService.selectMemberInquirySearch(id, currentPage, search, sort);
		}else {
			list = mService.selectMemberInquiry(id, currentPage);
		}
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getiInquiryContent().length() > 10) {
				list.get(i).setiInquiryContent(list.get(i).getiInquiryContent().substring(0, 9));
			}
		}
		
		System.out.println("list : " + list);
		
		System.out.println("search : " + search);
		System.out.println("sort : " + sort);
		
		if(list != null) {
			model.addAttribute("list", list);
			model.addAttribute("pi", PaginationMember.getPageInfo());
			if(search != null && search != "") {
				model.addAttribute("search", search);
				model.addAttribute("sort", sort);
			}
			return "member/mypage_qna";
		}else {
			model.addAttribute("msg", "로그인 유저 댓글 조회 중 오류 발생");
			return "common/errorPage";
		}
	}
	
}
