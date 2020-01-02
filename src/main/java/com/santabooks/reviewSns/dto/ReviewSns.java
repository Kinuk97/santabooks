package com.santabooks.reviewSns.dto;

public class ReviewSns {
	private int feedNo;
	private int bookNo;
	private int memberNo;
	private String review;
	private int privacy;
	private String reviewDate;

	// book
	private String bookName;
	private String bookWriter;
	private String bookPublisher;
	private String publishingYear;
	private String bookContent;
	private int genreNo;

	// member
	private String memberNick;

	@Override
	public String toString() {
		return "ReviewSns [feedNo=" + feedNo + ", bookNo=" + bookNo + ", memberNo=" + memberNo + ", review=" + review
				+ ", privacy=" + privacy + ", reviewDate=" + reviewDate + ", bookName=" + bookName + ", bookWriter="
				+ bookWriter + ", bookPublisher=" + bookPublisher + ", publishingYear=" + publishingYear
				+ ", bookContent=" + bookContent + ", genreNo=" + genreNo + ", memberNick=" + memberNick + "]";
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

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookWriter() {
		return bookWriter;
	}

	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getBookPublisher() {
		return bookPublisher;
	}

	public void setBookPublisher(String bookPublisher) {
		this.bookPublisher = bookPublisher;
	}

	public String getPublishingYear() {
		return publishingYear;
	}

	public void setPublishingYear(String publishingYear) {
		this.publishingYear = publishingYear;
	}

	public String getBookContent() {
		return bookContent;
	}

	public void setBookContent(String bookContent) {
		this.bookContent = bookContent;
	}

	public int getGenreNo() {
		return genreNo;
	}

	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

}
