package com.santabooks.novel.dto;

public class File {
	private int novelNo;
	private String originName;
	private String storedName;

	@Override
	public String toString() {
		return "File [novelNo=" + novelNo + ", originName=" + originName + ", storedName=" + storedName + "]";
	}

	public int getNovelNo() {
		return novelNo;
	}

	public void setNovelNo(int novelNo) {
		this.novelNo = novelNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getStoredName() {
		return storedName;
	}

	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}

}
