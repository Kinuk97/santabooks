<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



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
<!-- 	<li class="list-group-item replyWriteLi" style="display: none;" id="replyWriteForm"> -->
<!-- 		 <div class="input-group"> -->
<!-- 		  <textarea class="form-control" aria-label="With textarea"></textarea> -->
<!-- 		  <div class="input-group-append"> -->
<!-- 		    <span class="input-group-text" style="padding: 0;"><button class="btn btn-default" style="height: 100%; width: 100%;">등록</button></span> -->
<!-- 		  </div> -->
<!-- 		</div> -->
<!-- 	</li> -->
