<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<style type="text/css">

.column {
	width: 100%;
	padding: 0 10px;
}

.card {
	height: 300px;
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

</style>

<script type="text/javascript">
$(document).ready(function() {
	//뒤로가기
	$("#back").click(function() {
		history.go(-1);
	});
	
});
</script>

<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-left" id='back'></i>
 <br><br>
<h1 style="font-weight: bold;">&nbsp;&nbsp;리뷰(${bookName.bookName })</h1>
<hr>
<div class="container">
<c:forEach items="${reviewList }" var="review">
	<div class="row">
		<div class="column">
			<div class="card" id="review">
				<div class="card-text">
					(작성자 들어갈 예정)&nbsp;&nbsp;&nbsp;(작성자가 준 별점 들어갈 예정)
					<hr>
					<p>${review.review }</p>
					<p class="text-right">${review.reviewDate }</p>
					<hr>
					(좋아요 들어갈 예정	)
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
</c:forEach>
</div>

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />