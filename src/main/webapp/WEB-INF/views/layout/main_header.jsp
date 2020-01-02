<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SantaBooks</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/main.css" rel="stylesheet">
</head>
<body>

	<div class="header">

<nav class="navbar navbar-expand-sm navbar-dark">
	
	  <!-- Links -->
	  <ul class="navbar-nav">
	    <li class="nav-brand" id="navtitle">
	      <a class="nav-link" href="/main">Santabooks</a>
	    </li>
	    <c:if test="${not login}">	
	   		 <li class="nav-item" id="nav1">
	     		 <a class="nav-link" href="/member/join">회원가입 &nbsp;&nbsp;&nbsp;|</a>
	    	</li>
	    	<li class="nav-item" id="nav2">
	   		   	<a class="nav-link" href="/member/login">로그인</a>
	    	</li>
	   </c:if>
	    <c:if test="${login}">	
	   		
	    	<li class="nav-item" id="nav2">
	   		   	<a class="nav-link" href="/member/logout">로그아웃</a>
	    	</li>
	   </c:if>
	  </ul>

</nav>
</div>