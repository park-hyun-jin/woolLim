package com.kh.tido.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String id;
	private String name;
	private String pwd;
	private Date enrollDate;
	private Date modifyDate;
	private int reportCount;
	private int banCount;
	private String status;
	private String imagePath;
	
	public Member() {
		
	}
	

	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}


	public Member(String id, String name, String pwd, Date enrollDate, Date modifyDate, int reportCcount, int banCount,
			String status, String imagePath) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCcount;
		this.banCount = banCount;
		this.status = status;
		this.imagePath = imagePath;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public int getReportCcount() {
		return reportCount;
	}

	public void setReportCcount(int reportCcount) {
		this.reportCount = reportCcount;
	}

	public int getBanCount() {
		return banCount;
	}

	public void setBanCount(int banCount) {
		this.banCount = banCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", pwd=" + pwd + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", reportCount=" + reportCount + ", banCount=" + banCount + ", status=" + status
				+ ", imagePath=" + imagePath + "]";
	}
	
	

}
