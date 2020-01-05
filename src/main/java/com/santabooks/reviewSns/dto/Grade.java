package com.santabooks.reviewSns.dto;

public class Grade {
	private int grade;
	private int memberNo;
	private int bookNo;

	@Override
	public String toString() {
		return "Grade [grade=" + grade + ", memberNo=" + memberNo + ", bookNo=" + bookNo + "]";
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
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
