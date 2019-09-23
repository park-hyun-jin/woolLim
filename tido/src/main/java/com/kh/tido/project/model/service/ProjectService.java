package com.kh.tido.project.model.service;

import com.kh.tido.project.model.vo.Project;

public interface ProjectService {

	public abstract int saveProject(Project project);

	public abstract Project openProject();
	
}
