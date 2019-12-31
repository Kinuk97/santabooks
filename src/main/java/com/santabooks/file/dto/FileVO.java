package com.santabooks.file.dto;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private int fileno;
	private String title;
	private String originName;
	private String storedName;

	// jsp의 input file의 name과 같아야한다.
	private MultipartFile file;

	@Override
	public String toString() {
		return "Filetest [fileno=" + fileno + ", title=" + title + ", originName=" + originName + ", storedName="
				+ storedName + ", file=" + file + "]";
	}

	public int getFileno() {
		return fileno;
	}

	public void setFileno(int fileno) {
		this.fileno = fileno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

}
