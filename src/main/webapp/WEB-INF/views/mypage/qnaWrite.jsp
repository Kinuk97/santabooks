<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	$("#btnWrite").click(function() {
		submitContents($(this));
	});
	
	$("#title").focus();

	$("#cancel").click(function() {
		history.back(-1);
	});
});

</script>

<div class="container">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/mypage/qnaWrite" method="post">
	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" id="writer" value="${nick }" readonly="readonly" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="title" name="title" class="form-control" />
	</div>
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" style="width:100%" id="content" name="content"></textarea>
	</div>

	<div class="text-center">
		<button class="btn btn-primary" id="btnWrite">작성</button>
		<input type="reset" id="cancel"	class="btn btn-danger" value="취소"/>
	</div>
</form>

</div><!-- .container -->





<jsp:include page="/WEB-INF/views/layout/footer.jsp" />