<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
function chk() {
	var req = document.form.req.checked;
	var num = 0;
	
		if (req == true) {
		num = 1;				
	}
	if (num == 1) {
		document.form.submit();
		location.href = "/subscribe/first";
		} else {
		alert("개인정보 약관에 동의하셔야 합니다.");
		}
	}

function nochk() {
	alert("동의하지 않으면 가입하실 수 없습니다");
	location.href = "/";
	
	}
	
	</script>
	
	
<body style="background-color:#F7F7F4">
<div class="container" style="width:630px;">
<br>
<div class="page-header" style="text-align: center;"><h2>정기구독 이용약관</h2></div><br><br>


<div style="text-align: center; width:630px;">
<button type="button" class="btn btn-secondary" style="width: 200px;" >1. 이용약관 동의</button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">2. 배송정보 입력 및 결제 </button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">3. 정기구독 신청 완료</button>
</div>

<hr>
<form name="form" method="post">
<div><br>
<textarea rows="15" cols="150" style="width:630px;">
산타북스 정기구독 이용약관


01. [종이책 선물 서비스]

“약관에 동의하며, 결제를 진행합니다." 라는 이용 신청시의 물음에 이용자가 동의하면(체크 박스에 체크) 약관에 동의하는 것으로 간주됩니다.
- 종이책 선물 서비스 발송 관리
종이책 선물 서비스 발송 내역과 배송 현황은 산타북스 배송내역을 통해 그 내용을 확인할 수 있습니다.
회원이 배송지를 잘못 입력하여 오발송이 되었을 시, 발생하는 손해에 대해 회사는 책임을 지지 않습니다.
단, 책이 발송되기 전에 이용자가 고객센터를 통해 배송지 정정 신청을 할 경우 배송지를 정정하여발송할 수 있습니다.


02. 종이책 선물 서비스를 위한 개인정보의 수집 및 이용
회사는 서비스의 원활한 제공을 위한 목적으로 회원이 서비스와 관련하여 회사에 제공하는 개인정보를 수집, 이용하며, 회원은 이에 동의합니다.

</textarea>
<label for="hint" style="cursor:pointer"><input type="checkbox"  id="hint" name="req"> 개인정보 수집 및 이용에 동의합니다.</label>

<br>
<br>

<div style="text-align: center;">
	<tr>
		<td align="center" valign="top">
			<input type="button" class="btn btn-success btn-block" 
	 		style="background: #5BB88B;width: 174px;margin-left: 50;margin-left: 112px;" onclick="chk()" value="다음으로" />
			<input style="width: 174px; margin-top: -66px;  margin-top: 50; margin-left: 196px;  width: 174; background-color: #dee2e6;" 
			type="button" class="btn" value="동의하지 않습니다" onclick="nochk()" />
		</td>
	</tr>
</div>
</div>
</form>
</div>


</body>




<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>