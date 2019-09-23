package com.kh.tido;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class HomeController {
	@RequestMapping("main.kh")
	public String mainView() {
		return "project/main";
	}
}
