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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://unpkg.com/popper.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/header.js"></script>


<script src="https://apis.google.com/js/platform.js?onload=start" async defer></script>
<meta name="google-signin-client_id" content="885356568935-shi7r2ikuk7k8snemu76ckiec978dkpe.apps.googleusercontent.com">

<script>
function start() {
  gapi.load('auth2', function() {
    auth2 = gapi.auth2.init({
      client_id: '885356568935-shi7r2ikuk7k8snemu76ckiec978dkpe.apps.googleusercontent.com'
      , scope: 'profile email'
    });
  });
}

function signOut() {
	auth2.signOut().then(function () {
		console.log('User signed out.');
	});
	
	auth2.disconnect();
	location.href="/member/logout";
}
</script>

</head>
<body>

	<div class="header">
		<!-- navbar-expand-lg에서 -lg를 지우면 container보다 살짝 넓어짐 -->
		<nav class="navbar navbar-expand navbar-dark bg-color">
			<div class="container-xl">
				<a class="navbar-brand" href="/">SantaBooks</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navBar"
					aria-controls="#navBar" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navBar">
					<ul class="navbar-nav mr-auto">
					<c:choose>
					<c:when test="${not empty subNo }">
						<li class="nav-item"><a class="nav-link" href="/mypage/subInfo">구독
						</a></li>
					</c:when>
					<c:when test="${empty subNo }">
						<li class="nav-item"><a class="nav-link" href="/subscribe/agree">구독
						</a></li>
					</c:when>
					</c:choose>
					
					
						<li class="nav-item"><a class="nav-link" href="/novel/list">소설</a></li>
						<li class="nav-item"><a class="nav-link" href="/sns/list">리뷰SNS</a></li>
						<!-- 드롭다운 item -->
<!-- 						<li class="nav-item dropdown"><a -->
<!-- 							class="nav-link dropdown-toggle" href="#" id="dropdown07XL" -->
<!-- 							data-toggle="dropdown" aria-expanded="false">Dropdown</a> -->
<!-- 							<div class="dropdown-menu" aria-labelledby="dropdown07XL"> -->
<!-- 								<a class="dropdown-item" href="#">Action</a> <a -->
<!-- 									class="dropdown-item" href="#">Another action</a> <a -->
<!-- 									class="dropdown-item" href="#">Something else here</a> -->
<!-- 							</div></li> -->
					<c:if test="${not login}">	
						<li class="nav-item" style="margin-left: 560px;"><a class="nav-link" href="/member/login">로그인</a> </li>
						<li class="nav-item"><a class="nav-link" href="#">/</a></li>
						<li class="nav-item"><a class="nav-link" href="/member/join">회원가입</a></li>
					</c:if>
					<c:if test="${login}">	
						<li class="nav-item">
							<a class="nav-link" href="/mypage/main">마이페이지 |</a>
						</li>
						<li class="nav-item">
	   		   				<a class="nav-link" href="#" onclick="signOut();">로그아웃</a>
						</li>
					</c:if>
					</ul>
					<!-- 검색폼 -->
<!-- 					<form class="form-inline my-2 my-md-0"> -->
<!-- 						<input class="form-control" type="text" placeholder="Search" -->
<!-- 							aria-label="Search"> -->
<!-- 					</form> -->
				
				</div>
			</div>
		</nav>

	</div>
	
	<div class="wrapper">

