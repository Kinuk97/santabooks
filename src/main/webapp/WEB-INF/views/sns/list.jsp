<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
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
	text-align: center;
	background-color: #f1f1f1;
}

@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}

.card {
	background-color: #ddd;
	border: none;
	color: black;
	padding: 16px 32px;
	text-align: center;
	font-size: 16px;
	margin: 4px 2px;
	transition: 0.3s;
}

.card:hover {
	background-color: #147957;
	color: white;
}

#writeBtn{
	background-color:#ddd; 
	border:none; 
	color: black;
	width: 300px;
}
</style>
</head>
<body>


	<div class="container">
		<div class="text-right">
			<button class="btn btn-secondary" id="writeBtn">리뷰 작성</button>
		</div>

		<c:forEach items="${reviewList }" var="review">
			<div class="row">
				<div class="column">
					<div class="card">
						<p>${review.review }</p>
						<div class="text-right">${review.reviewDate }</div>
					</div>
				</div>
			</div>
			<br>
			<br>
		</c:forEach>

	</div>




	<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />