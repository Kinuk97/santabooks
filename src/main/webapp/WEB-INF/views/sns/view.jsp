<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#subBtn{
	background-color:rgba(20, 121, 87,.25); 
	border:none;
	width:200px;
	color:black;
}

</style>

<input type="hidden" value="${review.feedNo }" name="feedNo"/>
<div class="container">
<h1 style="font-weight: bold;">${review.bookName }</h1>
<h5 style="color:#696969; font-weight: bold;">${review.bookWriter }</h5>
<hr>

(평점들갈 예정)
<hr>

<button class="btn btn-secondary" id="subBtn" onclick="location.href='/subscribe/agree'">구독 하기</button>&nbsp;&nbsp;&nbsp;&nbsp; (별점으로 평가하기 들어갈 예정)
<hr>

	
		<div class="column">
			<div class="card" id="review" style="height: 3000px;">
				<div class="card-text">
				<h4 style="font-weight: bold;">책 정보</h4>
				<ul>
					<li>책이름 : ${review.bookName }</li>
					<li>작가 : ${review.bookWriter }</li>
					<li>출판사 : ${review.bookPublisher }</li>
					<li>출판년도 : ${review.publishingYear }</li>
				</ul>
				<hr>
				<h4 style="font-weight: bold;">책 내용</h4>
				
					${review.bookContent }
				<hr>
${review.review }
${review.reviewDate }			
				</div>
			</div>
		</div>
	
	
</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />