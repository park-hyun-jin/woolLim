package com.kh.tido.report.model.vo;

public class ReportReason {

		private int Rrno;
		private	String Reason;
		
		public ReportReason() {}

		public ReportReason(int rrno, String reason) {
			super();
			Rrno = rrno;
			Reason = reason;
		}
		
		

		public int getRrno() {
			return Rrno;
		}

		public void setRrno(int rrno) {
			Rrno = rrno;
		}

		public String getReason() {
			return Reason;
		}

		public void setReason(String reason) {
			Reason = reason;
		}

		@Override
		public String toString() {
			return "ReportReason [Rrno=" + Rrno + ", Reason=" + Reason + "]";
		}
		
		
		
		
		
		
}
