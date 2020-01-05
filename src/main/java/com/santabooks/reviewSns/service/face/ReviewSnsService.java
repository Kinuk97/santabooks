package com.santabooks.reviewSns.service.face;

import java.util.List;

import com.santabooks.member.dto.Member;
import com.santabooks.novel.dto.Score;
import com.santabooks.reviewSns.dto.Book;
import com.santabooks.reviewSns.dto.Grade;
import com.santabooks.reviewSns.dto.NaverBook;
import com.santabooks.reviewSns.dto.ReviewSns;
import com.santabooks.util.Paging;

public interface ReviewSnsService {
	
	/**
	 * 페이징을 위한 리뷰 총 개수 
	 * @param paging 
	 * @return int - 총 게시물 수
	 */
	public int selectCntAll(Paging paging);
	
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
	
	/**
	 * 책 번호에 해당하는 책 정보 가져오기
	 * 
	 * @param bookNo
	 * @return
	 */
	public Book getBook(int bookNo);
	
	/**
	 * 멤버 번호에 해당하는 멤버 정보 가져오기
	 * @param memberNo
	 * @return
	 */
	public Member getMember(Member member);
	
	/**
	 * 리뷰 모두보기에서 페이징 위한 리뷰 갯수
	 * 
	 * @param paging
	 * @return
	 */
	public int selectCntAll2(Paging paging);
	
	/**
	 * 리뷰 삭제
	 * 
	 * @param reviewSns
	 */
	public void remove(ReviewSns reviewSns);
	
	/**
	 * 페이징을 위한 책 총 개수
	 * 
	 * @param paging
	 * @return
	 */
	public int selectCntAll3(Paging paging);
	
	/**
	 * 책 리스트
	 * 
	 * @param bookPaging
	 * @return
	 */
	public List<Book> bookList(Paging bookPaging);
	
	/**
	 * 별점 입력
	 * 
	 * @param grade
	 */
	public Grade addGrade(Grade grade);
	
	/**
	 * 별점 취소
	 * 
	 * @param grade
	 * @return
	 */
	public Grade removeGrade(Grade grade);
	
	/**
	 * 내 별점 확인
	 * 
	 * @param grade
	 * @return
	 */
	public Score getMyGrade(Grade grade);
	

}
