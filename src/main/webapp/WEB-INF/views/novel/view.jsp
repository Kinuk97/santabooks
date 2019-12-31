<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">

	<table class="table" style="border: 1px solid #CCC; border-collapse: separate;">
	  <tbody>
	    <tr>
	      <td rowspan="3" colspan="2" style="width: 50px;"><img src="/resources/images/logo.png" width="100%"></td>
	      <td>
	      ${novel.title }
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
	      </td>
	      <td>${novel.memberName }</td>
	    </tr>
	    <tr>
	      <td colspan="2" style="padding-top: 10px;">
	        <div style="height: 65px;">${novel.discription }</div>
	        <diV class="text-right"><button class="btn btn-warning">즐겨찾기</button></diV>
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
		<div class="card" style="width: 18rem;">
		  <ul class="list-group list-group-flush">
			<c:forEach items="${episodeList }" var="episode">
		    <li class="list-group-item">Cras justo odio</li>
		    <li class="list-group-item">Dapibus ac facilisis in</li>
		    <li class="list-group-item">Vestibulum at eros</li>
			</c:forEach>
		  </ul>
		</div>
		</c:otherwise>
	</c:choose>
	</div>
	
	<div class="text-right">
		<a href="/episode/add" class="btn btn-success">연재하기</a>
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />