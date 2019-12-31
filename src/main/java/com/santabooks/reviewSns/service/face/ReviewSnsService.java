package com.santabooks.reviewSns.service.face;

import java.util.List;

import com.santabooks.reviewSns.dto.NaverBook;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.util.Paging;

public interface ReviewSnsService {
	
	/**
	 * 페이징을 위한 리뷰 총 개수 
	 * @return int - 총 게시물 수
	 */
	public int selectCntAll();
	
	/**
	 * 리뷰 리스트
	 * 
	 * @param reviewPaging - 페이징 객체
	 * @return List<ReviewSns> - 리뷰 목록
	 */
	public List<ReviewSns> snsList(Paging reviewPaging);
	
	/**
	 * 리뷰 상세 보기
	 * 
	 * @param reviewSns
	 * @return ReviewSns - 리뷰 내용
	 */
	public ReviewSns view(ReviewSns reviewSns);
	
	/**
	 * 네이버 API 책 검색 리스트
	 * 
	 * @param keyword
	 * @param display
	 * @param start
	 * @return NaverBook - 책 리스트
	 */
	public List<NaverBook> searchBook(String keyword, int display, int start);

	
	/**
	 * 책 정보 안에 있는 리뷰 리스트(최신리뷰 3개)
	 * 
	 * @param reviewSns
	 * @return ReviewSns - 리뷰 목록
	 */
	public List<ReviewSns> snsListInBook(ReviewSns review);
	
	/**
	 * 책 정보 안에 있는 리뷰 모두보기
	 * @param reviewPaging
	 * @return
	 */
	public List<ReviewSns> reviewList(Paging reviewPaging);
	
	/**
	 * 리뷰 상세보기안에 있는 리뷰 상세 보기
	 * 
	 * @param reviewSns
	 * @return
	 */
	public ReviewSns detailView(ReviewSns reviewSns);
	
	/**
	 * 리뷰 작성
	 * 
	 * @param reviewSns
	 */
	public void write(ReviewSns reviewSns);
	

}
