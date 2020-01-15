<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<script type="text/javascript" src="/resources/js/mypage.js"></script>

<style type="text/css">
h2 {
text-align: center;
}
</style>

<div class="container">

<h2>나의 댓글 목록</h2><hr>

<div class="commentDiv">

<ul class="list-group list-group-flush commentUl">
 	
</ul>
<div class="text-left"><button class="btn" style="background: #6c757d; margin-top: 5px; color: white;" id="moreBtn">더보기</button></div>
</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />