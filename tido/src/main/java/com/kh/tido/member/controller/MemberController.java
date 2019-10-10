package com.kh.tido.member.controller;

import java.io.IOException;

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
	
	@RequestMapping(value="login.kh", method=RequestMethod.POST)
	public String loginMember(Member mem, Model model) {
		
		Member loginUser = mService.loginMember(mem);
		
		if(loginUser != null) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.kh";
		}else {
			model.addAttribute("msg", "로그인 실패!");
			return "common/errorPage";
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
		System.out.println("----------------------------------------------------------------");
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
	public String InsertMember(Member mem, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		System.out.println("mem : " + mem);
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
	
	
}
