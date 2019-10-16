package com.kh.tido.projectBoard.model.vo;

import java.sql.Date;

public class PBReply {
	private int pbRNo;
	private String pbRContent;
	private Date pbRCreateDate;
	private Date pbRModifyDate;
	private char pbRStatus;
	private int refPbno;
	private String pbRWriterId;
	private String pbRWriterName;
	private String memberImagePath;
	public PBReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PBReply(int pbRNo, String pbRContent, Date pbRCreateDate, Date pbRModifyDate, char pbRStatus, int refPbno,
			String pbRWriterId, String pbRWriterName, String memberImagePath) {
		super();
		this.pbRNo = pbRNo;
		this.pbRContent = pbRContent;
		this.pbRCreateDate = pbRCreateDate;
		this.pbRModifyDate = pbRModifyDate;
		this.pbRStatus = pbRStatus;
		this.refPbno = refPbno;
		this.pbRWriterId = pbRWriterId;
		this.pbRWriterName = pbRWriterName;
		this.memberImagePath = memberImagePath;
	}
	public int getPbRNo() {
		return pbRNo;
	}
	public void setPbRNo(int pbRNo) {
		this.pbRNo = pbRNo;
	}
	public String getPbRContent() {
		return pbRContent;
	}
	public void setPbRContent(String pbRContent) {
		this.pbRContent = pbRContent;
	}
	public Date getPbRCreateDate() {
		return pbRCreateDate;
	}
	public void setPbRCreateDate(Date pbRCreateDate) {
		this.pbRCreateDate = pbRCreateDate;
	}
	public Date getPbRModifyDate() {
		return pbRModifyDate;
	}
	public void setPbRModifyDate(Date pbRModifyDate) {
		this.pbRModifyDate = pbRModifyDate;
	}
	public char getPbRStatus() {
		return pbRStatus;
	}
	public void setPbRStatus(char pbRStatus) {
		this.pbRStatus = pbRStatus;
	}
	public int getRefPbno() {
		return refPbno;
	}
	public void setRefPbno(int refPbno) {
		this.refPbno = refPbno;
	}
	public String getPbRWriterId() {
		return pbRWriterId;
	}
	public void setPbRWriterId(String pbRWriterId) {
		this.pbRWriterId = pbRWriterId;
	}
	public String getPbRWriterName() {
		return pbRWriterName;
	}
	public void setPbRWriterName(String pbRWriterName) {
		this.pbRWriterName = pbRWriterName;
	}
	public String getMemberImagePath() {
		return memberImagePath;
	}
	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}
	@Override
	public String toString() {
		return "PBReply [pbRNo=" + pbRNo + ", pbRContent=" + pbRContent + ", pbRCreateDate=" + pbRCreateDate
				+ ", pbRModifyDate=" + pbRModifyDate + ", pbRStatus=" + pbRStatus + ", refPbno=" + refPbno
				+ ", pbRWriterId=" + pbRWriterId + ", pbRWriterName=" + pbRWriterName + ", memberImagePath="
				+ memberImagePath + "]";
	}
	
	
	
	
	
	
	
}
