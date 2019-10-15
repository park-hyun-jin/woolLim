package com.kh.tido.projectBoard.model.vo;

import java.sql.Date;

public class ProjectBoard {
	private int pbNo; // 게시글 번호
	private String pBoardTitle; // 게시글 제목
	private String pBoardContent; // 게시글 내용
	private Date pBoardCreateDate; // 게시글 작성일
	private Date pBoardModifyDate; // 게시글 수정일
	private int pBoardViewCount; // 게시글 조회수
	private int pBoardLikeCount; // 게시글 조회수
	private String pBoardStatus; // 게시글 상태
	private int refPNo;
	private String memberName; // 
	private String projectImagePath;
	private String writerImagePath;
	private String writerId;
	public ProjectBoard() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectBoard(int pbNo, String pBoardTitle, String pBoardContent, Date pBoardCreateDate,
			Date pBoardModifyDate, int pBoardViewCount, int pBoardLikeCount, String pBoardStatus, int refPNo,
			String memberName, String projectImagePath, String writerImagePath, String writerId) {
		super();
		this.pbNo = pbNo;
		this.pBoardTitle = pBoardTitle;
		this.pBoardContent = pBoardContent;
		this.pBoardCreateDate = pBoardCreateDate;
		this.pBoardModifyDate = pBoardModifyDate;
		this.pBoardViewCount = pBoardViewCount;
		this.pBoardLikeCount = pBoardLikeCount;
		this.pBoardStatus = pBoardStatus;
		this.refPNo = refPNo;
		this.memberName = memberName;
		this.projectImagePath = projectImagePath;
		this.writerImagePath = writerImagePath;
		this.writerId = writerId;
	}
	public int getPbNo() {
		return pbNo;
	}
	public void setPbNo(int pbNo) {
		this.pbNo = pbNo;
	}
	public String getpBoardTitle() {
		return pBoardTitle;
	}
	public void setpBoardTitle(String pBoardTitle) {
		this.pBoardTitle = pBoardTitle;
	}
	public String getpBoardContent() {
		return pBoardContent;
	}
	public void setpBoardContent(String pBoardContent) {
		this.pBoardContent = pBoardContent;
	}
	public Date getpBoardCreateDate() {
		return pBoardCreateDate;
	}
	public void setpBoardCreateDate(Date pBoardCreateDate) {
		this.pBoardCreateDate = pBoardCreateDate;
	}
	public Date getpBoardModifyDate() {
		return pBoardModifyDate;
	}
	public void setpBoardModifyDate(Date pBoardModifyDate) {
		this.pBoardModifyDate = pBoardModifyDate;
	}
	public int getpBoardViewCount() {
		return pBoardViewCount;
	}
	public void setpBoardViewCount(int pBoardViewCount) {
		this.pBoardViewCount = pBoardViewCount;
	}
	public int getpBoardLikeCount() {
		return pBoardLikeCount;
	}
	public void setpBoardLikeCount(int pBoardLikeCount) {
		this.pBoardLikeCount = pBoardLikeCount;
	}
	public String getpBoardStatus() {
		return pBoardStatus;
	}
	public void setpBoardStatus(String pBoardStatus) {
		this.pBoardStatus = pBoardStatus;
	}
	public int getRefPNo() {
		return refPNo;
	}
	public void setRefPNo(int refPNo) {
		this.refPNo = refPNo;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getProjectImagePath() {
		return projectImagePath;
	}
	public void setProjectImagePath(String projectImagePath) {
		this.projectImagePath = projectImagePath;
	}
	public String getWriterImagePath() {
		return writerImagePath;
	}
	public void setWriterImagePath(String writerImagePath) {
		this.writerImagePath = writerImagePath;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	@Override
	public String toString() {
		return "ProjectBoard [pbNo=" + pbNo + ", pBoardTitle=" + pBoardTitle + ", pBoardContent=" + pBoardContent
				+ ", pBoardCreateDate=" + pBoardCreateDate + ", pBoardModifyDate=" + pBoardModifyDate
				+ ", pBoardViewCount=" + pBoardViewCount + ", pBoardLikeCount=" + pBoardLikeCount + ", pBoardStatus="
				+ pBoardStatus + ", refPNo=" + refPNo + ", memberName=" + memberName + ", projectImagePath="
				+ projectImagePath + ", writerImagePath=" + writerImagePath + ", writerId=" + writerId + "]";
	}
	
}