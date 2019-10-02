package com.kh.tido.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.kh.tido.member.model.vo.Member;
import com.kh.tido.project.model.service.ProjectService;
import com.kh.tido.project.model.vo.Project;
import com.kh.tido.project.model.vo.ProjectFile;


@SessionAttributes("loginUser")
@Controller
public class ProjectController {
	@Autowired
	private ProjectService pService;
	
	
	
	@ResponseBody
	@RequestMapping(value="savePjt.kh",produces="application/json; charset=utf-8 ")
	public String saveProject(ProjectFile project,String projectPath,HttpServletRequest request) {
		System.out.println(projectPath);
		String projectWriter=((Member)request.getSession().getAttribute("loginUser")).getId();
		int result= pService.saveProject(project,projectPath,request,projectWriter);
		return result+"";
	}
	
	@ResponseBody
	@RequestMapping("openPjt.kh")
	public String openProject(HttpServletRequest request) {
		
		int pNo =1;
	
		ProjectFile project= pService.openProject(pNo, request,"신현");
		
		return new Gson().toJson(project);
	}
	
	@ResponseBody
	@RequestMapping(value="selectPjt.kh",produces="application/json; charset=utf-8 ")
	public String selectProjectList(String projectPath,HttpServletRequest request) {
		String projectWriter = ((Member)request.getSession().getAttribute("loginUser")).getId();
		Project project = new Project();
		project.setProjectWriter(projectWriter);
		project.setProjectPath(projectPath);
		ArrayList<Project> projectList = pService.selectProjectList(project,request); 
		return new Gson().toJson(projectList);
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
	public String projectListView() {
		return "project/projectListView";
	}
	
	@ResponseBody
	@RequestMapping(value="getFolder.kh" ,produces="application/json; charset=utf-8 ")
	public String getFolder(HttpServletRequest request,String path) {
		System.out.println(path);
		ArrayList<String> pathList = pService.getDirectory(request,path);
		return new Gson().toJson(pathList);
	}
	
}
