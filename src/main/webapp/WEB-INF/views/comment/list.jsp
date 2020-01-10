<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card" style="width: 60rem; margin: 0 auto;">
  <div class="card-header">
    <div class="input-group">
	  <textarea class="form-control" aria-label="With textarea" name="content" id="commentContent"></textarea>
	  <div class="input-group-append">
	    <span class="input-group-text" style="padding: 0;"><button class="btn btn-default" style="height: 100%; width: 100%;" type="button" id="addCommentBtn">등록</button></span>
	  </div>
	</div>
  </div>
<ul class="list-group list-group-flush">
<c:forEach items="${commentList }" var="comment">
  <c:choose>
  	<c:when test="${comment.parentCmtNo == 0 }">
    <li class="list-group-item">
    	<div class="row">
    		<div class="col-5 text-left">${comment.memberName }</div><div class="col-7 text-right">${comment.addDate }</div>
    	</div>
    	<hr>
    	<div>
    		${comment.content }
    	</div>
    	<div class="text-right btnDiv">
    	<c:if test="${comment.replyCnt != 0 }">
    		<button class="viewReply" data-commentno=${comment.commentNo }>더보기 (${comment.replyCnt })</button>
    	</c:if>
    	</div>
    </li>
  	</c:when>
  	<c:otherwise>
    <li class="list-group-item reply" data-type="reply" data-parentno="${comment.parentCmtNo }" style="display: none;">
    	<div class="row">
	    	<div class="col-5 text-left">${comment.memberName }</div><div class="col-7 text-right">${comment.addDate }</div>
    	</div>
    	<hr>
    	<div>
    		${comment.content }
    	</div>
    </li>
  	</c:otherwise>
  </c:choose>
</c:forEach>
	<li class="list-group-item replyWriteLi" style="display: none;" id="replyWriteForm">
		 <div class="input-group">
		  <textarea class="form-control" aria-label="With textarea"></textarea>
		  <div class="input-group-append">
		    <span class="input-group-text" style="padding: 0;"><button class="btn btn-default" style="height: 100%; width: 100%;">등록</button></span>
		  </div>
		</div>
	</li>
</ul>
<input type="text" id="curPage" hidden="hidden" value="${paging.curPage }">
</div>
