<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	
});
</script>

<style type="text/css">
td.info {
	width: 10%;
}
td:not(.info) {
	width: 40%;
}
</style>

<div class="container">

<h1 class="pull-left">게시글 상세보기</h1>
<button id="btnRecommend" class="btn pull-right">추천</button>
<div class="clearfix"></div>
<hr>

<table class="table table-bordered">
<tr>
<td class="info">글번호</td><td colspan="3">${viewQna.qnaNo }</td>
</tr>

<!-- <tr> -->
<%-- <td class="info">아이디</td><td>${viewQna.memberId }</td> --%>
<%-- <td class="info">닉네임</td><td>${viewQna.memberNick }</td> --%>
<!-- </tr> -->

<!-- <tr> -->
<%-- <td class="info">조회수</td><td>${viewQna.hit }</td> --%>
<%-- <td class="info">작성일</td><td><fmt:formatDate value="${viewQna.writeDate }"/></td></tr> --%>

<tr>
<td class="info">제목</td><td colspan="3">${viewQna.qnaTitle }</td>
</tr>

<tr><td class="info"  colspan="4">본문</td></tr>

<tr><td colspan="4">${viewQna.qnaContent }</td></tr>

</table>

<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/mypage/qnaList"><button class="btn btn-default">목록</button></a>
	<c:if test="${memberId eq viewQna.memberNo }">
		<a href="/mypage/qnaUpdate?qnaNo=${viewQna.qnaNo }"><button class="btn btn-primary">수정</button></a>
		<a href="/mypage/anqDelete?qnadNo=${viewQna.qnaNo }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div><!-- 버튼 영역 end -->

</div><!-- .container -->





<jsp:include page="/WEB-INF/views/layout/footer.jsp" />