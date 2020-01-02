<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#btnWrite").click(function() {
		$(location).attr("href", "/mypage/qnaWrite");
	});
})
</script>

<style type="text/css">
table {
	table-layout: fixed;
}

table, th {
	text-align: center;
}

td:nth-child(2) {
	text-align: left;
	
	white-space:nowrap;	
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<div class="container">

<h1 class="pull-left">게시판 리스트</h1>
<div class="clearfix"></div>
<hr>

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th style="width: 10%">글번호</th>
		<th style="width: 10%">회원닉네임</th>
		<th style="width: 30%">제목</th>
		<th style="width: 25%">내용</th>
		<th style="width: 15%">작성일</th>
		<th style="width: 10%">조회수</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${list }" var="q">
	<tr>
		<td>${q.qnaNo }</td>
		<td>${q.memberNick }</td>
		<td><a href="/mypage/qnaView?qnaNo=${q.qnaNo }">${q.qnaTitle }</a></td>
		<td>${q.qnaContent }</td>
		<td>${q.writeDate }</td>
		<td>${q.hit }</td>
	</tr>
</c:forEach>
</tbody>
</table>

<span class="pull-left">total : ${paging.totalCount }</span>

<button id="btnWrite" class="btn btn-primary pull-right">글쓰기</button>
<div class="clearfix"></div>

<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>

</div><!-- .container -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
