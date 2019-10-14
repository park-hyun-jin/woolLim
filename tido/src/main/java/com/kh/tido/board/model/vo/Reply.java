package com.kh.tido.board.model.vo;

import java.sql.Date;

public class Reply {
	
	private int cbReplyNo; // 댓글 번호
	private String cbReplyContent; // 댓글 내용
	private Date cbReplyCreateDate; // 댓글 작성일
	private Date cbReplyModifyDate; // 댓글 수정일
	private String cbReplyStatus; // 댓글 상태
	private int cboardNo; // 게시글 번호
	private String memberId; // 이메일
	private String memberName; // 닉네임
	private int reportType=4;
	
	
	public Reply() {
		
	}


	public Reply(int cbReplyNo, String cbReplyContent, Date cbReplyCreateDate, Date cbReplyModifyDate,
			String cbReplyStatus, int cboardNo, String memberId, String memberName, int reportType) {
		super();
		this.cbReplyNo = cbReplyNo;
		this.cbReplyContent = cbReplyContent;
		this.cbReplyCreateDate = cbReplyCreateDate;
		this.cbReplyModifyDate = cbReplyModifyDate;
		this.cbReplyStatus = cbReplyStatus;
		this.cboardNo = cboardNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.reportType = reportType;
	}


	public int getCbReplyNo() {
		return cbReplyNo;
	}


	public void setCbReplyNo(int cbReplyNo) {
		this.cbReplyNo = cbReplyNo;
	}


	public String getCbReplyContent() {
		return cbReplyContent;
	}


	public void setCbReplyContent(String cbReplyContent) {
		this.cbReplyContent = cbReplyContent;
	}


	public Date getCbReplyCreateDate() {
		return cbReplyCreateDate;
	}


	public void setCbReplyCreateDate(Date cbReplyCreateDate) {
		this.cbReplyCreateDate = cbReplyCreateDate;
	}


	public Date getCbReplyModifyDate() {
		return cbReplyModifyDate;
	}


	public void setCbReplyModifyDate(Date cbReplyModifyDate) {
		this.cbReplyModifyDate = cbReplyModifyDate;
	}


	public String getCbReplyStatus() {
		return cbReplyStatus;
	}


	public void setCbReplyStatus(String cbReplyStatus) {
		this.cbReplyStatus = cbReplyStatus;
	}


	public int getCboardNo() {
		return cboardNo;
	}


	public void setCboardNo(int cboardNo) {
		this.cboardNo = cboardNo;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public int getReportType() {
		return reportType;
	}


	public void setReportType(int reportType) {
		this.reportType = reportType;
	}


	@Override
	public String toString() {
		return "Reply [cbReplyNo=" + cbReplyNo + ", cbReplyContent=" + cbReplyContent + ", cbReplyCreateDate="
				+ cbReplyCreateDate + ", cbReplyModifyDate=" + cbReplyModifyDate + ", cbReplyStatus=" + cbReplyStatus
				+ ", cboardNo=" + cboardNo + ", memberId=" + memberId + ", memberName=" + memberName + ", reportType="
				+ reportType + "]";
	}





}
