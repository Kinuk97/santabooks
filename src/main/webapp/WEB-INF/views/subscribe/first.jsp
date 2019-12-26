<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<!-- iamport 1.1.5 라이브러리 추가 -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<!-- jQuery 2.2.4 라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	// iamport 변수 초기화
	var IMP = window.IMP;
// 	IMP.init('imp00770987');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다
	IMP.init('imp00770987');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다

	// 결제 모듈 불러오기
	$("#pay").click(function() {
		requestPayment();
	});
});

// 결제 요청 - 결제 모듈 불러오기
function requestPayment() {
	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
	    name : '주문명:결제테스트', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
	    amount : 9900, //결제금액 - 필수항목
	    buyer_email : 'iamport@siot.do', //주문자Email - 선택항목
	    buyer_name : '구매자이름', //주문자명 - 선택항목
	    buyer_tel : '010-1234-5678', //주문자연락처 - 필수항목, 누락되면 PG사전송 시 오류 발생
	    buyer_addr : '서울특별시 강남구 삼성동', //주문자주소 - 선택항목
	    buyer_postcode : '123-456', //주문자우편번호 - 선택항목
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete' //모바일결제후 이동페이지 - 선택항목, 모바일에서만 동작
	    
	}, function(rsp) { // callback - 결제 이후 호출됨, 이곳에서 DB에 저장하는 로직을 작성한다
	    if ( rsp.success ) { // 결제 성공 로직
	        var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        msg += '[rsp.success]';

	        
	        // 결제 완료 처리 로직
			//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			jQuery.ajax({
				url: "/pay/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
				type: 'POST',
				dataType: 'json',
				data: {
					// rsp객체를 통해 전달된 데이터를 DB에 저장할 때 사용한다
					imp_uid : rsp.imp_uid
				}
			
			}).done(function(data) {
				//[2] 서버에서의 응답 처리
				if ( data == 'success' ) {
					var msg = '결제가 완료되었습니다.';
					msg += '\n고유ID : ' + rsp.imp_uid;
					msg += '\n상점 거래ID : ' + rsp.merchant_uid;
					msg += '\n결제 금액 : ' + rsp.paid_amount;
					msg += '\n카드 승인번호 : ' + rsp.apply_num;
			        msg += '\n[done]';

					alert(msg);
					
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	});
	        
	    } else { // 결제 실패 로직
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}

</script>

<body style="background-color:#F7F7F4">
<div style="text-align: center">

<h1>정기구독</h1>


<form action="/subscribe/first" method="post">
	
	<div>
	<label for="hint" style="cursor:pointer"><input type="checkbox"  id="hint" name="req"> 기존 사용자 정보와 동일합니다. </label> <br>
	
		
	<label for="subName">이름 입력</label>
	<input type="text" id="subName" name="subName" placeholder="이름을 입력"/> <br>

	<label for="subAdd">주소 입력</label>
	<input type="text" id="subAdd" name="subAdd" placeholder="주소를 입력"/>  <br>

	<label for="subTel">번호 입력</label>
	<input type="text" id="subTel" name="subTel" placeholder="휴대폰 번호를 입력"/>  <br>

	<label for="subTerm">배송 메시지 입력</label>
	<input type="text" id="subTerm" name="subTerm" placeholder="배송 메세지를 입력"/>  <br>

	<label for="subPay">결제 정보</label>
	<input type="text" id="subPay" name="subPay" placeholder="결제정보"/>  <br>
	
	<button> 완료 </button>
	
	</div>

</form>



<button id="pay">결제</button>
</div>
</body>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>