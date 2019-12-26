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
	 * @return
	 */
	public List<ReviewSns> snsList(Paging reviewPaging);

}
