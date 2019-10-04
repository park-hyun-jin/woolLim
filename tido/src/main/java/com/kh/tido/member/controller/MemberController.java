package com.kh.tido.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.tido.member.model.service.MemberService;
import com.kh.tido.member.model.vo.Member;

@SessionAttributes({"loginUser", "msg"})
@Controller
public class MemberController {
	
	@Autowired
	MemberService mService;
	
	@RequestMapping("loginPage.kh")
	public String goLoginPage() {
		
		return "member/loginPage";
	}
	
	@RequestMapping("minsertPage.kh")
	public String goInsertPage() {
		
		return "member/joinPage";
	}
	
	@RequestMapping(value="login.kh", method=RequestMethod.POST)
	public String memberLogin(Member mem, Model model) {
		
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
	public String memberLogout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:main.kh";
		
	}
	
	@RequestMapping(value = "joinPage.kh", method = RequestMethod.GET) // 회원가입창 보기
	public String registerGet() throws Exception {
		return "/user/joinPage";
	}
	
	@RequestMapping(value = "register.kh", method = RequestMethod.POST)
	public String registerPost(Member mem, RedirectAttributes rttr) throws Exception { // 회원가입하기
		mService.create(mem);
		rttr.addFlashAttribute("msg", "인증 성공");
		return "member/joinPage";
	}

	@RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
		public String emailConfirm(String memberId, String memberAuthKey, Model model) throws Exception { // 이메일 인증 확인창
			mService.userAuth(memberId, memberAuthKey);
			model.addAttribute("id", memberId);

			return "/member/joinPage";
		}
	
	
}
