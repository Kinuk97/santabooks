package com.santabooks.reviewSns.dto;

public class Grade {
	private String grade;
	private int memberNo;
	private int bookNo;

	@Override
	public String toString() {
		return "Grade [grade=" + grade + ", memberNo=" + memberNo + ", bookNo=" + bookNo + "]";
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

}
