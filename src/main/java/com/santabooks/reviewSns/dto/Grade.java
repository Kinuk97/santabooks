package com.santabooks.reviewSns.dto;

public class Grade {
	private int grade;
	private int memberNo;
	private int feedNo;

	@Override
	public String toString() {
		return "Grade [grade=" + grade + ", memberNo=" + memberNo + ", feedNo=" + feedNo + "]";
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

	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

}
