package com.kh.tido.project.model.service;

import javax.servlet.http.HttpServletRequest;

import com.kh.tido.project.model.vo.Project;
import com.kh.tido.project.model.vo.ProjectFile;

public interface ProjectService {

	public abstract int saveProject(ProjectFile project, HttpServletRequest request);

	public abstract Project openProject();
	
}
