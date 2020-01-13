<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<!-- iamport 1.1.5 라이브러리 추가 -->
<script src="https://service.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<!-- jQuery 2.2.4 라이브러리 추가 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style type="text/css">
body{
	background-color: #F7F7F4;
}
.input {
	text-align: center;
	border: 1.2px solid #ccc;
	border-radius: 5px; 
}

</style>

<script type="text/javascript">

$(document).ready(function() {
	// iamport 변수 초기화
	var IMP = window.IMP;
	IMP.init('imp00770987');	// 가맹점 식별코드, 회원가입해서 직접 넣어야합니다

	// 결제 모듈 불러오기
	$("#pay").click(function() {
		requestPayment();
	});
	
	$("#pay_2").click(function() {
		requestDesposit();
	})
	
	$("#subPay").change(function() {
		
		$("#subPayText").hide();
		
		if( 'card' == $(this).val() ) {
			$("#pay").show();
			$("#pay_2").hide();
			$("#message").hide();
		}
		if( 'deposit' == $(this).val() ) {
			$("#pay").hide();
			$("#pay_2").show();
			$("#message").show();
		}
	})
	
});

function check(){
	console.log("ㅎㅇㅎㅇㅎㅇㅎㅇㅎ")
	if($("input:checkbox[id='hint']").is(":checked")){
	     $("input:checkbox[id='hint']").prop("checked", true);
	     
		$.ajax({
			type: "POST",
			url: "/subscribe/getInfo",
			data: {  },
			dataType:"json",
			success: function(res){
// 				alert("Good")
				console.log(res.member.memberName);
				$("#subName").attr("value",res.member.memberName);
				$("#subTel").attr("value",res.member.memberTel);
				$("#postCode").attr("value",res.member.postCode);
				$("#roadAddress").attr("value",res.member.roadAddress);
				$("#jibunAddress").attr("value",res.member.jibunAddress);
				$("#detailAddress").attr("value",res.member.detailAddress);
				$("#extraAddress").attr("value",res.member.extraAddress);
			},
			error: function(e){
				console.log(e);
				
			}
		})
	     
	console.log("체크_check")
	}else{
	     $("input:checkbox[id='hint']").prop("checked", false);
	 	 $("#subName").attr("value", "");
		 $("#subTel").attr("value", "");
		 $("#postCode").attr("value", "");
		 $("#roadAddress").attr("value", "");
		 $("#jibunAddress").attr("value", "");
		 $("#detailAddress").attr("value", "");
		 $("#extraAddress").attr("value", "");
	}
}

function requestDesposit() {
	var is_empty=false;
	$('#subscribeform').find('input[id!="extraAddress"]').each(function() {
		if(!$(this).val()) {
			is_empty = true;
		}
	})
	
	if(is_empty) {
		alert('값을 모두 입력해 주세요')
	} else {		
		$("form").submit();
	}
			
}	






// 결제 요청 - 결제 모듈 불러오기
function requestPayment() {
	
	var is_empty=false;
	$('#subscribeform').find('input[id!="extraAddress"]').each(function() {
		
// 		if( $(this).is( $('input[name="subTerm"]') ) ) return;
		
		if(!$(this).val()) {
			is_empty = true;
		}
	})
	if(is_empty) {
		alert('값을 모두 입력해 주세요')
	} else {		
	
	IMP.request_pay({
	    pg : 'html5_inicis', //PG사 - 'kakao':카카오페이, 'html5_inicis':이니시스(웹표준결제), 'nice':나이스페이, 'jtnet':제이티넷, 'uplus':LG유플러스, 'danal':다날, 'payco':페이코, 'syrup':시럽페이, 'paypal':페이팔
	    pay_method : 'card', //결제방식 - 'samsung':삼성페이, 'card':신용카드, 'trans':실시간계좌이체, 'vbank':가상계좌, 'phone':휴대폰소액결제
	    merchant_uid : 'merchant_' + new Date().getTime(), //고유주문번호 - random, unique
	    name : '산타북스 정기구독', //주문명 - 선택항목, 결제정보 확인을 위한 입력, 16자 이내로 작성
	    amount : 100, //결제금액 - 필수항목
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
	        
// 	        location.href = "/subscribe/final";
	   		$("form").submit();

	        
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
}
</script>


<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<div class="container" style="width:650px;">
<br>
<div class="page-header"><h2>정기구독</h2></div><span class="text-secondary">배송정보 입력 및 결제</span><hr><br>

<div style="text-align: center; width:630px;">
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">1. 이용약관 동의</button>
<button type="button" class="btn btn-secondary" style="width: 200px;" >2. 배송정보 입력 및 결제 </button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">3. 정기구독 신청 완료</button>
</div>
<br><br>



<form action="/subscribe/first" method="post" id="subscribeform"  >
	
	
	
	<label for="hint" style="cursor:pointer; margin-left: 15px;"><input type="checkbox"  id="hint" name="req" onclick="check()"/> 회원가입 정보와 동일합니다. </label> <br><br>
	
		

		
		<label for="memberID"  class="col-5">아이디</label>  ${MemberId } <br><br>
	

		<label for="subName"  class="col-5">수령인</label>
		<input class="input" type="text" id="subName" name="subName" placeholder="받으실 분의 이름을 입력하세요" style = "width: 357px" /> <br><br>

		<label for="subTel" class="col-5">휴대전화</label>
		<input class="input" type="text" id="subTel" name="subTel" placeholder="휴대폰 번호를 입력하세요"style = "width: 357px" />  <br><br>

		<label for="subTerm" class="col-5">배송 메모</label>
		<select  class="input" id="subTerm" name="subTerm"  style = "width: 357px; height: 28px; text-align-last: center; " >	
			<option value="선택 안함" style = "color: #6c757d;" >선택하세요</option>
			<option value="배송 전 연락 바랍니다." style = "color: #6c757d;">배송 전 연락 바랍니다.</option>
			<option value="부재시 전화나 문자 바랍니다." style = "color: #6c757d;">부재시 전화나 문자 바랍니다.</option>
			<option value="부재시 경비실에 맡겨주시기 바랍니다." style = "color: #6c757d;">부재시 경비실에 맡겨주시기 바랍니다.</option>
			<option value="부재시 집 앞에 집 앞에 놔주세요." style = "color: #6c757d;">부재시 집 앞에 집 앞에 놔주세요.</option>
		</select>
		<br><br>


	

		<label for="subAdd_1" class="col-5">배송지 주소
			<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호" class="btn btn-secondary btn-sm" 
			style="height: 25px;font-size: 10px; position: relative; bottom: 3px;"><br></label>
			<input class="input" type="text" id="postCode" name="postCode" placeholder="우편번호" style = "width: 357px">
			
		<div style="margin-left: -75px; margin-bottom: 4px;">
		<label for="" style="width:333px"></label>
		
			<input class="input" type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" style="width: 181px;" >
			<input class="input" type="text" id="jibunAddress" name="jibunAddress" placeholder="지번주소" style="width: 172px;">
		</div>	
			<span id="guide" style="color:#999;display:none"></span>
			
		<div  style="margin-left: -75px">
			<label for="" style="width:333px"></label>
			<input class="input" type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" style="width: 181px;">
			<input class="input" type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" style="width: 172px;">
		</div>


		<br><br>
		
		<div style="position: relative;">
		<label for="subPay" class="col-5">결제 정보</label>
		
		<select  class="input" id="subPay" name="subPay"  style = "width: 357px; height: 28px; text-align-last: center;" >	
			<option disabled selected  style = "color: #6c757d;">선택하세요</option>
			<option value="card" style = "color: #6c757d;" >카드 / 간편결제</option>
			<option value="deposit" style = "color: #6c757d;">무통장 입금  110-41071946 (신한은행) </option>
		</select>
		<br>
		<div style="position: absolute; right: 87px;">
		<span id="subPayText">결제 방법을 선택하세요</span>
		<span id="message" style="display: none;"><br> 110-414-071946 신한은행 <br> 0000년 00월 00일 00시 00분까지 9,900 입금해주세요 <br></span>
		</div>
		</div>
	
	
		<br><br>
		
		<button type="button" id="pay" class="btn btn-light" style=" background-color: #dee2e6; display: none; position: relative; left: 280px; top: 7px;"  >결제</button>
		<button type="button" id="pay_2" class="btn btn-light" style=" background-color: #dee2e6; display: none; position: relative; left: 280px; top: 30px;" >결제</button>
		<br>
		<br><br>


</form>



</div>
  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title" style="text-align: center" >확인 메시지</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-success btn-block" data-dismiss="modal" style="background: #5BB88B;">확인</button>
        </div>
        
      </div>
    </div>
  </div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>