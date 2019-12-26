package com.santabooks.novel.dto;

public class Novel {
	private int novelNo;
	private int memberNo;
	private String title;
	private String discription;
	private int score;
	private String addDate;

	public int getNovelNo() {
		return novelNo;
	}

	public void setNovelNo(int novelNo) {
		this.novelNo = novelNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	@Override
	public String toString() {
		return "Novel [novelNo=" + novelNo + ", memberNo=" + memberNo + ", title=" + title + ", discription="
				+ discription + ", score=" + score + ", addDate=" + addDate + "]";
	}
}
