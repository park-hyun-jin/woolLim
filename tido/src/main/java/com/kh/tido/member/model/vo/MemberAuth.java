package com.kh.tido.member.model.vo;

public class MemberAuth {
	
	private String memberAuthKey;
	private int memberAuthStatus;
	private String memberId;
	
	public MemberAuth(String memberAuthKey, int memberAuthStatus, String memberId) {
		super();
		this.memberAuthKey = memberAuthKey;
		this.memberAuthStatus = memberAuthStatus;
		this.memberId = memberId;
	}
	public String getMemberAuthKey() {
		return memberAuthKey;
	}
	public void setMemberAuthKey(String memberAuthKey) {
		this.memberAuthKey = memberAuthKey;
	}
	public int getMemberAuthStatus() {
		return memberAuthStatus;
	}
	public void setMemberAuthStatus(int memberAuthStatus) {
		this.memberAuthStatus = memberAuthStatus;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "MemberAuth [memberAuthKey=" + memberAuthKey + ", memberAuthStatus=" + memberAuthStatus + ", memberId="
				+ memberId + "]";
	}
	
}
