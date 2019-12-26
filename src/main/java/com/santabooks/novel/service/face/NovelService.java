package com.santabooks.novel.service.face;

import java.util.List;

import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
import com.santabooks.util.Paging;

public interface NovelService {
	
	/**
	 * 소설 등록하기
	 * 
	 * @param novel - 소설 내용 DTO
	 */
	public void addNovel(Novel novel);
	/**
	 * 소설 정보 수정하기
	 * 
	 * @param novel - 소설 수정 내용 DTO
	 */
	public void modifyNovel(Novel novel);
	/**
	 * 소설 목록 가져오기
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return List<Novel> - 소설 목록
	 */
	public List<Novel> getNovelList(Paging paging);
	/**
	 * 소설 상세보기
	 * 
	 * @param novel - 소설 번호 DTO
	 * @return Novel - 소설 내용
	 */
	public Novel viewNovel(Novel novel);
	
//	public void addFavorite(Favorite favorite);
//	public void removeFavorite(Favorite favorite);
//	public List<Novel> myFavorite(Favorite favorite);
	
	/**
	 * 회차 추가하기
	 * 
	 * @param episode - 회차 정보 DTO
	 */
	public void addEpisode(Episode episode);
	/**
	 * 회차 수정하기
	 * 
	 * @param episode - 소설 수정 내용 DTO
	 */
	public void modifyEpisode(Episode episode);
	/**
	 * 회차 삭제하기
	 * 
	 * @param episode - 소설 번호 DTO
	 */
	public void removeEpisode(Episode episode);
	
//	public void addScore(Score score);
//	public void removeScore(Score score);
	
	/**
	 * 회차 목록 가져오기
	 * 
	 * @param episode - novelNo가 담긴 DTO
	 * @return List<Episode>  - 게시글 목록 List
	 */
	public List<Episode> getEpisodeList(Episode episode);
	/**
	 * 회차 상세보기
	 * 
	 * @param episode - 회차 번호 DTO
	 * @return Episode - 회차 정보 DTO
	 */
	public Episode viewEpisode(Episode episode);
	
	
//	public void writeComment(Comment comment);
//	public void modifyComment(Comment episode);
//	public void removeComment(Comment comment);
//	public List<Comment> getCommentList(Comment comment);
	
	/**
	 * Paging 객체 만들어주는 메소드
	 * 
	 * @param paging - curPage, search가 담겨있는 Paging
	 * @return Paging - 결과 Paging
	 */
	public Paging getPaging(Paging paging);
}
