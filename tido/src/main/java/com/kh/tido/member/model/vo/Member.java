package com.kh.tido.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String id;
	private String name;
	private String pwd;
	private Date enrollDate;
	private Date modifyDate;
	private int reportCnt;
	private int banCnt;
	private String status;
	private String imgPath;
	
	public Member() {}
	
	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}
	
	public Member(String id, String name, String pwd, Date enrollDate, Date modifyDate, int reportCnt, int banCnt,
			String status, String imgPath) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.reportCnt = reportCnt;
		this.banCnt = banCnt;
		this.status = status;
		this.imgPath = imgPath;
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

	public int getReportCnt() {
		return reportCnt;
	}

	public void setReportCnt(int reportCnt) {
		this.reportCnt = reportCnt;
	}

	public int getBanCnt() {
		return banCnt;
	}

	public void setBanCnt(int banCnt) {
		this.banCnt = banCnt;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", pwd=" + pwd + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", reportCnt=" + reportCnt + ", banCnt=" + banCnt + ", status=" + status + ", imgPath="
				+ imgPath + "]";
	}

}
