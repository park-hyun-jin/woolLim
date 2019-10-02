package com.kh.tido.board.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("board")
public class Board {
	
	private int cBoardNo; // 게시글 번호
	private String cBoardTitle; // 게시글 제목
	private String cBoardContent; // 게시글 내용
	private Date cBoardCreateDate; // 게시글 작성일
	private Date cBoardModifyDate; // 게시글 수정일
	private int cBoardViewCount; // 게시글 조회수
	private String cBoardStatus; // 게시글 상태
	private String memberId;
	private String cBoardOriFilename; // 기존 파일 이름
	private String cBoardChaFilename; // 바뀐 파일 이름
	
	public Board() {
		
	}

	public Board(int cBoardNo, String cBoardTitle, String cBoardContent, Date cBoardCreateDate, Date cBoardModifyDate,
			int cBoardViewCount, String cBoardStatus, String memberId, String cBoardOriFilename,
			String cBoardChaFilename) {
		super();
		this.cBoardNo = cBoardNo;
		this.cBoardTitle = cBoardTitle;
		this.cBoardContent = cBoardContent;
		this.cBoardCreateDate = cBoardCreateDate;
		this.cBoardModifyDate = cBoardModifyDate;
		this.cBoardViewCount = cBoardViewCount;
		this.cBoardStatus = cBoardStatus;
		this.memberId = memberId;
		this.cBoardOriFilename = cBoardOriFilename;
		this.cBoardChaFilename = cBoardChaFilename;
	}

	public int getcBoardNo() {
		return cBoardNo;
	}

	public void setcBoardNo(int cBoardNo) {
		this.cBoardNo = cBoardNo;
	}

	public String getcBoardTitle() {
		return cBoardTitle;
	}

	public void setcBoardTitle(String cBoardTitle) {
		this.cBoardTitle = cBoardTitle;
	}

	public String getcBoardContent() {
		return cBoardContent;
	}

	public void setcBoardContent(String cBoardContent) {
		this.cBoardContent = cBoardContent;
	}

	public Date getcBoardCreateDate() {
		return cBoardCreateDate;
	}

	public void setcBoardCreateDate(Date cBoardCreateDate) {
		this.cBoardCreateDate = cBoardCreateDate;
	}

	public Date getcBoardModifyDate() {
		return cBoardModifyDate;
	}

	public void setcBoardModifyDate(Date cBoardModifyDate) {
		this.cBoardModifyDate = cBoardModifyDate;
	}

	public int getcBoardViewCount() {
		return cBoardViewCount;
	}

	public void setcBoardViewCount(int cBoardViewCount) {
		this.cBoardViewCount = cBoardViewCount;
	}

	public String getcBoardStatus() {
		return cBoardStatus;
	}

	public void setcBoardStatus(String cBoardStatus) {
		this.cBoardStatus = cBoardStatus;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getcBoardOriFilename() {
		return cBoardOriFilename;
	}

	public void setcBoardOriFilename(String cBoardOriFilename) {
		this.cBoardOriFilename = cBoardOriFilename;
	}

	public String getcBoardChaFilename() {
		return cBoardChaFilename;
	}

	public void setcBoardChaFilename(String cBoardChaFilename) {
		this.cBoardChaFilename = cBoardChaFilename;
	}

	@Override
	public String toString() {
		return "Board [cBoardNo=" + cBoardNo + ", cBoardTitle=" + cBoardTitle + ", cBoardContent=" + cBoardContent
				+ ", cBoardCreateDate=" + cBoardCreateDate + ", cBoardModifyDate=" + cBoardModifyDate
				+ ", cBoardViewCount=" + cBoardViewCount + ", cBoardStatus=" + cBoardStatus + ", memberId=" + memberId
				+ ", cBoardOriFilename=" + cBoardOriFilename + ", cBoardChaFilename=" + cBoardChaFilename + "]";
	}

	
	
}

