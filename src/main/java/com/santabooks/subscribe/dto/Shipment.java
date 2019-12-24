package com.santabooks.subscribe.dto;

public class Shipment {
	private String shipmentDate;
	private int memberNo;
	private int shipNo;
	private int bookNo;
	private int subNo;
	
	@Override
	public String toString() {
		return "Shipment [shipmentDate=" + shipmentDate + ", memberNo=" + memberNo + ", shipNo=" + shipNo + ", bookNo="
				+ bookNo + ", subNo=" + subNo + "]";
	}
	public String getShipmentDate() {
		return shipmentDate;
	}
	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getShipNo() {
		return shipNo;
	}
	public void setShipNo(int shipNo) {
		this.shipNo = shipNo;
	}
	public int getBookNo() {
		return bookNo;
	}
	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	

}
