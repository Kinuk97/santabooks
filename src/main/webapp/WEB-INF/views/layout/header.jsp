<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SantaBooks</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/common.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/header.js"></script>
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
						<li class="nav-item"><a class="nav-link" href="/subscribe/agree">구독하기
								<span class="sr-only">(current)</span>
						</a></li>
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
					</ul>
					<!-- 검색폼 -->
<!-- 					<form class="form-inline my-2 my-md-0"> -->
<!-- 						<input class="form-control" type="text" placeholder="Search" -->
<!-- 							aria-label="Search"> -->
<!-- 					</form> -->
						<span>
							<a href="/member/login">로그인</a> / <a href="/member/join">회원가입</a>
						</span>
				</div>
			</div>
		</nav>

	</div>
	
	<div class="wrapper">

