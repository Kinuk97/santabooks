<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">

#div_currpw{
	width : 23%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}

</style>

<div class="container">
<h1>🛎 1:1문의</h1><hr><br>

<p><h2>문의 등록</h2><br>
고객님의 문의에 대해서는 확인 후 답변드리고 있습니다.<br>
하지만 주말, 공휴일 동안 남겨주신 문의는 접수된 순서에 따라<br>
답변이 진행되어 안내가 지연될 수 있는 점 양해 부탁드립니다.<br><br>

운영시간 : 월~목 10:00 ~ 18:00, 금요일 10:00 ~ 17:00<br>
점심시간 13:000 ~ 14:00, 주말 및 공휴일 휴무<br><br>
</p>

<a href="">▶ 산타북스 FAQ</a><br>

<a href="/mypage/qnaList">▶ 산타북스 1:1문의</a>

</div>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />