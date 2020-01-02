package com.santabooks.novel.dto;

public class Score {
	private int episodeNo;
	private int memberNo;
	private int score;

	@Override
	public String toString() {
		return "Score [episodeNo=" + episodeNo + ", memberNo=" + memberNo + ", score=" + score + "]";
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

}
