package com.santabooks.reviewSns.dao.face;

import java.util.List;

import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.util.Paging;

public interface ReviewSnsDao {

	/**
	 * 리뷰 총 개수 조회
	 * 
	 * @return int - 게시물 총 개수
	 */
	public int selectCntAll();

	/**
	 * 리뷰리스트 전체 조회
	 * 
	 * @param reviewPaging
	 * @return
	 */
	public List<ReviewSns> selectAll(Paging reviewPaging);

}
