<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">
	
	<div class="col-12">
		<ul>
			<li class="category"><a href="/novel/list" class="btn btn-outline-success">전체</a></li>
			<li class="category"><a href="/novel/list?category=1" class="btn btn-outline-success">판타지</a></li>
			<li class="category"><a href="/novel/list?category=2" class="btn btn-outline-success">현판</a></li>
			<li class="category"><a href="/novel/list?category=3" class="btn btn-outline-success">로맨스</a></li>
			<li class="category"><a href="/novel/list?category=4" class="btn btn-outline-success">로판</a></li>
			<li class="category"><a href="/novel/list?category=5" class="btn btn-outline-success">무협</a></li>
			<li class="category addNovel"><a class="btn btn-success" href="/novel/add">소설 등록하기</a></li>
		</ul>
		<div style="clear: both;" class="text-right"></div>
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
			    <h5 class="card-title"><a href="/novel/view?novelNo=${novel.novelNo }">${novel.title }</a></h5>
			    <p class="card-text">
			    ${novel.discription }
			    <br>
			    <c:forEach begin="1" end="5" step="1" varStatus="i">
			    	<c:choose>
			    		<c:when test="${i.count <= novel.score }">
					    <img alt="..." src="/resources/images/novel/star-fill.svg">
			    		</c:when>
			    		<c:otherwise>
					    <img alt="..." src="/resources/images/novel/star.svg">
			    		</c:otherwise>
			    	</c:choose>
			    </c:forEach>
			    </p>
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
			    <h5 class="card-title"><a href="/novel/view?novelNo=${novel.novelNo }">${novel.title }</a></h5>
			    <p class="card-text">
			    ${novel.discription }
			    <br>
			    <c:forEach begin="1" end="5" step="1" varStatus="i">
			    	<c:choose>
			    		<c:when test="${i.count <= novel.score }">
					    <img alt="..." src="/resources/images/novel/star-fill.svg">
			    		</c:when>
			    		<c:otherwise>
					    <img alt="..." src="/resources/images/novel/star.svg">
			    		</c:otherwise>
			    	</c:choose>
			    </c:forEach>
			    </p>
			  </div>
			</div>
		</div>
	</c:forEach>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />