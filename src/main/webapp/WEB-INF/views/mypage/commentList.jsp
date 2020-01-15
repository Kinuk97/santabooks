<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">
h2 {
text-align: center;
}
</style>

<div class="container">

<h2>나의 댓글 목록</h2><hr>

<c:forEach items="${commentList }" var="comment" begin="1" end="10">
    <li class="list-group-item" data-commentno="${comment.commentNo }">
    	<div class="row">
    		<div class="col-5 text-left">${comment.memberName }</div><div class="col-7 text-right">${comment.addDate }</div>
    	</div>
    	<hr>
    	<div>${comment.content }</div>
    	<div class="text-right btnDiv">
    	<c:if test="${comment.memberNo == MemberNo}">
    		<button class="modifyBtn btn btn-warning" data-commentno=${comment.commentNo }>수정</button>
    		<button class="removeBtn btn btn-danger" data-commentno=${comment.commentNo }>삭제</button>
    	</c:if>
   		<button class="viewReply btn btn-info" data-commentno=${comment.commentNo }>답글 (${comment.replyCnt })</button>
    	</div>
    </li>
</c:forEach>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />