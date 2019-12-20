package com.santabooks.reviewSns.dto;

public class Book {
	private int bookNo;
	private String bokkName;
	private String bookWriter;
	private String bookPublisher;
	private String publishingYear;
	private String bookContent;
	private int genreNo;

	@Override
	public String toString() {
		return "Book [bookNo=" + bookNo + ", bokkName=" + bokkName + ", bookWriter=" + bookWriter + ", bookPublisher="
				+ bookPublisher + ", publishingYear=" + publishingYear + ", bookContent=" + bookContent + ", genreNo="
				+ genreNo + "]";
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBokkName() {
		return bokkName;
	}

	public void setBokkName(String bokkName) {
		this.bokkName = bokkName;
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

}
