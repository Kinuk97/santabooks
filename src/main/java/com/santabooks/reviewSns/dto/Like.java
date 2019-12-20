package com.santabooks.reviewSns.dto;

public class Like {
	private int memberNo;
	private int feedNo;

	@Override
	public String toString() {
		return "Like [memberNo=" + memberNo + ", feedNo=" + feedNo + "]";
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
