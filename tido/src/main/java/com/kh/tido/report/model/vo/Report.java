package com.kh.tido.report.model.vo;

import java.sql.Date;

public class Report {

		private int ReportNo;
		private int ContentsNo;
		private int ReportType;
		private String ReportContent;
		private Date ReportDate;
		private int Rrno;
		private String MemberId;
		
		public Report() {}

		public Report(int reportNo, int contentsNo, int reportType, String reportContent, Date reportDate, int rrno,
				String memberId) {
			super();
			ReportNo = reportNo;
			ContentsNo = contentsNo;
			ReportType = reportType;
			ReportContent = reportContent;
			ReportDate = reportDate;
			Rrno = rrno;
			MemberId = memberId;
		}

		public int getReportNo() {
			return ReportNo;
		}

		public void setReportNo(int reportNo) {
			ReportNo = reportNo;
		}

		public int getContentsNo() {
			return ContentsNo;
		}

		public void setContentsNo(int contentsNo) {
			ContentsNo = contentsNo;
		}

		public int getReportType() {
			return ReportType;
		}

		public void setReportType(int reportType) {
			ReportType = reportType;
		}

		public String getReportContent() {
			return ReportContent;
		}

		public void setReportContent(String reportContent) {
			ReportContent = reportContent;
		}

		public Date getReportDate() {
			return ReportDate;
		}

		public void setReportDate(Date reportDate) {
			ReportDate = reportDate;
		}

		public int getRrno() {
			return Rrno;
		}

		public void setRrno(int rrno) {
			Rrno = rrno;
		}

		public String getMemberId() {
			return MemberId;
		}

		public void setMemberId(String memberId) {
			MemberId = memberId;
		}

		@Override
		public String toString() {
			return "Report [ReportNo=" + ReportNo + ", ContentsNo=" + ContentsNo + ", ReportType=" + ReportType
					+ ", ReportContent=" + ReportContent + ", ReportDate=" + ReportDate + ", Rrno=" + Rrno
					+ ", MemberId=" + MemberId + "]";
		}
		
		
}


