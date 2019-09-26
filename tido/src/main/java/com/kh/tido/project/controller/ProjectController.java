package com.kh.tido.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.tido.project.model.service.ProjectService;
import com.kh.tido.project.model.vo.ProjectFile;

@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	
	
	@ResponseBody
	@RequestMapping("savePjt.kh")
	public String saveProject(ProjectFile project,HttpServletRequest request) {
		
		System.out.println(project);
		int result= pService.saveProject(project,request);
		
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("openPjt.kh")
	public String openProject(HttpServletRequest request) {
		
		int pNo = 64;
	
		ProjectFile project= pService.openProject(pNo, request);
		
		return new Gson().toJson(project);
	}
	
	@RequestMapping("compPjtView.kh")
	public String compProjectView() {
		return "project/selectMenuView";
	}
	@RequestMapping("newProject.kh")
	public String newProjectView() {
		return "project/projectView";
	}
	
}
