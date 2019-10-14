package com.kh.tido.calendar.model.vo;

import java.sql.Date;

public class Calendar {
	
	private int cId;
	private String cTitle;
	private String cUrl;
	private Date cStartDate;
	private Date cEndDate;
	private String cStatus;
	
	public Calendar() {}
	

	public Calendar(String cTitle, String cUrl, Date cStartDate, Date cEndDate) {
		super();
		this.cTitle = cTitle;
		this.cUrl = cUrl;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
	}

	public Calendar(String cTitle, String cUrl, Date cStartDate, Date cEndDate, String cStatus) {
		super();
		this.cTitle = cTitle;
		this.cUrl = cUrl;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cStatus = cStatus;
	}

	public Calendar(int cId, String cTitle, String cUrl, Date cStartDate, Date cEndDate, String cStatus) {
		super();
		this.cId = cId;
		this.cTitle = cTitle;
		this.cUrl = cUrl;
		this.cStartDate = cStartDate;
		this.cEndDate = cEndDate;
		this.cStatus = cStatus;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public String getcTitle() {
		return cTitle;
	}

	public void setcTitle(String cTitle) {
		this.cTitle = cTitle;
	}

	public String getcUrl() {
		return cUrl;
	}

	public void setcUrl(String cUrl) {
		this.cUrl = cUrl;
	}

	public Date getcStartDate() {
		return cStartDate;
	}

	public void setcStartDate(Date cStartDate) {
		this.cStartDate = cStartDate;
	}

	public Date getcEndDate() {
		return cEndDate;
	}

	public void setcEndDate(Date cEndDate) {
		this.cEndDate = cEndDate;
	}

	public String getcStatus() {
		return cStatus;
	}

	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "Calendar [cId=" + cId + ", cTitle=" + cTitle + ", cUrl=" + cUrl + ", cStartDate=" + cStartDate
				+ ", cEndDate=" + cEndDate + ", cStatus=" + cStatus + "]";
	}

	

	
	
	
}