package com.santabooks.novel.dto;

import org.springframework.web.multipart.MultipartFile;

public class Novel {
	private int novelNo;
	private int memberNo;
	private String memberName;
	private String title;
	private String discription;
	private int score;
	private int cntScore;
	private String addDate;
	private int category;
	private String imgOriginName;
	private String imgStoredName;

	private MultipartFile upload;

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

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public int getCntScore() {
		return cntScore;
	}

	public void setCntScore(int cntScore) {
		this.cntScore = cntScore;
	}

	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getImgOriginName() {
		return imgOriginName;
	}

	public void setImgOriginName(String imgOriginName) {
		this.imgOriginName = imgOriginName;
	}

	public String getImgStoredName() {
		return imgStoredName;
	}

	public void setImgStoredName(String imgStoredName) {
		this.imgStoredName = imgStoredName;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}

	@Override
	public String toString() {
		return "Novel [novelNo=" + novelNo + ", memberNo=" + memberNo + ", memberName=" + memberName + ", title="
				+ title + ", discription=" + discription + ", score=" + score + ", cntScore=" + cntScore + ", addDate="
				+ addDate + ", category=" + category + ", imgOriginName=" + imgOriginName + ", imgStoredName="
				+ imgStoredName + ", upload=" + upload + "]";
	}

}
