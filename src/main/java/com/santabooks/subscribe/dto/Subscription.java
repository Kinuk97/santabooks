package com.santabooks.subscribe.dto;

public class Subscription {

	private int subNo;
	private int memberNo;
	private String subDate;
	private String subName;
	private String subTel;
	private String subTerm;
	private String subPay;
	
	// 주소 API
	private String postCode;
	private String roadAddress;
	private String jibunAddress;
	private String detailAddress;
	private String extraAddress;
	
	@Override
	public String toString() {
		return "Subscription [subNo=" + subNo + ", memberNo=" + memberNo + ", subDate=" + subDate + ", subName="
				+ subName + ", subTel=" + subTel + ", subTerm=" + subTerm + ", subPay=" + subPay + ", postCode="
				+ postCode + ", roadAddress=" + roadAddress + ", jibunAddress=" + jibunAddress + ", detailAddress="
				+ detailAddress + ", extraAddress=" + extraAddress + "]";
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getSubDate() {
		return subDate;
	}
	public void setSubDate(String subDate) {
		this.subDate = subDate;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubTel() {
		return subTel;
	}
	public void setSubTel(String subTel) {
		this.subTel = subTel;
	}
	public String getSubTerm() {
		return subTerm;
	}
	public void setSubTerm(String subTerm) {
		this.subTerm = subTerm;
	}
	public String getSubPay() {
		return subPay;
	}
	public void setSubPay(String subPay) {
		this.subPay = subPay;
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
	


	
	
}
