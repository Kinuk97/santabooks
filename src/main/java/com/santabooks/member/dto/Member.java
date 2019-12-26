package com.santabooks.member.dto;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberName;
	private String memberNick;
	private String memberPw;
	private int memberBirth;
	private String memberTel;
	private String memberAdd;
	private String memberGender;
	private String genre;
	private String subcheck;
	private int subNo;
	
	
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberNick=" + memberNick + ", memberPw=" + memberPw + ", memberBirth=" + memberBirth
				+ ", memberTel=" + memberTel + ", memberAdd=" + memberAdd + ", memberGender=" + memberGender
				+ ", genre=" + genre + ", subcheck=" + subcheck + ", subNo=" + subNo + "]";
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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


	public String getMemberNick() {
		return memberNick;
	}


	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}


	public String getMemberPw() {
		return memberPw;
	}


	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}


	public int getMemberBirth() {
		return memberBirth;
	}


	public void setMemberBirth(int memberBirth) {
		this.memberBirth = memberBirth;
	}


	public String getMemberTel() {
		return memberTel;
	}


	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}


	public String getMemberAdd() {
		return memberAdd;
	}


	public void setMemberAdd(String memberAdd) {
		this.memberAdd = memberAdd;
	}


	public String getMemberGender() {
		return memberGender;
	}


	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}


	public String getSubcheck() {
		return subcheck;
	}


	public void setSubcheck(String subcheck) {
		this.subcheck = subcheck;
	}


	public int getSubNo() {
		return subNo;
	}


	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	
	
	

}
;