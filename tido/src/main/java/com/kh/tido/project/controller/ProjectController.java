package com.kh.tido.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.tido.project.model.service.ProjectService;
import com.kh.tido.project.model.vo.Project;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	
	
	@ResponseBody
	@RequestMapping("savePjt.kh")
	public String saveProject(Project project) {
		
		System.out.println(project);
		int result= pService.saveProject(project);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("openPjt.kh")
	public String openProject() {
	
		Project project= pService.openProject();
		
		return new Gson().toJson(project);
	}
	
}
