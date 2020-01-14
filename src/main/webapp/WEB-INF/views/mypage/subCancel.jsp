<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">

.container {
text-align: center;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCancel").click(function() {
		alert("산타북스 구독 서비스가 해지되었습니다.이용해주셔서 감사합니다.");
		var url = '/mypage/subCancel';
		var form = $('<form action="' + url + '" method="post">'
			+ '<input type="text" name="memberNo" value="${subCancel.memberNo}" />'
			+ '<input type="text" name="memberId" value="${subCancel.memberId}" />'
			+ '<input type="text" name="subNo" value="${subCancel.subNo}" />'
			+ '</form>');
		$('body').append(form);
		form.submit();
	});
	
});
</script>

<div class="container">
	<h1>🛎 구독취소</h1><hr><br><br><br>

	<div class="card" style="max-width: 600px; margin:0 auto;">
   	 <div class="row no-gutters">
      	  <div class="col-md-5">
        	    <img src="/resources/images/logo.png" class="card-img-top h-100" alt="...">
       	 </div>
       	 <div class="col-md-7">
        	    <div class="card-body" style="text-align: center"><br>
        	        <h5 class="card-title">구독 취소</h5><br>
         	       <p class="card-text">산타북스 구독 서비스를 해지하시겠습니까?<br>확인 버튼을 누르면 서비스가 해지됩니다.</p>
            	    <button class="btn btn-secondary stretched-link" id="btnCancel">확인</button>
            	</div>
        	</div>
   	 </div>
	</div>

</div>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />