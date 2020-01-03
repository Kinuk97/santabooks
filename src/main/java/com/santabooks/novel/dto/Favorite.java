package com.santabooks.novel.dto;

public class Favorite {
	private int memberNo;
	private int novelNo;

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getNovelNo() {
		return novelNo;
	}

	public void setNovelNo(int novelNo) {
		this.novelNo = novelNo;
	}

	@Override
	public String toString() {
		return "Favorite [memberNo=" + memberNo + ", novelNo=" + novelNo + "]";
	}
}
