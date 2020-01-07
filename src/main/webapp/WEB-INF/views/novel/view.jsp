<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">
	<table class="table" style="border: 1px solid #CCC; border-collapse: separate;">
	  <tbody>
	    <tr>
	      <td rowspan="3" colspan="2" class="img_wrap" style="width: 17%;">
	      <c:choose>
	      	<c:when test="${novel.imgOriginName != null }">
		    	<img src="/upload/${novel.imgStoredName }">
	      	</c:when>
	      	<c:otherwise>
		    	<img src="/resources/images/logo.png">
	      	</c:otherwise>
	      </c:choose>
	      </td>
	      <td style="width: 55%;">${novel.title }</td>
	      <td style="width: 28%;">${novel.memberName }</td>
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
		    	<small>&nbsp;(${novel.cntScore })</small>
		        	<button class="btn btn-warning" style="float: right" id="favoriteBtn">
		        	<c:choose>
		        		<c:when test="${!empty checkFavorite && checkFavorite}">
			        		<img alt="..." src="/resources/images/novel/heart-fill.svg" class="icon" id="favoriteImg">
		        		</c:when>
		        		<c:otherwise>
			        		<img alt="..." src="/resources/images/novel/heart.svg" class="icon" id="favoriteImg">
		        		</c:otherwise>
		        	</c:choose>
	        		<span id="favoriteCnt">${favoriteCnt }</span>
		        	</button>
				<c:if test="${MemberNo == novel.memberNo }">
				<a style="float: right;" class="btn btn-info" href="/novel/modify?novelNo=${novel.novelNo }">수정</a>
				<a style="float: right;" class="btn btn-danger" href="/novel/remove?novelNo=${novel.novelNo }">삭제</a>
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
		<a class="btn btn-success" href="/novel/list">${episode.score }목록</a>
	</div>
	<c:if test="${episodeList.size() != 0 }">
		<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
	</c:if>
	<input hidden="hidden" type="text" value="${novel.novelNo }" id="novelNo">
	
	<!-- Modal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        로그인이 필요한 기능입니다!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />