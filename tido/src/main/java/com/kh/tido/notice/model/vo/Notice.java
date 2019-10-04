package com.kh.tido.notice.model.vo;

import java.sql.Date;

public class Notice {

		private int nNo;
		private String pnoticeTitle;
		private String pnoticeContent;
		private Date pnoticeCreateDate;
		private Date pnoticeModifyDate;
		private int pnoticeViewCount;
		private String pnoticeStatus;
		private String pmemberId;
		private String pnoticeFilePath;
		
		public Notice() {}


		
		public Notice(int nNo, String pnoticeTitle, String pnoticeContent, Date pnoticeCreateDate,
				Date pnoticeModifyDate, int pnoticeViewCount, String pnoticeStatus, String pmemberId,
				String pnoticeFilePath) {
			super();
			this.nNo = nNo;
			this.pnoticeTitle = pnoticeTitle;
			this.pnoticeContent = pnoticeContent;
			this.pnoticeCreateDate = pnoticeCreateDate;
			this.pnoticeModifyDate = pnoticeModifyDate;
			this.pnoticeViewCount = pnoticeViewCount;
			this.pnoticeStatus = pnoticeStatus;
			this.pmemberId = pmemberId;
			this.pnoticeFilePath = pnoticeFilePath;
		}



		public int getnNo() {
			return nNo;
		}

		public void setnNo(int nNo) {
			this.nNo = nNo;
		}

		public String getPnoticeTitle() {
			return pnoticeTitle;
		}

		public void setPnoticeTitle(String pnoticeTitle) {
			this.pnoticeTitle = pnoticeTitle;
		}

		public String getPnoticeContent() {
			return pnoticeContent;
		}

		public void setPnoticeContent(String pnoticeContent) {
			this.pnoticeContent = pnoticeContent;
		}

		public Date getPnoticeCreateDate() {
			return pnoticeCreateDate;
		}

		public void setPnoticeCreateDate(Date pnoticeCreateDate) {
			this.pnoticeCreateDate = pnoticeCreateDate;
		}

		public Date getPnoticeModifyDate() {
			return pnoticeModifyDate;
		}

		public void setPnoticeModifyDate(Date pnoticeModifyDate) {
			this.pnoticeModifyDate = pnoticeModifyDate;
		}

		public int getPnoticeViewCount() {
			return pnoticeViewCount;
		}

		public void setPnoticeViewCount(int pnoticeViewCount) {
			this.pnoticeViewCount = pnoticeViewCount;
		}

		public String getPnoticeStatus() {
			return pnoticeStatus;
		}

		public void setPnoticeStatus(String pnoticeStatus) {
			this.pnoticeStatus = pnoticeStatus;
		}

		public String getPmemberId() {
			return pmemberId;
		}

		public void setPmemberId(String pmemberId) {
			this.pmemberId = pmemberId;
		}

		public String getPnoticeFilePath() {
			return pnoticeFilePath;
		}

		public void setPnoticeFilePath(String pnoticeFilePath) {
			this.pnoticeFilePath = pnoticeFilePath;
		}



		@Override
		public String toString() {
			return "Notice [nNo=" + nNo + ", pnoticeTitle=" + pnoticeTitle + ", pnoticeContent=" + pnoticeContent
					+ ", pnoticeCreateDate=" + pnoticeCreateDate + ", pnoticeModifyDate=" + pnoticeModifyDate
					+ ", pnoticeViewCount=" + pnoticeViewCount + ", pnoticeStatus=" + pnoticeStatus + ", pmemberId="
					+ pmemberId + ", pnoticeFilePath=" + pnoticeFilePath + "]";
		}
		
		
		
}
