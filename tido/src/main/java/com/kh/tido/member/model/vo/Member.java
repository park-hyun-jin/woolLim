package com.kh.tido.member.model.vo;

import java.sql.Date;

public class Member {

	private String memberId;
	private String memberName;
	private String memberPwd;
	private Date enrollDate;
	private Date modifyDate;
	private int memberReportCount;
	private int memberBanCount;
	private String memberStatus;
	private String memberImagePath;
	
	public Member() {
		
	}

	public Member(String memberId, String memberName, String memberPwd, Date enrollDate, Date modifyDate,
			int memberReportCount, int memberBanCount, String memberStatus, String memberImagePath) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.enrollDate = enrollDate;
		this.modifyDate = modifyDate;
		this.memberReportCount = memberReportCount;
		this.memberBanCount = memberBanCount;
		this.memberStatus = memberStatus;
		this.memberImagePath = memberImagePath;
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

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
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

	public int getMemberReportCount() {
		return memberReportCount;
	}

	public void setMemberReportCount(int memberReportCount) {
		this.memberReportCount = memberReportCount;
	}

	public int getMemberBanCount() {
		return memberBanCount;
	}

	public void setMemberBanCount(int memberBanCount) {
		this.memberBanCount = memberBanCount;
	}

	public String getMemberStatus() {
		return memberStatus;
	}

	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberPwd=" + memberPwd
				+ ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate + ", memberReportCount="
				+ memberReportCount + ", memberBanCount=" + memberBanCount + ", memberStatus=" + memberStatus
				+ ", memberImagePath=" + memberImagePath + "]";
	}
	
}
