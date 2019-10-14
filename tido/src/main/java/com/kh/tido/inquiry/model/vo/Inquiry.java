package com.kh.tido.inquiry.model.vo;

import java.sql.Date;

public class Inquiry {
	
	private int iNo;
	private String iInquiryTitle;
	private String iInquiryContent;
	private Date iInquiryDate;
	private Date iInquiryModifyDate;
	private String iInquiryId;
	private String iInquiryStatus;
	private String iInquiryOriginFilename;
	private String iInquiryChangeFilename;

	public Inquiry() {}

	public Inquiry(int iNo, String iInquiryTitle, String iInquiryContent, Date iInquiryDate, Date iInquiryModifyDate,
			String iInquiryId, String iInquiryStatus, String iInquiryOriginFilename, String iInquiryChangeFilename) {
		super();
		this.iNo = iNo;
		this.iInquiryTitle = iInquiryTitle;
		this.iInquiryContent = iInquiryContent;
		this.iInquiryDate = iInquiryDate;
		this.iInquiryModifyDate = iInquiryModifyDate;
		this.iInquiryId = iInquiryId;
		this.iInquiryStatus = iInquiryStatus;
		this.iInquiryOriginFilename = iInquiryOriginFilename;
		this.iInquiryChangeFilename = iInquiryChangeFilename;
	}

	public int getiNo() {
		return iNo;
	}

	public void setiNo(int iNo) {
		this.iNo = iNo;
	}

	public String getiInquiryTitle() {
		return iInquiryTitle;
	}

	public void setiInquiryTitle(String iInquiryTitle) {
		this.iInquiryTitle = iInquiryTitle;
	}

	public String getiInquiryContent() {
		return iInquiryContent;
	}

	public void setiInquiryContent(String iInquiryContent) {
		this.iInquiryContent = iInquiryContent;
	}

	public Date getiInquiryDate() {
		return iInquiryDate;
	}

	public void setiInquiryDate(Date iInquiryDate) {
		this.iInquiryDate = iInquiryDate;
	}

	public Date getiInquiryModifyDate() {
		return iInquiryModifyDate;
	}

	public void setiInquiryModifyDate(Date iInquiryModifyDate) {
		this.iInquiryModifyDate = iInquiryModifyDate;
	}

	public String getiInquiryId() {
		return iInquiryId;
	}

	public void setiInquiryId(String iInquiryId) {
		this.iInquiryId = iInquiryId;
	}

	public String getiInquiryStatus() {
		return iInquiryStatus;
	}

	public void setiInquiryStatus(String iInquiryStatus) {
		this.iInquiryStatus = iInquiryStatus;
	}

	public String getiInquiryOriginFilename() {
		return iInquiryOriginFilename;
	}

	public void setiInquiryOriginFilename(String iInquiryOriginFilename) {
		this.iInquiryOriginFilename = iInquiryOriginFilename;
	}

	public String getiInquiryChangeFilename() {
		return iInquiryChangeFilename;
	}

	public void setiInquiryChangeFilename(String iInquiryChangeFilename) {
		this.iInquiryChangeFilename = iInquiryChangeFilename;
	}

	@Override
	public String toString() {
		return "Inquiry [iNo=" + iNo + ", iInquiryTitle=" + iInquiryTitle + ", iInquiryContent=" + iInquiryContent
				+ ", iInquiryDate=" + iInquiryDate + ", iInquiryModifyDate=" + iInquiryModifyDate + ", iInquiryId="
				+ iInquiryId + ", iInquiryStatus=" + iInquiryStatus + ", iInquiryOriginFilename="
				+ iInquiryOriginFilename + ", iInquiryChangeFilename=" + iInquiryChangeFilename + "]";
	}
	
	
	
	
	
	
}


