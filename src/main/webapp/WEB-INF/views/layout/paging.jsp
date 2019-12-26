<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="text-center">
	<ul class="pagination pagination-sm">
	
	<!-- 처음으로 가기 -->
	<c:if test="${paging.curPage ne 1 }">
	<li><a href="/board/list?curPage=1&&search=${param.search }">&larr;처음</a></li>
	</c:if>
		
	<!-- 이전 페이징 리스트로 가기 -->
	<c:if test="${paging.startPage gt paging.pageCount }">
	<li><a href="/board/list?curPage=${paging.startPage - paging.pageCount }&search=${param.search }">&laquo;</a></li>
	</c:if>
	<c:if test="${paging.startPage le paging.pageCount }">
	<li class="disabled"><a>&laquo;</a></li>
	</c:if>
		
	<!-- 이전 페이지로 가기 -->
	<c:if test="${paging.curPage ne 1 }">
	<li><a href="/board/list?curPage=${paging.curPage - 1 }&search=${param.search }">&lt;</a></li>
	</c:if>
		
		
		
		
		
		
	<!-- 페이징 리스트 -->
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
 	<c:choose>
		<c:when test="${paging.curPage eq i }">
			<li class="active"><a href="/board/list?curPage=${i }&search=${param.search }">${i }</a>
		</c:when>
		<c:otherwise>
			<li><a href="/board/list?curPage=${i }&search=${param.search }">${i }</a>
		</c:otherwise>
 	</c:choose>
	</c:forEach>
	
	
	
	
	
	<!-- 다음 페이지로 가기 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a href="/board/list?curPage=${paging.curPage + 1 }&search=${param.search }">&gt;</a></li>
	</c:if>
	
	<!-- 다음 페이징 리스트로 가기 -->
	<c:if test="${paging.endPage ne paging.totalPage }">
	<li><a href="/board/list?curPage=${paging.startPage + paging.pageCount }&search=${param.search }">&raquo;</a></li>
	</c:if>
	<c:if test="${paging.endPage eq paging.totalPage }">
	<li class="disabled"><a>&raquo;</a></li>
	</c:if>

	<!-- 끝 페이지로 가기 -->
	<c:if test="${paging.curPage ne paging.totalPage }">
	<li><a href="/board/list?curPage=${paging.totalPage }&search=${param.search }">&rarr;끝</a></li>
	</c:if>
	
	</ul>
</div>
