package com.kh.tido.project.model.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.kh.tido.project.model.vo.Project;
import com.kh.tido.project.model.vo.ProjectFile;

public interface ProjectService {

	public abstract int saveProject(ProjectFile project,String projectTitle,String projectPath, HttpServletRequest request,String projectWriter);

	public abstract ProjectFile openProject(HttpServletRequest request,int pNo);

	public abstract ArrayList<String> getDirectory(HttpServletRequest request,String projectWriter);

	public abstract ArrayList<Project> selectProjectList(Project project,HttpServletRequest request);

	public abstract File createFolder(String path,HttpServletRequest request);
	
	
	
}
