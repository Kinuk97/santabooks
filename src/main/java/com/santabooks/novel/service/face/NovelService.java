package com.santabooks.novel.service.face;

import java.util.List;

import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
import com.santabooks.novel.dto.Score;
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
	 * 별점 순 3개 소설
	 * 
	 * @param category - 카테고리번호
	 * 
	 * @return List<Novel> - 결과 리스트
	 */
	public List<Novel> getBestNovel(int category);

	/**
	 * 소설 정보 가져오기
	 * 
	 * @param novelNo - novelNo
	 * @return Novel - 소설정보
	 */
	public Novel getNovelByNovelNo(int novelNo);

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
	 * @param paging - novelNo가 담긴 DTO
	 * @return List<Episode> - 게시글 목록 List
	 */
	public List<Episode> getEpisodeList(Paging paging);

	/**
	 * 회차 내용 보기
	 * 
	 * @param episode - episodeNo
	 * @return episode - 회차 정보
	 */
	public Episode viewEpidode(Episode episode);

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

	/**
	 * 에피소드 내용 가져오기
	 * 
	 * @param episode - 에피소드 번호
	 * @return 조회 에피소드
	 */
	public Episode getEpisode(Episode episode);

	/**
	 * 파일삭제
	 * 
	 * @param novel - 소설번호
	 */
	public void removeNovel(Novel novel);

	/**
	 * file 저장하는 메소드
	 * 
	 * @param novel - DTO
	 */
	public void fileSave(Novel novel);

	/**
	 * file 삭제하는 메소드
	 * 
	 * @param novel - 파일 이름 DTO
	 */
	public void fileDelete(Novel novel);

	/**
	 * 별점 추가하는 메소드 별점을 db score에 넣고 episode 수정
	 * 
	 * @param score - 별점 정보 DTO
	 */
	public Score addScore(Score score);

	/**
	 * 별점 취소하는 기능
	 * 
	 * @param score - memberNo, episodeNo
	 */
	public Score removeScore(Score score);
	
	/**
	 * 내 별점 확인하기
	 * 
	 * @param score - episodeNo, memberNo
	 * @return Score
	 */
	public Score getMyScore(Score score);

}
