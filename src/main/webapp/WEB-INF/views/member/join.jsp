<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- jQuery 2.2.4 라이브러리 추가 -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



<title>::산타북스 회원가입::</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 생년월일 날짜 선택 -->
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
	type="text/css" />

<!-- jQuery 기본 js파일 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<!-- 배송지주소과 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<!-- 관심장르 선택 창 갯수 설정-->
<script src="https://ajax.googleapis.com/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("input[type='checkbox']")
								.on(
										"click",
										function() {
											var count = $("input:checked[type='checkbox']:not([name='termsofuse'])").length;

											if (count > 5) {
												$(this).prop("checked", false);
												alert("5개까지만 선택할 수 있습니다")
											}
										});
					});
</script>


<script type="text/javascript">
// 날짜 추가하는 메소드
$(function() {
	$("#testDatepicker").datepicker({
		dateFormat : "yymmdd"
	});
});
</script>

<!-- 비밀번호 -->
<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var memberPw = $("input[id='memberPw']").val();
			var memberPwChk = $("input[id='memberPwChk']").val();
			if (memberPw != "" || memberPwChk != "") {
				if (memberPw == memberPwChk) {
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");
				} else {
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}
			}
		});
	});
</script>





<!-- 도로명 주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 참고 항목 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postCode').value = data.zonecode;
						document.getElementById("roadAddress").value = roadAddr;
						document.getElementById("jibunAddress").value = data.jibunAddress;

						// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
						if (roadAddr !== '') {
							document.getElementById("extraAddress").value = extraRoadAddr;
						} else {
							document.getElementById("extraAddress").value = '';
						}

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'none';
						}
					}
				}).open();
	}
</script>

<script type="text/javascript">
$(document).ready(function() {
	 $("#btn-membernick").on("click", function() {
			var memberNick = $('#memberNick').val();

			$.ajax({
				url : "/member/join_nickcheck",
				type : 'post',
				data : {
					"memberNick" : memberNick
				},
				datatype : "json",
				success : function(res) {
					console.log(res)
					console.log(res.nickCheck);

// 					if (res.nickCheck == 1) {
// 						$('#nick_check').text('중복된 닉네임입니다')
// 						$('#nick_check').css('color', 'red')
// 						nick_Check = false;

// 					} else {
// 						if (nickCheck.test(membernick)) {
// 							$('#nick_check').text('사용가능한 닉네임입니다')
// 							$('#nick_check').css('color', 'green')
// 							nick_Check = true;

// 						} else if ($('#memberNick').val() == '') {
// 							$('#nick_check').text('닉네임을 입력해주세요')
// 							$('#nick_check').css('color', 'red')
// 							nick_Check = false;

// 						} else {
// 							$('#nick_check').text('올바른 닉네임 형식이 아닙니다')
// 							$('#nick_check').css('color', 'red')
// 							nick_Check = false;

// 						}
// 					}
					
					if (res.nickCheck == 1) {
						console.log("중복")
					} else {
						console.log("안중복")
					}
				}

			})
	 })
})
</script>




<style type="text/css">
#selCnt {
	width: 180px;
}

.form-group :not (:first-child ) * {
	font-weight: normal;
}
</style>

</head>
<body>

	<div class="container">
		<div class="col-xs-12 text-center">

			<div class="col-xs-8" style="margin: 0 auto; float: none;">
				<h2>산타북스 회원가입</h2>
				<form action="/member/join" method="post" class="form-horizontal">

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label for="memberID">이메일</label>
						</div>
						<div class="col-xs-6">
							<input type="text" class="form-control" name="memberId"
								id="memberId" placeholder="e-mail을 입력하세요">
						</div>
						<div class="col-xs-3">
							<input type="button" onclick="CheckId" value="인증하기"
								class="btn btn-primary">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberName">이름</label>
						</div>
						<div class="col-xs-6">
							<input type="text" class="form-control" name="memberName"
								id="memberName" placeholder="성함을 입력해주세요">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label for="memberNick">닉네임</label>
						</div>
						<div class="col-xs-6">
							<input type="text" class="form-control" name="memberNick"
								id="memberNick" placeholder="닉네임을 입력해주세요">
						</div>
						<div class="col-xs-3">
							<input type="button" id="btn-membernick"
								value="중복확인" class="btn btn-primary">
							<div class="check_font" id="nick_check"></div>
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberPw">비밀번호</label>
						</div>
						<div class="col-xs-6">
							<input type="password" class="form-control" name="memberPw"
								id="memberPw" placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8-16자">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberPwChk">비밀번호 확인</label>
						</div>
						<div class="col-xs-6">
							<input type="password" class="form-control" name="memberPwChk"
								id="memberPwChk">
						</div>
					</div>

					<div class="alert alert-success" id="alert-success">비밀번호가
						일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지
						않습니다.</div>



					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberBirth">생년월일</label>
						</div>
						<div class="col-xs-6">
							<input type="text" style="cursor: pointer;" class="form-control"
								id="testDatepicker" name="memberBirth" readonly="readonly">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberTel">휴대전화</label>
						</div>
						<div class="col-xs-6">
							<input type="text" class="form-control" name="memberTel"
								id="memberTel" placeholder="(-)없이 입력해주세요">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="zip_num">우편번호</label>
						</div>
						<div class="col-xs-3">
							<input type="text" id="postCode" placeholder="우편번호"
								name="postCode" class="form-control">
						</div>
						<div class="col-xs-3">
							<input type="button" onclick="sample4_execDaumPostcode()"
								value="우편번호 찾기" class="btn btn-primary">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="address1">배송지 주소</label>
						</div>
						<div class="col-xs-8">
							<input type="text" class="form-control" id="roadAddress"
								name="roadAddress" placeholder="도로명주소">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label"></div>
						<div class="col-xs-8">
							<input type="text" class="form-control" id="jibunAddress"
								name="jibunAddress" placeholder="지번주소">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label"></div>
						<div class="col-xs-4">
							<input type="text" class="form-control" id="detailAddress"
								name="detailAddress" placeholder="상세주소">
						</div>
						<div class="col-xs-4">
							<input type="text" class="form-control" id="extraAddress"
								name="extraAddress" placeholder="참고항목">
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="memberGender">성별</label>
						</div>
						<div class="col-xs-2">
							<label><input type="radio" name="memberGender"
								value="female" checked="checked" /> 여성</label>
						</div>
						<div class="col-xs-2">
							<label><input type="radio" name="memberGender"
								value="male" /> 남성</label>
						</div>
					</div>



					<div class="form-group">
						<div class="col-xs-3 control-label">
							<label id="genre">관심분야</label>
						</div>
						<div class="col-xs-9 text-left">
							<label><input type="checkbox" name="genre" value="1" />로맨스</label>&nbsp;
							<label><input type="checkbox" name="genre" value="2" />추리</label>&nbsp;
							<label><input type="checkbox" name="genre" value="3" />판타지</label>&nbsp;
							<label><input type="checkbox" name="genre" value="4" />스릴러</label>&nbsp;
							<label><input type="checkbox" name="genre" value="5" />액션</label>&nbsp;
							<label><input type="checkbox" name="genre" value="6" />로맨스
								판타지</label>&nbsp;
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label"></div>
						<div class="col-xs-9 text-left">
							<label><input type="checkbox" name="genre" value="7" />미스터리</label>&nbsp;
							<label><input type="checkbox" name="genre" value="8" />공포</label>&nbsp;
							<label><input type="checkbox" name="genre" value="9" />무협</label>&nbsp;
							<label><input type="checkbox" name="genre" value="10" />여행</label>&nbsp;
							<label><input type="checkbox" name="genre" value="11" />과학</label>&nbsp;
							<label><input type="checkbox" name="genre" value="12" />게임</label>&nbsp;
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 control-label"></div>
						<div class="col-xs-9 text-left">
							<label><input type="checkbox" name="chk" value="13" />인문/사회</label>&nbsp;
							<label><input type="checkbox" name="chk" value="14" />시/산문</label>&nbsp;
							<label><input type="checkbox" name="chk" value="15" />역사</label>&nbsp;
							<label><input type="checkbox" name="chk" value="16" />여행</label>
							<!-- 							<div class="col-xs-9"> -->
							<!-- 								<input type="radio" name="genre" value="female" />추후삭제 -->
							<!-- 							</div> -->
						</div>
					</div>

<!-- 					<div class="form-group"> -->
<!-- 						<div class="col-xs-3 control-label"> -->
<!-- 							<label id="subcheck">구독여부</label> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-2"> -->
<!-- 							<label><input type="radio" name="subcheck" value="y" /> -->
<!-- 								구독</label> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-3"> -->
<!-- 							<label><input type="radio" name="subcheck" value="n" -->
<!-- 								checked="checked" /> 구독 안함</label> -->
<!-- 						</div> -->
						<!-- 							<div class="col-xs-6"> -->
						<!-- 								<input type="radio" name="subcheck" value="female" />추후삭제 -->
						<!-- 							</div> -->
					</div>
					<div class="form-group">
						<div class="text-center">
							<label><input type="checkbox" name="termsofuse"
								value="이용약관" />이용약관 및 개인정보수집 및 이용, 마케팅 수신(선택)에 모두 동의합니다.</label>
						</div>
					</div>

					<input type="hidden" name="ip" value="${GetIpAddress.getIp()}">
					<div class="form-group">
						<div class="col-xs-12  text-center">
							<input type="submit" value="회원가입" class="btn btn-success">
							<input type="reset" value="취소" class="btn btn-warning">
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>