package com.santabooks.novel.dto;

public class Comment {
	private int commentNo;

	private int episodeNo;

	private int memberNo;

	private String memberName;

	private String content;

	private String addDate;

	private int parentCmtNo;

	private int seq;

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", episodeNo=" + episodeNo + ", memberNo=" + memberNo
				+ ", memberName=" + memberName + ", content=" + content + ", addDate=" + addDate + ", parentCmtNo="
				+ parentCmtNo + ", seq=" + seq + "]";
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getEpisodeNo() {
		return episodeNo;
	}

	public void setEpisodeNo(int episodeNo) {
		this.episodeNo = episodeNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public int getParentCmtNo() {
		return parentCmtNo;
	}

	public void setParentCmtNo(int parentCmtNo) {
		this.parentCmtNo = parentCmtNo;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

}
