<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>

<style type="text/css">
body{
	background-color: #F7F7F4;
}

#gd{
	width: 630px;
	height: 350px;	
	border-radius: 50px;
	text-align: center;
	background-color: #FFFFFF;
}
#button{
	background-color: #5BB88B;
}
</style>



	
<div class="container" style="width:650px;">
<br>
<div class="page-header"><h2>정기구독</h2></div><span class="text-secondary">구독 신청 완료</span><hr><br>


<div style="text-align: center; width:630px;">
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">1. 이용약관 동의</button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">2. 배송정보 입력 및 결제</button>
<button type="button" class="btn btn-secondary" style="width: 200px;" >3. 정기구독 신청 완료 </button>
</div>


<br><br><br>

<div id="gd">
<!-- <a href="https://tracker.delivery/#/kr.epost/1111111111111" target="_blank">배송조회</a> -->


<h4 style="padding: 58px">정기구독신청이 완료되었습니다.</h4> <br>
<h6>감사합니다 ♥</h6>

<br><br>
<a href = "/"><button class="btn" id="button">메인으로</button></a>

</div>
</div>
<br><br>
<!-- <a href="/subscribe/shipment"><button> 배송 </button></a> -->
<!-- <a href="/subscribe/final1"><button> 구독 취소 </button></a> -->



<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>