<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<div class="container">

<div class="row">
<c:forEach items="${list }" var="novel">
	<div class="col-3 card">
	  <img src="/resources/images/logo.png" class="card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">${novel.title }</h5>
	    <p class="card-text">${novel.discription }</p>
	    <a href="#" class="btn btn-primary">Go somewhere</a>
	  </div>
	</div>
</c:forEach>
</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />