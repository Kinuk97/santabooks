<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<style type="text/css">
body{
	background-color: #F7F7F4;
}
</style>



<script type="text/javascript">

// $(document).ready(function(){    
// 	$("#nextBtn").click(function(){    
// 		if($("input[name=check_1]").is(":checked") == false){
// 		alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
// 		return;
// 	}else if($("input[name=check_2]").is(":checked") == false){
// 		alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
// 		return;
// 	} else{
// 		location.href = "/subscribe/first";
// 		}
// 	});   
	
// 	$("#Nagree").click(function(){
// 	    alert("약관에 동의 하셔야 서비스 이용이 가능합니다");
// 		location.href = "/";
// 		});
// });

$(document).ready(function(){
   
   $("#nextBtn").click(function(){
      if($("#hint1").is(":checked") && $("#hint2").is(":checked")){
  		location.href = "/subscribe/first";
      } else{
      $('#myModal').modal('show');  
      }
   })
});

</script>


<script type="text/javascript">
function cAll() {
    if ($("input[name=checkAll]").is(':checked')) {
        $("input[type=checkbox]").prop("checked", true);
    } else {
        $("input[type=checkbox]").prop("checked", false);
    }
}
</script>
	
	
<div class="container" style="width:650px;">
<br>
<div class="page-header"><h2>정기구독</h2></div><span class="text-secondary">이용약관</span><hr><br>


<div style="text-align: center; width:630px;">
<button type="button" class="btn btn-secondary" style="width: 200px;" >1. 이용약관 동의</button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">2. 배송정보 입력 및 결제 </button>
<button type="button" class="btn btn-light" style="width: 200px; background-color: #dee2e6;">3. 정기구독 신청 완료</button>
</div><br>

<form name="form" method="post">
<div><br>
<dl><dt style="color: #008946">이용약관</dt></dl>
<textarea rows="10" cols="150" style="width:630px;">
제1조(목적)
이 약관은 한국출판문화산업진흥원(이하"진흥원"라 표기합니다)
이 제공하는 사이버 회원에 대한 서비스 제공 및 이용조건, 회원가입에 관련된 사항 및 절차 그리고 기타 필요한 사항의 규정을 목적으로 합니다.

제2조(약관의 효력)
이 약관은 전기통신사업법 제31조, 동법 시행규칙 제21조의 2에 따라 공시절차를 거친 후 서비스 화면에 게시하거나 전자우편, 기타의 방법으로 회원에게 통지함으로써 효력을 발생합니다.
진흥원은 이 약관을 변경할 수 있으며, 변경된 약관은 변경된 사항에 대하여 공지 또는 통지함으로써 효력을 발생합니다.
제3조(약관 이외의 준칙)
이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신 사업법 및 기타 관련법령에 규정되어있는 경우 그 규정에 따릅니다.
제4조(용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

한국출판문화산업진흥원 사이버회원(이하"회원"이라 표기합니다): 한국출판문화산업진흥원 홈페이지를 통해 사이버 회원에 회원등록 하신 고객
아이디(ID): 회원 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 진흥원이 승인하는 문자와 숫자의 조합
비밀번호: 회원의 비밀보호를 위하여 회원 자신이 설정한 문자와 숫자의 조합
제5조(회원가입 절차, 진흥원의 승낙 및 이용계약의 성립)
회원가입 신청은 온라인으로 다음사항(필수 및 선택사항)을 가입신청 양식에 의거, 기록하여 신청합니다.
- 이름- 아이디(ID)- 비밀번호- 이메일- 주소- 전화번호 등
진흥원의 승낙진흥원은 회원이 제1항에서 정한 필수사항을 정확히 기재하여 이용신청을 하였을 때 승낙합니다. 진흥원은 다음 각 호의 1에 해당하는 이용신청에 대하여는 승낙을 유보할 수 있습니다.
설비에 여유가 없는 경우
기술상 지장이 있는 경우
기타 진흥원이 필요하다고 인정되는 경우 진흥원은 다음 각 호의 1에 해당하는 이용신청에 대하여는 이를 승낙하지 않거나 승낙을 취소할 수 있습니다.
이름이 실명이 아닌 경우
다른 사람의 명의를 사용하여 신청한 경우
이용 신청 시 필요내용을 허위로 기재하여 신청한 경우
사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
기타 진흥원이 정한 이용신청 요건이 미비 되었을 경우
이용자가 등록절차를 걸쳐 "등록" 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다.
제6조(회원 구분)한국출판문화산업진흥원 홈페이지에서 구분하는 회원은 다음과 같습니다.
사이버회원: 한국출판문화산업진흥원 홈페이지를 통해 사이버 회원에 회원등록 하신 고객

제7조(서비스의 내용)
회원에게 한국출판문화산업진흥원의 제반시설 이용 시 이메일을 활용한 정보제공 및 맞춤 서비스 등의 서비스를 제공하며 구체적 서비스내용은 별도로 홈페이지에 게시합니다.

제8조(진흥원의 의무)
진흥원은 서비스제공과 관련해서 알고 있는 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리진흥원의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우에는 그러하지 않습니다.

제9조(회원 아이디(ID)와 비밀번호 관리에 관한 의무)
아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.자신의 아이디(ID)가 부정하게 사용된 경우, 회원은 반드시 진흥원에 그 사실을 통보해야 합니다.

제10조(계약사항의 변경)
회원은 이용 신청 시 기재한 사항이 변경되었을 경우에는 온라인 수정을 해야 합니다.

제11조(회원의 의무)
회원은 관계법령, 이 약관의 규정, 이용안내 및 주의사항 등 진흥원이 통지하는 사항을 준수 하여야 하며, 기타 진흥원의 업무에 방해되는 행위를 해서는 안 됩니다.
회원은 진흥원의 사전 동의 없이 서비스를 이용하여 어떠한 영리 행위도 할 수 없습니다.
회원은 서비스를 이용하여 얻은 정보를 진흥원의 사전 동의 없이 복사, 복제, 변경, 번역, 출판, 방송, 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.
회원은 서비스이용과 관련하여 다음 각 호의 행위를 해서는 안 됩니다.
다른 회원의 아이디(ID)를 부정 사용하는 경우
범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
선량한 풍속, 기타 사회질서를 해하는 경우
타인의 명예를 훼손하거나 모욕하는 행위
타인의 지적 재산권 등의 권리를 침해하는 행위
해킹행위 또는 컴퓨터 바이러스의 유포행위
타인의 의사에 반하여 광고성 정보 등 일정한 내용을 전송하는 행위
서비스의 안정적인 운영에 지장을 주거나, 줄 우려가 있는 일체의 행위-기타 관계법령에 위배되는 행위
제12조(정보의 제공 및 광고의 게재)
진흥원은 서비스를 운용함에 있어 각종 정보를 웹사이트에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.
진흥원은 서비스 운영과 관련하여 웹사이트, 전자우편 등에 광고를 게재할 수 있습니다.
제13조(서비스 제공의 중지)
다음 각 항의 1에 해당하는 경우 서비스 제공을 중지할 수 있습니다.

시스템 정비를 위하여 부득이한 경우
전기통신사업법에 규정된 기간통신 사업자가 전기통신 서비스를 중지하는 경우
기타 진흥원에서 서비스를 제공할 수 없는 사유가 발생할 경우
제14조(게시물에 대한 권리, 의무, 삭제 등)
게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있으며, 게시판에 제10조 제4항과 관련된 자료가 게재되었을 경우, 운영자의 판단에 의하여 게시물을 삭제할 수 있습니다.

제15조(계약해지 및 이용제한)
회원이 이용계약을 해지하고자 하는 때에는 본인이 서비스 또는 전자우편을 통하여 해지하고자 하는 날의 1일 전까지 (단, 해지일이 법정공휴일인 경우 공휴일 개시 2일전) 이를 진흥원에 신청해야 합니다.
진흥원은 회원이 제10조 기타 이 약관의 내용을 위반하고, 진흥원 소정의 기간 이내에 이를 해소하지 아니하는 경우 서비스 이용계약을 해지할 수 있습니다.
제16조(손해배상)
진흥원은 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 동 손해가 진흥원의 중대한 과실에 의한 경우를 제외하고 이에 대하여 책임을 부담하지 아니합니다.

제17조(면책, 배상)
진흥원은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 어떠한 책임을 부담하지 아니하고, 회원은 자기의 책임 아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생하더라도 이에 대한 모든 책임은 회원에게 있습니다.
진흥원은 제10조의 규정에 위반하여 회원 간 또는 회원과 제3자 간에 서비스를 매개로 하여 물품거래 등과 관련해 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련해 기대하는 이익에 관하여 책임을 부담하지 않습니다.
회원 아이디(ID)와 비밀번호의 관리 및 이용 상의 부주의로 인해 발생되는 손해 또는 제3자에 의한 부정사용등에 대한 책임은 모두 회원에게 있습니다.
회원이 제10조, 기타 이 약관의 규정을 위반함으로써 진흥원이 회원 또는 제3자에 대하여 책임을 부담하게 되고, 이를 통하여 진흥원이 손해를 입게 되는 경우, 이 약관을 위반한 회원은 진흥원에 발생된 모든 손해를 배상하여야 하며, 동 손해로부터 진흥원을 면책시켜야 합니다.
제18조(분쟁의 해결)
진흥원와 회원은 서비스와 관련해 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 해야 합니다.
제1항의 규정에도 불구하고, 동 분쟁으로 인해 소송이 제기될 경우, 동 소송은 진흥원의 본사 소재지를 관할하는 법원의 관할로 합니다.
부칙
제1조(시행일)
- 이 약관은 2007년 10월 1일부터 시행합니다.
</textarea>
<label for="hint1" style="cursor:pointer"><input type="checkbox" id="hint1" name="check_1"/> 이용 약관에 동의합니다.</label>

<br><br><br><br>

<dl><dt style="color: #008946">개인정보 수집 및 이용에 대한 안내</dt></dl>
<textarea rows="10" cols="150" style="width:630px;">
01. [종이책 선물 서비스]

“약관에 동의하며, 결제를 진행합니다." 라는 이용 신청시의 물음에 이용자가 동의하면(체크 박스에 체크) 약관에 동의하는 것으로 간주됩니다.
- 종이책 선물 서비스 발송 관리
종이책 선물 서비스 발송 내역과 배송 현황은 산타북스 배송내역을 통해 그 내용을 확인할 수 있습니다.
회원이 배송지를 잘못 입력하여 오발송이 되었을 시, 발생하는 손해에 대해 회사는 책임을 지지 않습니다.
단, 책이 발송되기 전에 이용자가 고객센터를 통해 배송지 정정 신청을 할 경우 배송지를 정정하여발송할 수 있습니다.


02. 종이책 선물 서비스를 위한 개인정보의 수집 및 이용
회사는 서비스의 원활한 제공을 위한 목적으로 회원이 서비스와 관련하여 회사에 제공하는 개인정보를 수집, 이용하며, 회원은 이에 동의합니다.

</textarea>
<!-- <label for="hint" style="cursor:pointer"><input type="checkbox"  id="hint" name="req"> 개인정보 수집 및 이용에 모두 동의합니다.</label> -->
<label for="hint2" style="cursor:pointer"><input type="checkbox" id="hint2" name="check_2"/> 개인정보 수집 및 이용에 모두 동의합니다.</label><br />
<label for="hint3" style="cursor:pointer"><input type="checkbox" id="hint3" name="checkAll" onclick="cAll();"> 전체 동의하기</label>
<br><br><br>
<div style="text-align: center;">
	<tr>
		<td align="center" valign="top">
			<input type="button" class="btn btn-success btn-block" 
	 		style="background: #5BB88B;width: 174px;margin-left: 50;margin-left: 112px;" id = "nextBtn" value="동의합니다" data-toggle="modal" data-target="#myModal" />
			<input style="width: 174px; margin-top: -66px;  margin-top: 50; margin-left: 196px;  width: 174; background-color: #dee2e6;" 
			type="button" class="btn" value="동의하지 않습니다" id = "Nagree" />
		
		
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Open modal</button> -->
		</td>
	</tr>
</div>
</div>
</form>
</div>


</body>

<br><br><br>


  <!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">확인 메시지</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
         	모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">확인</button>
        </div>
        
      </div>
    </div>
  </div>
  
<!-- </div> -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>