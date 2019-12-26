package com.santabooks.util;

public class Paging {
	private int curPage;

	private int totalCount;
	private int listCount;
	private int totalPage;

	private int pageCount;
	private int startPage;
	private int endPage;

	private int startNo;
	private int endNo;

	private int feedNo;
	private int bookNo;
	private int memberNo;
	private String review;
	private int privacy;

	public Paging() {

	}

	// 총 게시글 수를 입력받는 생성자
	public Paging(int totalCount) {
		this.setTotalCount(totalCount);

		this.makePaging();
	}

	// 총 게시글 수와 현재 페이지를 입력하는 생성자
	public Paging(int totalCount, int curPage) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);

		this.makePaging();
	}

	// 총 게시글 수와 현재 페이지, 보여질 게시글 수를 입력하는 생성자
	public Paging(int totalCount, int curPage, int listCount) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);
		this.setListCount(listCount);

		this.makePaging();
	}

	// 총 게시글 수와 현재 페이지, 보여질 게시글 수, 보여질 페이지 수를 입력하는 생성자
	public Paging(int totalCount, int curPage, int listCount, int pageCount) {
		this.setTotalCount(totalCount);
		this.setCurPage(curPage);
		this.setListCount(listCount);
		this.setPageCount(pageCount);

		this.makePaging();
	}

	// 페이징 정보 생성
	private void makePaging() {
		if (totalCount == 0)
			return; // 게시글이 없는 경우

		if (curPage < 1)
			setCurPage(1); // 첫 페이지 기본값 세팅
		if (pageCount < 1)
			setPageCount(10); // 첫 페이지 기본값 세팅
		if (listCount < 1)
			setListCount(10); // 첫 페이지 기본값 세팅

		// 총 페이지 수 계산
		totalPage = totalCount / listCount;
		if (totalCount % listCount > 0)
			totalPage++;
		// 현재 페이지 보정
		// 홈 페이지 번호보다 현재 페이지ㅂ 번호가 높을 때 총 페이지 번호로 고정
		if (totalPage < curPage)
			curPage = totalPage;

		// 화면에 보여질 페이징 시작번호와 끝번호
		startPage = ((curPage - 1) / pageCount) * pageCount + 1;
		endPage = startPage + pageCount - 1;

		// 계산된 끝 페이지 번호가 총 페이지 수보다 클 때 보정
		if (endPage > totalPage)
			endPage = totalPage;

		// 화면에 보여질 게시글의 시작번호와 끝번호
		startNo = (curPage - 1) * listCount + 1;
		endNo = curPage * listCount;
	}

	@Override
	public String toString() {
		return "Paging [curPage=" + curPage + ", totalCount=" + totalCount + ", listCount=" + listCount + ", totalPage="
				+ totalPage + ", pageCount=" + pageCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", startNo=" + startNo + ", endNo=" + endNo + ", feedNo=" + feedNo + ", bookNo=" + bookNo
				+ ", memberNo=" + memberNo + ", review=" + review + ", privacy=" + privacy + "]";
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getFeedNo() {
		return feedNo;
	}

	public void setFeedNo(int feedNo) {
		this.feedNo = feedNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getPrivacy() {
		return privacy;
	}

	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}

}