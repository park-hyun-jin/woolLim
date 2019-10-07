package com.kh.tido.project.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("project")
public class Project {
	
	private int pNo;
	private String projectTitle;
	private String projectWriter;
	private String projectPath;
	private Date pCreateDate;
	private Date pModifyDate;
	private char pStatus;
	private String projectFileName;
	private String projectImagePath;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Project(int pNo, String projectTitle, String projectWriter, String projectPath, Date pCreateDate,
			Date pModifyDate, char pStatus, String projectFileName, String projectImagePath) {
		super();
		this.pNo = pNo;
		this.projectTitle = projectTitle;
		this.projectWriter = projectWriter;
		this.projectPath = projectPath;
		this.pCreateDate = pCreateDate;
		this.pModifyDate = pModifyDate;
		this.pStatus = pStatus;
		this.projectFileName = projectFileName;
		this.projectImagePath = projectImagePath;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	public String getProjectWriter() {
		return projectWriter;
	}
	public void setProjectWriter(String projectWriter) {
		this.projectWriter = projectWriter;
	}
	public String getProjectPath() {
		return projectPath;
	}
	public void setProjectPath(String projectPath) {
		this.projectPath = projectPath;
	}
	public Date getpCreateDate() {
		return pCreateDate;
	}
	public void setpCreateDate(Date pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	public Date getpModifyDate() {
		return pModifyDate;
	}
	public void setpModifyDate(Date pModifyDate) {
		this.pModifyDate = pModifyDate;
	}
	public char getpStatus() {
		return pStatus;
	}
	public void setpStatus(char pStatus) {
		this.pStatus = pStatus;
	}
	public String getProjectFileName() {
		return projectFileName;
	}
	public void setProjectFileName(String projectFileName) {
		this.projectFileName = projectFileName;
	}
	public String getProjectImagePath() {
		return projectImagePath;
	}
	public void setProjectImagePath(String projectImagePath) {
		this.projectImagePath = projectImagePath;
	}
	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", projectTitle=" + projectTitle + ", projectWriter=" + projectWriter
				+ ", projectPath=" + projectPath + ", pCreateDate=" + pCreateDate + ", pModifyDate=" + pModifyDate
				+ ", pStatus=" + pStatus + ", projectFileName=" + projectFileName + ", projectImagePath="
				+ projectImagePath + "]";
	}
	
	
	
}
