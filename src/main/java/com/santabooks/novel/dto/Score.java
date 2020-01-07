package com.santabooks.novel.dto;

public class Score {
	private int episodeNo;
	private int memberNo;
	private String score;
	private int cntScore;

	@Override
	public String toString() {
		return "Score [episodeNo=" + episodeNo + ", memberNo=" + memberNo + ", score=" + score + ", cntScore="
				+ cntScore + "]";
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

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public int getCntScore() {
		return cntScore;
	}

	public void setCntScore(int cntScore) {
		this.cntScore = cntScore;
	}

}
