<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js" charset="utf-8"></script>
<script type="text/javascript">
</script>

<div class="wrapper">
	<div class="container">
	
	<div id="bg">
  	<img src="/resources/images/books.jpg" alt="">
	</div>
	<section class="section">
	<h1>SantaBooks</h1>
	<h3>매월 10일, 관심사에 알맞는 추천 책을<br>
	 랜덤으로 보내드립니다.
	 <br>월 9,900원 산타북스와 함께하세요.
	</h3>
	<a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain" href="/subscribe/agree">이용하러가기</a>
	</section>
	
	</div>
</div>



<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

