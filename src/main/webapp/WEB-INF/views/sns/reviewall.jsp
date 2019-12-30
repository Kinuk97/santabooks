<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<c:forEach items="${reviewList }" var="review">
	<div class="row">
		<div class="column"
			onclick="location.href='/sns/view?feedNo=${review.feedNo}'">
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

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />