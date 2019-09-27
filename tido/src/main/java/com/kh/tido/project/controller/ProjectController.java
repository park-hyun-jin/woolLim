package com.kh.tido.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.tido.project.model.service.ProjectService;
import com.kh.tido.project.model.vo.ProjectFile;


@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	
	
	@ResponseBody
	@RequestMapping("savePjt.kh")
	public String saveProject(ProjectFile project,HttpServletRequest request) {
		
		System.out.println(project);
		int result= pService.saveProject(project,request,"신현");
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("openPjt.kh")
	public String openProject(HttpServletRequest request) {
		
		int pNo = 67;
	
		ProjectFile project= pService.openProject(pNo, request,"신현");
		
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
	
	@RequestMapping("projectListView.kh")
	public String projectListView(HttpServletRequest request) {
		ArrayList<String> pathList = pService.getFolderList(request,"신현");
		
		return "project/projectListView";
	}
	
}
