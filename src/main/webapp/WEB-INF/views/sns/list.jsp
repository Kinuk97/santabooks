<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="query" value="&searchType=${paging.searchType}&keyword=${paging.keyword }"/>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />
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
	/* this adds the "card" effect */
	padding: 16px;
	background-color: #f1f1f1;
}

@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
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
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(20, 121, 87,.0);
}

#writeBtn{
	background-color:rgba(20, 121, 87,.25); 
	border:none; 
	color: black;
	width: 300px;
}

#bookRecommand{
	position: absolute; 
	z-index: 1; 
	right: 4px; 
	width: 300px;
	top: 190px;  
	
}

#searchBtn{
	width:70px;
	background-color:rgba(20, 121, 87,.25); 
	border:none; 
	color: black;
}
#naverSearch{
	position: absolute; 
	z-index: 1; 
	right: 20px; 
	width: 300px;
	top: 24px; 
	
}

#santaSearch{
	position: absolute; 
	z-index: 1; 
	right: 20px; 
	width: 300px;
	top: 100px; 
	
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	$(window).scroll(function() {
		   if($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
			   $("#stickyBox").css("position", "static");
			   console.log(1)
		   }
		   else {
			   $("#stickyBox").css("position", "sticky");
			   console.log(2)
		   }
	});
})
</script>

</head>

	<div class="container" style="width:950px" >
		<br>
		<div>
			<center>
				<h3 style="font-weight: bold;">🔍리뷰 검색</h3>
				<form action="/sns/list" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<select name="searchType" class="bg-light border-0">
						<option value="bookName">제목</option>
						<option value="bookWriter">작가</option>
					</select>
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목,작가를 입력하여 리뷰를 검색하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="submit"><i class="fas fa-search"></i></button>
					</div>
					</div>
				</form>
			</center>
		</div>
		<br>
		<div style="position: relative;">

			<div id="stickyBox" style="position: sticky; z-index: 1; right: 4px; top: 4px;">
			<div id="santaSearch">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<small style="font-weight: bold;">🎅&nbsp;산타북스 책 검색</small>
			<center>
				<form action="/sns/santabookslist" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목, 작가를 입력하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="submit"><i class="fas fa-search"></i></button>
					</div>
					</div>
				</form>
			</center>
			</div>
			
			<div id="naverSearch">
			&nbsp;&nbsp;&nbsp;&nbsp;<img src="/resources/images/naver.ico" style="height:20px;">&nbsp;<small style="font-weight: bold;">네이버 책 검색</small>
			<center>
				<form action="/book/list" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목, 작가를 입력하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="submit"><i class="fas fa-search"></i></button>
					</div>
					</div>
				</form>
			</center>
			</div>
			<br>
			
				<div class="card sidenav" id="bookRecommand" style="height: 470px;">
					<div class="card-text"><h4 style="font-weight: bold;">책추천</h4></div>
					<c:forEach items="${bookInfo }" var="book">
					<div style="position: relative;">
					<a  href="/sns/view?bookNo=${book.bookNo}">	
					<img style="height: 60px; width: 50px;" src="/resources/images/${book.bookName}.jpg">
					</a>
						<div style="position: absolute; top:3px; left:60px;">
						<small style="font-weight: bold;">${book.bookName }</small>
						<br> 
						<small style="font-weight: bold;">${book.bookWriter }</small>
						</div>
					</div>
					<br>
					</c:forEach>
				</div>
					<div style="float: right; position: relative; top: 645px; z-index:1; right:10px;">
					<i class="fas fa-arrow-up" id="top" onclick="location.href='#'">TOP</i>
					</div>
				
			</div>

				<c:forEach items="${reviewList }" var="review">
					<c:if test="${review.privacy eq 1}">
					<div class="row">
						<div class="column" onclick="location.href='/sns/view?bookNo=${review.bookNo}'">
							<div class="card" id="review">
								<div class="card-text">
									<div style="position: relative;">
									<h4>${review.bookName } | ${review.bookWriter }</h4>
									<hr>
<!-- 									<div style="position: absolute; z-index:1; right: 7px; top:9px;"> -->
									<input type="hidden" value="${member.memberNick }">
									<small>작성자 : ${review.memberNick }</small>
<!-- 									</div> -->
									</div>
									<hr>
									<p>${review.review }</p>
									
									<div style="text-align: right; position: absolute; bottom: 10px; right: 20px;">${review.reviewDate }</div>
								</div>
							</div>
			
					<br>
					<br>
						</div>
					</div>
					</c:if>
				</c:forEach>
		</div>
	</div>
<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />