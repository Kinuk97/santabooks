<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<script type="text/javascript">

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($(this));
	});
	
	$("#title").focus();

	$("#cancel").click(function() {
		history.back(-1);
	});
});
</script>
<script>
  CKEDITOR.replace('qnaContent');
</script>

<div class="container">

<h1>글쓰기 페이지</h1>
<hr>

<form action="/mypage/qnaUpdate" method="post">
	<input type="hidden" name="qnaNo" value="${viewQna.qnaNo }" />

	<div class="form-group">
		<label for="memberNick">작성자</label>
		<input type="text" id="memberNick" value="${viewQna.memberNick }" readonly="readonly" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="qnaTitle" name="qnaTitle" class="form-control" value="${viewQna.qnaTitle }"/>
	</div>
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" style="width:100%" id="qnaContent" name="qnaContent">${viewQna.qnaContent }</textarea>
	</div>

	<div class="text-center">
		<button class="btn btn-primary" id="btnUpdate">수정</button>
		<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
	</div>
	
</form>

</div><!-- .container -->








<jsp:include page="/WEB-INF/views/layout/footer.jsp" />