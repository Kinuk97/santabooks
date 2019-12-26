package com.santabooks.novel.dao.face;

import java.util.List;

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
	 * @return List<Novel> - 결과 목록
	 */
	public List<Novel> selectBestNovel();
}
