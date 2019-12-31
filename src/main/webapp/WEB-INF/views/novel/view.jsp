<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">

	<table class="table" style="border: 1px solid #CCC; border-collapse: separate;">
	  <tbody>
	    <tr>
	      <td rowspan="3" colspan="2" style="width: 37px;"><img src="/resources/images/logo.png" width="100%"></td>
	      <td>${novel.title }</td>
	      <td>${novel.memberName }</td>
	    </tr>
	    <tr>
	      <td colspan="2" style="padding-top: 10px;">
	        <div style="height: 65px;">${novel.discription }</div>
	        <div>
	        	<c:forEach begin="1" end="5" step="1" varStatus="i">
		    	<c:choose>
		    		<c:when test="${i.count <= novel.score }">
				    <img alt="..." src="/resources/images/novel/star-fill.svg" class="icon">
		    		</c:when>
		    		<c:otherwise>
				    <img alt="..." src="/resources/images/novel/star.svg" class="icon">
		    		</c:otherwise>
		    	</c:choose>
		    	</c:forEach>
		        	<button class="btn btn-warning" style="float: right"><img alt="..." src="/resources/images/novel/heart.svg" class="icon"></button>
				<c:if test="${MemberNo == novel.memberNo }">
				<a style="float: right;" class="btn btn-info" href="/episode/modify?novelNo=${novel.novelNo }">수정</a>
				<a style="float: right;" class="btn btn-danger" href="/episode/remove?novelNo=${novel.novelNo }">삭제</a>
				<a style="float: right;" href="/episode/add?novelNo=${novel.novelNo }" class="btn btn-success">연재하기</a>
				</c:if>
	        	<div style="clear: both;"></div>
	        </div>
	      </td>
	    </tr>
	  </tbody>
	</table>
	<div class="episodeDiv">
	<c:choose>
		<c:when test="${episodeList.size() == 0 }">
		아직 연재가 되지 않았습니다.
		</c:when>
		<c:otherwise>
		<div class="card" style="width: 50rem; margin: 0 auto;">
		  <ul class="list-group list-group-flush">
			<c:forEach items="${episodeList }" var="episode">
		    <li class="list-group-item">
		    	<b><a href="/episode/view?novelNo=${episode.novelNo }&episodeNo=${episode.episodeNo }">${episode.title }</a></b>
		    	<span style="float: right;">${episode.addDate }</span>
		    </li>
			</c:forEach>
		  </ul>
		</div>
		</c:otherwise>
	</c:choose>
	</div>
	
	<div class="text-right">
		<a class="btn btn-success" href="/novel/view?novelNo=${novel.novelNo }">목록</a>
	</div>
	
	<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />