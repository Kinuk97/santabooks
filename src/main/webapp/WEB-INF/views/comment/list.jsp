<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="card" style="width: 90%; margin: 0 auto;">
  <div class="card-header">
    <input type="text" name="content">
    <label><button>작성</button></label>
  </div>
  
<c:forEach items="${commentList }" var="comment">

  <ul class="list-group list-group-flush">
    <li class="list-group-item">
    	<div class="col-12">
	    	<div class="row">
	    	<div class="col-5 text-left">${comment.memberName }</div><div class="col-7 text-right">${comment.addDate }</div></div>
    	<hr>
    	</div>
    	<div class="col-12">${comment.content }</div>
    </li>
  </ul>
</c:forEach>
</div>
