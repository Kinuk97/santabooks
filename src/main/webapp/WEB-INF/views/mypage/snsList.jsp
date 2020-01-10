<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<c:set var="query" value="&searchType=${paging.searchType}&keyword=${paging.keyword }"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

.column {
	width: 60%;
	padding: 0 10px;
}

.card {
	height: 300px;
}

.row {
	margin: 0 -5px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	padding: 16px;
	background-color: #f1f1f1;
}

#review {
	color: black;
	padding: 16px 32px;
	font-size: 16px;
	margin: 4px 2px;
	transition: 0.3s;
}

#review:hover {
	border-color: #147957;
	outline: 0; /
	box-shadow: 0 0 0 0.2rem rgba(20, 121, 87, .0);
}
</style>

	<div class="container" style="width:950px" >
	
					<h2 style="text-align: center">나의 리뷰 목록</h2><hr><br>

				<c:forEach items="${myReview }" var="myReview">
					<div class="row">
						<div class="column" onclick="location.href='/sns/view?bookNo=${myReview.bookNo}'">
							<div class="card" id="review">
								<div class="card-text">
									<div style="position: relative;">
									<h4>${myReview.bookName } | ${myReview.bookWriter }</h4>
									<hr>
									<input type="hidden" value="${myReview.memberNick }">
									<small>작성자 : ${myReview.memberNick }</small>
									</div>
									<hr>
									<p>${myReview.review }</p>
									
									<div style="text-align: right; position: absolute; bottom: 10px; right: 20px;">${myReview.reviewDate }</div>
								</div>
							</div>
			
					<br>
					<br>
						</div>
					</div>
				</c:forEach>
		</div>
<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />