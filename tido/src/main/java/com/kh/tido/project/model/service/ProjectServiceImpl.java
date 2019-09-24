package com.kh.tido.project.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.project.model.dao.ProjectDao;
import com.kh.tido.project.model.vo.Project;

@Service("pService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao pDao;
	
	@Override
	public int saveProject(Project project) {
		
		int result =pDao.saveProject(project);
		
		return result;
	}

	@Override
	public Project openProject() {
		return pDao.openProject();
	}

}
