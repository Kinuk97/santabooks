package com.santabooks.member.dto;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberName;
	private String memberNick;
	private String memberPw;
	private long memberBirth;
	private String memberTel;
	private String memberGender;
	private String genre;
	private String subcheck;
	private String postCode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String extraAddress;
	
	// 구독정보 추가
	private String subDate;

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName
				+ ", memberNick=" + memberNick + ", memberPw=" + memberPw + ", memberBirth=" + memberBirth
				+ ", memberTel=" + memberTel + ", memberGender=" + memberGender + ", genre=" + genre + ", subcheck="
				+ subcheck + ", postCode=" + postCode + ", roadAddress=" + roadAddress + ", jibunAddress="
				+ jibunAddress + ", detailAddress=" + detailAddress + ", extraAddress=" + extraAddress + ", subDate="
				+ subDate + "]";
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

	public long getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(long memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberTel() {
		return memberTel;
	}

	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
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

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getRoadAddress() {
		return roadAddress;
	}

	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getDetailAddress() {
		return detailAddress;
	}

	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}

	public String getExtraAddress() {
		return extraAddress;
	}

	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}

	public String getSubDate() {
		return subDate;
	}

	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}
	

	
	
}