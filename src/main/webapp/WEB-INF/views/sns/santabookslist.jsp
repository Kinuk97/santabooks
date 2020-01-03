<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#searchBtn {
	width: 100px;
	background-color: rgba(20, 121, 87, .25);
	border: none;
	color: black;
}

#review {
	color: black;
	padding: 16px 32px;
	font-size: 16px;
	margin: 4px 2px;
	transition: 0.3s;
}

.column {
	width: 550px;
	padding: 0 10px;
}

.card {
	height: 200px;
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
<div class="container" style="width:950px" >
<div id="search">
			<br>
			<center>
				<form action="/sns/santabookslist" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search"
				method="get">
					<div class="input-group">
					<h3>🎅</h3> &nbsp;
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
		<center>     
        <c:forEach items="${santabooksList}" var ="s">
<!--         <div class="row"> -->
						<div class="column" 
						onclick="location.href='/sns/view?bookNo=${s.bookNo}'"
						>
							<div class="card" id="review">
								<div class="card-text">
									<div style="position: relative;">
									<h4>${s.bookName }</h4>
									<hr>									
									<p>${s.bookWriter } | ${s.bookPublisher } | ${s.publishingYear }</p>
									</div>
<%-- 									<div class="text-right">${review.reviewDate }</div> --%>
								</div>
							</div>
			
					<br><br>     
						</div>
<!-- 					</div> -->
        </c:forEach>
        </center>
    </div>

<jsp:include page="/WEB-INF/views/layout/paging3.jsp" />
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />