<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	height: 200px;
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
	border: 2px solid rgba(20, 121, 87,.25);
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
	top: 80px; 
	width: 300px; 
	border: 2px solid rgba(20, 121, 87, .25);
}

#searchBtn{
	width:100px;
	background-color:rgba(20, 121, 87,.25); 
	border:none; 
	color: black;
}

</style>
</head>

	<div class="container">
	<br>
		<div id="search">
			<center>
				<form action="/book/list" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목,작가를 입력하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="submit">검색</button>
					</div>
					</div>
				</form>

			</center>
		</div>
			
		<br><br>
		<div style="position: relative;">
		<div style="position: absolute; z-index: 1; right: 4px; top: 4px;">
			<button class="btn btn-secondary" id="writeBtn">리뷰 작성</button>
		</div>

			<div id="bookRecommand">
				<div class="card sidenav" style="height: 600px;">
					<div class="card-text">책추천 들어갈 예정</div>
				</div>
			</div>

				<c:forEach items="${reviewList }" var="review">
					<div class="row">
						<div class="column" onclick="location.href='/sns/view?feedNo=${review.feedNo}'">
							<div class="card" id="review">
								<div class="card-text">
									<p>${review.bookName }</p>
									<p>${review.bookWriter }</p>
									<p>${review.review }</p>
									<div class="text-right">${review.reviewDate }</div>
								</div>
							</div>
			
						</div>
					</div>
					<br>
					<br>
				</c:forEach>
		</div>
	</div>


	<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />