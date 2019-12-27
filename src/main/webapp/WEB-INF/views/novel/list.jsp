<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">
	
	<div class="col-12">
		<ul>
			<!-- 여기서부터 장르 거르기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! 작업 중 -->
			<li class="category"><a href="" class="btn btn-outline-success">전체</a></li>
			<li class="category"><a href="" class="btn btn-outline-success">현판</a></li>
			<li class="category"><a href="" class="btn btn-outline-success">로맨스</a></li>
			<li class="category"><a href="" class="btn btn-outline-success">로판</a></li>
			<li class="category"><a href="" class="btn btn-outline-success">무협</a></li>
		</ul>
		<div style="clear: both;"></div>
	</div>

	<hr>
	<div class="col-12">
		<h2>Best 소설</h2>
	</div>
	<br>

	<!-- <div class="row bestNovel"> -->
	<div class="card-deck">
	<c:forEach items="${best }" var="novel">
		<div class="col-4">
			<div class="card">
			  <img src="/resources/images/logo.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${novel.title }</h5>
			    <p class="card-text">${novel.discription }</p>
			    <a href="#" class="btn btn-primary">Go somewhere</a>
			  </div>
			</div>
		</div>
	</c:forEach>
	</div>
	
	<hr>
	
	<div class="row">
	<c:forEach items="${list }" var="novel">
		<div class="col-3 novelItem">
			<div class="card">
			  <img src="/resources/images/logo.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">${novel.title }</h5>
			    <p class="card-text">${novel.discription }</p>
			    <a href="#" class="btn btn-primary">Go somewhere</a>
			  </div>
			</div>
		</div>
	</c:forEach>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />