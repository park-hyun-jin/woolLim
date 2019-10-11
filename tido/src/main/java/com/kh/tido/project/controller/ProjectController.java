package com.kh.tido.project.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	
	@RequestMapping("openPjt.kh")
	public String openProject(int pNo,HttpServletRequest request,Model model) {
		ProjectFile projectFile= pService.openProject(request,pNo);
		model.addAttribute("project",projectFile);
		return "project/projectView";
	}
	
	@ResponseBody
	@RequestMapping(value="savePjt.kh",produces="application/json; charset=utf-8 ")
	public String saveProject(ProjectFile project,String projectTitle,String projectPath,HttpServletRequest request) {
		System.out.println(projectPath);
		String projectWriter=((Member)request.getSession().getAttribute("loginUser")).getId();
		int result= pService.saveProject(project,projectTitle,projectPath,request,projectWriter);
		return result+"";
	
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("openPj.kh") public String openProject(HttpServletRequest
	 * request) {
	 * 
	 * int pNo =1; return new Gson().toJson(project); }
	 */
	
	@ResponseBody
	@RequestMapping(value="selectPjt.kh",produces="application/json; charset=utf-8 ")
	public String selectProjectList(String projectPath,HttpServletRequest request,int begin,int lim) {
		System.out.println(begin);
		System.out.println(lim);
		System.out.println(projectPath);
		String projectWriter = ((Member)request.getSession().getAttribute("loginUser")).getId();
		Project project = new Project();
		project.setProjectWriter(projectWriter);
		project.setProjectPath(projectPath);
		ArrayList<Project> projectList = pService.selectProjectList(project,request,begin,lim); 
		return new Gson().toJson(projectList);
	}
	
	@ResponseBody
	@RequestMapping(value="getPjtCount.kh",produces="application/json; charset=utf-8 ")
	public String getProjectCount(String path,HttpServletRequest request) {
		String projectWriter = ((Member)request.getSession().getAttribute("loginUser")).getId();
		Project project = new Project();
		project.setProjectWriter(projectWriter);
		project.setProjectPath(path);
		int count = pService.getProjectCount(project,request); 
		return count+"";
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
	
	@ResponseBody
	@RequestMapping(value="addFolder.kh" ,produces="application/json; charset=utf-8 ")
	public String createFolder(String path,HttpServletRequest request) {
		System.out.println(path);
		File result = pService.createFolder(path,request);
		return result+"";
	}
	
	
	
	
}
