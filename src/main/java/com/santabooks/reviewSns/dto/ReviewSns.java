package com.santabooks.reviewSns.dto;

public class ReviewSns {
	private int feedNo;
	private int bookNo;
	private int memberNo;
	private String review;
	private int privacy;

	@Override
	public String toString() {
		return "ReviewSns [feedNo=" + feedNo + ", bookNo=" + bookNo + ", memberNo=" + memberNo + ", review=" + review
				+ ", privacy=" + privacy + "]";
	}

	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getPrivacy() {
		return privacy;
	}

	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}

}
