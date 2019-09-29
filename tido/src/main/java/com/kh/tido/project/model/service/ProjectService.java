package com.kh.tido.project.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import com.kh.tido.project.model.vo.ProjectFile;

public interface ProjectService {

	public abstract int saveProject(ProjectFile project, HttpServletRequest request,String nickname);

	public abstract ProjectFile openProject(int pNo, HttpServletRequest request,String nickname);

	public abstract ArrayList<String> getFolderList(HttpServletRequest request,String nickname);
	
}
