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
	private String memberAuthKey;
	private String memberAuthStatus;
	
	public Member() {
		
	}
	

	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}


	public Member(String id, String name, String pwd, Date enrollDate, Date modifyDate, int reportCount, int banCount,
			String status, String imagePath, String memberAuthKey, String memberAuthStatus) {
		super();
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.reportCount = reportCount;
		this.banCount = banCount;
		this.status = status;
		this.imagePath = imagePath;
		this.memberAuthKey = memberAuthKey;
		this.memberAuthStatus = memberAuthStatus;
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


	public int getReportCount() {
		return reportCount;
	}


	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
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


	public String getMemberAuthKey() {
		return memberAuthKey;
	}


	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthKey = memberAuthKey;
	}


	public String getMemberAuthStatus() {
		return memberAuthStatus;
	}


	public void setMemberAuthStatus(String memberAuthStatus) {
		this.memberAuthStatus = memberAuthStatus;
	}


	@Override
	public String toString() {
		return "Member [id=" + id + ", name=" + name + ", pwd=" + pwd + ", enrollDate=" + enrollDate + ", modifyDate="
				+ modifyDate + ", reportCount=" + reportCount + ", banCount=" + banCount + ", status=" + status
				+ ", imagePath=" + imagePath + ", memberAuthKey=" + memberAuthKey + ", memberAuthStatus="
				+ memberAuthStatus + "]";
	}
	
	

}
