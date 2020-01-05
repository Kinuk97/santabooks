<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<link href="/resources/rating/css/star-rating.css" rel="stylesheet">
<script type="text/javascript" src="/resources/rating/js/star-rating.js"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">
	<table class="table" style="border: 1px solid #CCC; border-collapse: separate;">
	  <tbody>
	    <tr>
	      <td rowspan="3" colspan="2" class="img_wrap" style="width: 17%;">
	      <c:choose>
	      	<c:when test="${novel.imgOriginName != null }">
		    	<img src="/upload/${novel.imgStoredName }"alt="...">
	      	</c:when>
	      	<c:otherwise>
			    <img src="/resources/images/logo.png" alt="...">
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
   	        <button class="btn btn-warning" style="float: right"><img alt="..." src="/resources/images/novel/heart.svg" class="icon"></button>
   	        </div>
   	        <div style="clear: both;"></div>
	      </td>
	    </tr>
	  </tbody>
	</table>
	<div class="episodeDiv">
		<div class="card" style="width: 60rem; margin: 0 auto;">
		  <ul class="list-group list-group-flush">
		    <li class="list-group-item">
		    	<b>${episode.title }</b>
		    	<span id="starSpan">
		    	<c:forEach begin="1" end="5" step="1" varStatus="i">
		    	<c:choose>
		    		<c:when test="${i.count <= episode.score }">
				    <img alt="..." src="/resources/images/novel/star-fill.svg" class="icon">
		    		</c:when>
		    		<c:otherwise>
				    <img alt="..." src="/resources/images/novel/star.svg" class="icon">
		    		</c:otherwise>
		    	</c:choose>
	        	</c:forEach>
		    	</span>
		    	<span style="float: right;">${episode.addDate }</span>
		    	<hr>
		    	<div>${episode.content }</div>
		    </li>
		  </ul>
		</div>
	</div>
	
	<hr>
	
	<div class="text-center">
		<a class="btn btn-success" href="/novel/view?novelNo=${novel.novelNo }">목록</a>
		<c:if test="${MemberNo == novel.memberNo }">
			<a class="btn btn-info" href="/episode/modify?episodeNo=${episode.episodeNo }">수정</a>
			<a class="btn btn-danger" href="/episode/remove?episodeNo=${episode.episodeNo }&novelNo=${episode.novelNo}">삭제</a>
		</c:if>
	</div>
	
	<input name="rating" id="rating-system" type="text" class="rating rating-loading" data-size="lg" style="vertical-align: top; "value="${myScore.score }">
</div>

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

<input type="text" id="episodeNo" hidden="hidden" value="${episode.episodeNo }">
<input hidden="hidden" type="text" value="${episode.novelNo }" id="novelNo">
<input type="text" id="score" hidden="hidden" value="${episode.score }">

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />