<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
#subBtn {
	background-color: rgba(20, 121, 87, .25);
	border: none;
	width: 200px;
	color: black;
}

#review{
	width: 300px;
    height: 300px;
    left:50px;
    
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border: 2px solid rgba(20, 121, 87,.25);
	padding: 16px;
	background-color: #f1f1f1;
}

#review:hover {
    border-color: #147957;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(20, 121, 87,.0);
}

</style>

<input type="hidden" value="${review.feedNo }" name="feedNo" />
<div class="container">
	<h1 style="font-weight: bold;">${review.bookName }</h1>
	<h5 style="color: #696969; font-weight: bold;">${review.bookWriter }</h5>
	<hr>

	(평점들갈 예정)
	<hr>

	<button class="btn btn-secondary" id="subBtn"
		onclick="location.href='/subscribe/agree'">구독 하기</button>
	&nbsp;&nbsp;&nbsp;&nbsp; (별점으로 평가하기 들어갈 예정)
	<hr>


	<div class="column">
		<div class="card" id="bookInfo" style="height: 1000px;">
			<div class="card-text">
				<div style="padding: 0px 20px 0px 20px;">
					<h4 style="font-weight: bold;">책 정보</h4>
					<ul>
						<li>책이름 : ${review.bookName }</li>
						<li>작가 : ${review.bookWriter }</li>
						<li>출판사 : ${review.bookPublisher }</li>
						<li>출판년도 : ${review.publishingYear }</li>
					</ul>
				</div>
				<hr>
				
				<div style="padding: 0px 20px 0px 20px;">
				<h4 style="font-weight: bold;">책 내용</h4>
				${review.bookContent }
				</div>
				<hr>
				
				<div style=" position: relative; padding: 0px 20px 0px 20px;">
					<h4 style="font-weight: bold; display: contents;">리뷰</h4>

					<a href="/sns/reviewall?bookNo=${review.bookNo }"
						style="color: #ff2f6e; text-decoration: none; font-weight: bold; position: absolute; right: 20px;">더보기</a>

				</div>
				
				<br>
				<div class="row">
				<c:forEach items="${list }" var="list">
						<div class="column"onclick="location.href='/sns/detailview?feedNo=${list.feedNo}'" 
						style="width: 300px; height: 300px; padding: 4px;margin-right: 65px;">
							<div class="card" id="review">
								<div class="card-text">
									<p>${list.review }</p>
									<br><br><br><br><br><br><br><br>
									<div class="text-right">${list.reviewDate }</div>
								</div>
							</div>
						</div>
						
				</c:forEach>
				</div>
			</div>
		</div>
	</div>


</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />