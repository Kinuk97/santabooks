<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include>
<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 아이디 중복 체크 -->

<script>
$(document).ready(function() {
	// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#uemail").blur(function() {
		var uemail = $('#memberId').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/member/idCheck?uEmail='+ uemail,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);			
				
				
				if (data==1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("사용중인 아이디입니다 :p");
					$("#id_check").css("color", "red");
					$("#submit").attr("disabled", true);
				
				} else{
				
					var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
					if(regExp.test(uemail)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("");
						
						$("#id_check").text("회원가입이 가능한 이메일 입니다 .");
						$("#id_check").css("color", "green");
						$("#submit").attr("disabled", false);
						
			
					} else if(uemail == ""){

						$('#id_check').text('이메일을 입력해주세요.');
						$('#id_check').css('color', 'red');
						$("#submit").attr("disabled", true);				
						
					} else {
						
						$('#id_check').text("이메일형식으로 입력해주세요.");
						$('#id_check').css('color', 'red');
						$("#submit").attr("disabled", true);
					}
					
				
				}
			}, error : function() {
					console.log("실패");
			}
		});
	});
	
});


</script>

</head>
<body>



	<table border="1" width="300" height="300" align="center">
		<center>
			<span style="color: green; font-weight: bold;">이메일 인증 (이메일을 인증
				받아야 다음 단계로 넘어갈 수 있습니다.)</span> <br> <br> <br> <br>

			<div style="text-align: center;">
				<tr>
					<td>

						<form action="/member/auth" method="post">


							<br>
							<div>
								이메일 : <input type="email" id="memberId" name="memberId"
									placeholder="  이메일주소를 입력하세요. ">
							</div>
							<div class="check_front" id="id_check"></div>
							<br> <br>
							<button type="submit" id="submit" name="submit">이메일 인증받기
								(이메일 보내기)</button>

						</form>
			</div>
			</td>
			</tr>
	</table>

<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>