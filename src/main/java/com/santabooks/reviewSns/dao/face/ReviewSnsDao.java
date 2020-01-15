package com.santabooks.reviewSns.dao.face;

import java.util.List;

import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.Grade;
import com.santabooks.reviewSns.dto.Like;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.util.Paging;

public interface ReviewSnsDao {

	/**
	 * 리뷰 총 개수 조회
	 * 
	 * @return int - 게시물 총 개수
	 */
	public int selectCntAll(Paging paging);

	/**
	 * 리뷰리스트 전체 조회
	 * 
	 * @param reviewPaging - paging 객체
	 * @return List<ReviewSns> - 리뷰 결과 목록
	 */
	public List<ReviewSns> selectAll(Paging reviewPaging);
	
	/**
	 * 책 번호에 해당하는 각각의 리뷰 조회
	 * 
	 * @param reviewSns - review 객체
	 * @return ReviewSns - 상세 리뷰
	 */
	public ReviewSns selectReviewByBookNo(ReviewSns reviewSns);
	
	/**
	 * 책 번호에 해당하는 각각의 리뷰 조회(최신리뷰 3개)
	 * 
	 * @param reviewSns - review 객체
	 * @return ReviewSns - 리뷰 목록
	 */
	public List<ReviewSns> selectNewReviewByBookNo(ReviewSns review);
	
	/**
	 * 책 번호에 해당하는 각각의 리뷰 모두보기
	 * 
	 * @param reviewPaging
	 * @return
	 */
	public List<ReviewSns> selectAllByBookNo(Paging reviewPaging);
	
	/**
	 * 리뷰 상세보기 안에 있는 리뷰 상세리뷰 조회
	 * 
	 * @param reviewSns
	 * @return
	 */
	public ReviewSns selectDetailReviewByFeedNo(ReviewSns reviewSns);
	
	/**
	 * 리뷰 삽입
	 * 
	 * @param reviewSns - 리뷰 내용
	 */
	public void insert(ReviewSns reviewSns);
	
	/**
	 * 별점 삽입
	 * 
	 * @param grade
	 */
	public void insertGrade(Grade grade);
	
	/**
	 * 책 번호에 해당하는 책정보 조회
	 * 
	 * @param reviewSns
	 * @return
	 */
	public Book selectBookByBookNo(int bookNo);
	
	/**
	 * 리뷰 모두보기에서 리뷰 총 갯수 조회
	 * @param paging
	 * @return
	 */
	public int selectCntAll2(Paging paging);
	
	/**
	 * 리뷰 삭제
	 * 
	 * @param reviewSns
	 */
	public void deleteReview(ReviewSns reviewSns);
	
	/**
	 * 책 총 개수 조회
	 * 
	 * @param paging
	 * @return
	 */
	public int selectCntAll3(Paging paging);
	
	/**
	 * 책 리스트 조회
	 * 
	 * @param bookPaging
	 * @return
	 */
	public List<Book> selectBook(Paging bookPaging);

	
	public int selectCntGradeByMemberNo(Grade grade);

	public Grade selectGradeByMemberNo(Grade grade);
	
	public Grade selectGrade(Grade grade);
	
	public void updateGrade(Grade grade);

	public void updateBookGrade(Grade grade);

	public void deleteGrade(Grade grade);
	
	/**
	 * 내가 좋아요 했는지 count
	 * @param like
	 * @return
	 */
	public int selectCntLikeByMemberNo(Like like);
	
	/**
	 * 좋아요 삭제
	 * @param like
	 */
	public void deleteLike(Like like);
	
	/**
	 * 좋아요 추가
	 * @param like
	 */
	public void insertLike(Like like);
	
	/**
	 * 좋아요 count
	 * @param like
	 * @return
	 */
	public int selectCntLike(Like like);

	public List<Book> getbookGenreNo(String genreNo);
	
	/**
	 * 책 번호로 정보(리뷰, 책) 가져오기
	 * @param bookNo
	 * @return
	 */
//	public ReviewSns selectReviewByBookNo2(int bookNo);
	
	/**
	 * 작성한 sns리뷰 조회
	 * 
	 * @param paging
	 * 
	 * @return List<ReviewSns>
	 */
//	public List<ReviewSns> selectMySns(Paging paging);
	
}
