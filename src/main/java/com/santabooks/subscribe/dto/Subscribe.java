package com.santabooks.subscribe.dto;

public class Subscribe {

	private int subNo;
	private int memberNo;
	private String subDate;
	private String subAdd;
	private String subName;
	private String subTel;
	private String subTerm;
	private String subPay;
	
	@Override
	public String toString() {
		return "Subscribe [subNo=" + subNo + ", memberNo=" + memberNo + ", subDate=" + subDate + ", subAdd=" + subAdd
				+ ", subName=" + subName + ", subTel=" + subTel + ", subTerm=" + subTerm + ", subPay=" + subPay + "]";
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

	public String getSubAdd() {
		return subAdd;
	}

	public void setSubAdd(String subAdd) {
		this.subAdd = subAdd;
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

	
	
}
