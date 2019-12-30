package com.santabooks.novel.dao.face;

import java.util.List;

import com.santabooks.novel.dto.Episode;
import com.santabooks.novel.dto.Novel;
import com.santabooks.util.Paging;

public interface NovelDao {
	/**
	 * 게시글 총 개수를 구하는 메소드
	 * 
	 * @param paging - 검색어가 있다면 담겨있을 DTO
	 * @return int - 결과 cnt
	 */
	public int selectCntList(Paging paging);

	/**
	 * 소설 목록을 가져오는 메소드
	 * 
	 * @param paging - Paging 객체
	 * @return List<Novel> - 결과 LIST
	 */
	public List<Novel> selectNovelList(Paging paging);

	/**
	 * 별점순으로 3개 항목 가져오기
	 * 
	 * @param category - 카테고리
	 * 
	 * @return List<Novel> - 결과 목록
	 */
	public List<Novel> selectBestNovel(int category);
	
	/**
	 * 소설 정보 가져오기
	 * 
	 * @param paging - 소설번호 DTO
	 * @return Novel - 소설 정보
	 */
	public Novel selectNovelByNovelNo(Paging paging);

	/**
	 * 소설 회차보는 쿼리
	 * 
	 * @param paging - 소설 번호가 담겨있는 DTO
	 * @return List<Episode> - 회차 목록
	 */
	public List<Episode> selectEpisodeByNovelNo(Paging paging);

	/**
	 * 소설 등록하기
	 * 
	 * @param novel - 소설 정보
	 */
	public void insertNovel(Novel novel);
}
