package com.kh.tido.calendar.model.vo;

import java.sql.Date;
import java.time.temporal.TemporalAccessor;

public class Calendar {
	
	private int cId;
	private String cTitle;
	private String cUrl;
	private Date cDate;
	private char cStatus;
	
	public Calendar() {}

	public Calendar(int cId, String cTitle, String cUrl, Date cDate, char cStatus) {
		super();
		this.cId = cId;
		this.cTitle = cTitle;
		this.cUrl = cUrl;
		this.cDate = cDate;
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

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public char getcStatus() {
		return cStatus;
	}

	public void setcStatus(char cStatus) {
		this.cStatus = cStatus;
	}

	@Override
	public String toString() {
		return "Calendar [cId=" + cId + ", cTitle=" + cTitle + ", cUrl=" + cUrl + ", cDate=" + cDate + ", cStatus="
				+ cStatus + "]";
	}
	
	

	
}