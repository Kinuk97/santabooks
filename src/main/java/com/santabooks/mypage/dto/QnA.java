package com.santabooks.mypage.dto;

public class QnA {
	
	private int qnaNo;
	private int memberNo;
	private String qnaTitle;
	private String qnaContent;
	private String writeDate;
	private int hit;
	
	@Override
	public String toString() {
		return "QnA [qnaNo=" + qnaNo + ", memberNo=" + memberNo + ", qnaTitle=" + qnaTitle + ", qnaContent="
				+ qnaContent + ", writeDate=" + writeDate + ", hit=" + hit + "]";
	}

	public int getQnaNo() {
		return qnaNo;
	}

	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
}
