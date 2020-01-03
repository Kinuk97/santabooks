<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<link href="/resources/css/mypagecommon.css" rel="stylesheet">

<style type="text/css">
.container{
	padding-top: 70px;

	padding-bottom: 30px;
}
</style>

<div class="container">

<!--메뉴바 추가 부분-->
<nav class="navbar navbar-expand-sm navbar-dark bg-dark">

	<a class="navbar-brand" href="#">SantaBooks</a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarsExample03" aria-controls="navbarsExample03"
		aria-expanded="false" aria-label="Toggle navigation">

		<span class="navbar-toggler-icon"></span>

	</button>


	<div class="collapse navbar-collapse" id="navbarsExample03">

		<ul class="navbar-nav mr-auto">

			<li class="nav-item active">
			<a class="nav-link" href="/mypage/main">나의 정보<span class="sr-only">(current)</span>
			</a></li>
			
			<li class="nav-item"><a class="nav-link" href="/mypage/subInfo">구독 정보</a></li>

			<li class="nav-item"><a class="nav-link" href="/mypage/favorite">즐겨찾기</a></li>
			
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="dropdown03"
				data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">나의 글 모아보기</a>

				<div class="dropdown-menu" aria-labelledby="dropdown03">

					<a class="dropdown-item" href="#">작성한 리뷰</a> <a
						class="dropdown-item" href="/mypage/novelList">작성한 웹소설</a> <a
						class="dropdown-item" href="#">작성한 댓글</a>

				</div></li>
			<li class="nav-item"><a class="nav-link" href="/mypage/shipmentList">받은 책 내역</a></li>
			
			<li class="nav-item"><a class="nav-link" href="/mypage/deletePwChk">회원탈퇴</a></li>

			<li class="nav-item"><a class="nav-link" href="/mypage/qna">문의</a></li>
		</ul>

	</div>

</nav>

</div>
