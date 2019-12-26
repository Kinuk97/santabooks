package com.santabooks.novel.dto;

public class Comment {
	private int commentNo;

	private int memberNo;

	private String content;

	private String addDate;

	public int getCommentNo() {
		return commentNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public String getContent() {
		return content;
	}

	public String getAddDate() {
		return addDate;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", memberNo=" + memberNo + ", content=" + content + ", addDate="
				+ addDate + "]";
	}
}
