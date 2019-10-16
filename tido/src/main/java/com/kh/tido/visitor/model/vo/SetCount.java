package com.kh.tido.visitor.model.vo;

public class SetCount {

	private String projectCount;
	private String boardCount;
	private String memberCount;
	private String visitCount;
	
	public SetCount() {
		// TODO Auto-generated constructor stub
	}

	public SetCount(String projectCount, String boardCount, String memberCount, String visitCount) {
		super();
		this.projectCount = projectCount;
		this.boardCount = boardCount;
		this.memberCount = memberCount;
		this.visitCount = visitCount;
	}

	public String getProjectCount() {
		return projectCount;
	}

	public void setProjectCount(String projectCount) {
		this.projectCount = projectCount;
	}

	public String getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(String boardCount) {
		this.boardCount = boardCount;
	}

	public String getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(String memberCount) {
		this.memberCount = memberCount;
	}

	public String getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(String visitCount) {
		this.visitCount = visitCount;
	}

	@Override
	public String toString() {
		return "SetCount [projectCount=" + projectCount + ", boardCount=" + boardCount + ", memberCount=" + memberCount
				+ ", visitCount=" + visitCount + "]";
	}
}
