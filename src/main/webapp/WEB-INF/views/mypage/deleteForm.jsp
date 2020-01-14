<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#memberPw').blur(function() {
			var memberPw = $('#memberPw').val();
			console.log(memberPw)
			$.ajax({

				type : "post",
				url : "/mypage/infoPwChk",
				data : {
					"memberPw" : memberPw
				},
				datatype : "json",
				success : function(res) {

					if (res.password == 1) {
						console.log("결과값 1")
						$('#blurPw').css('color', 'green')
						$('#blurPw').text('현재 비밀번호가 일치합니다.')
					} else {
						console.log("결과값2")
						$('#blurPw').css('color', 'red')
						$('#blurPw').text('현재 비밀번호가 일치하지않습니다.')
					}

				},
				error : function(e) {
					console.log(e)
				}
			})
		})

	});
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	//삭제버튼 동작
	$("#btnDelete").click(function() {
		var delConfirm = confirm('정말 탈퇴하시겠습니까?');
		if (delConfirm) {
		$("form").submit();
		$(location).attr("href", "/mypage/delete?memeberNo=${member.memberNo}");
		      alert('탈퇴되었습니다.');
		   }
		   else {
		      alert('탈퇴가 취소되었습니다.');
		      history.go(-1);
		   }
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		alert("취소 하시겠습니까?");
		history.go(-1);
	});
	
});
</script>

<style type="text/css">
h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 60px;
}

#div_currpw{
	width : 23%;
	height: 50px;
    color: #1C5B8C;
    font-family: dotum;
    line-height: 150%;
    text-align: left;
}

h1 {
text-align: center;
}
</style>

<div class="container">
<h1>🔐 회원탈퇴 🔐</h1><hr><br><br>

<p>"다음 사항을 꼭 확인해주세요."<br>
회원탈퇴 관련하여 자주 묻는 질문 (FAQ)<br><br>
Q : 결제 정보는 어떻게 되나요?<br>
A : 탈퇴 즉시 삭제되며 환불 받을 수 없습니다.<br><br>

Q : 탈퇴한 계정의 아이디나 이메일로 다시 가입할 수 있나요?<br>
A : 탈퇴가 완료되면 편법 이용행위를 방지하기 위하여 아이디 및 이메일 주소를 암호화하여 보관합니다.<br><br>

아이디는 영구적으로 재사용 할 수 없으며, 이메일은 탈퇴 후 30일이 경과하면 다시 사용할 수 있습니다.
<br><br>

"본인확인을 위해 비밀번호를 입력해주세요."
</p>

<div id = "div_currpw">
<form action="/mypage/delete" method="post">
<input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="현재 비밀번호를 입력하세요." required />
<div class="pw_font" id="blurPw"></div>
<input type="hidden" value="${member.memberNo }" name="memberNo"/>
</form>
</div>

<br>
<p>탈퇴가 완료된 계정은 다시 복구할 수 없습니다.</p>
<input type="checkbox" id="checkBox_01" required="required" style="width:10px">
<small>위 내용을 이해했으며, 모두 동의합니다</small><br><br><br>


<button type="button" id="btnDelete" class="btn btn-danger">확인</button>
<button type="button" id="btnCancel" class="btn btn-warning">취소</button>

</div>
<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />