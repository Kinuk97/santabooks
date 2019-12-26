package com.santabooks.reviewSns.service.face;

import java.util.List;

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
	 * @param reviewPaging
	 * @return List<ReviewSns> - 리뷰 목록
	 */
	public List<ReviewSns> snsList(Paging reviewPaging);
	
	/**
	 * 리뷰 상세 보기
	 * @param reviewSns
	 * @return ReviewSns - 리뷰 내용
	 */
	public ReviewSns view(ReviewSns reviewSns);

}
