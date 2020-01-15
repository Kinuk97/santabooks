<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />


<!-- 관심장르 선택 창 갯수 설정-->
<!-- <script src="https://ajax.googleapis.com/jquery/3.3.1/jquery.min.js"></script> -->
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

<script>
	jQuery(document).ready(function($) {
		$("input[name=chk]:checkbox").change(function() {// 체크박스들이 변경됬을때
			var cnt = $("#selCnt").val();
			if (cnt == $("input[name=chk]:checkbox:checked").length) {
				$(":checkbox:not(:checked)").attr("disabled", "disabled");
			} else {
				$("input[name=chk]:checkbox").removeAttr("disabled");
			}
		});

		$("#selCnt").change(function() {
			$("input[name=chk]:checkbox").removeAttr("checked");
			$("input[name=chk]:checkbox").removeAttr("disabled");
		});
	});
</script>


<script type="text/javascript">
	$(document).ready(function() {

		$('#memberPwOrigin').blur(function() {
			var memberPw = $('#memberPwOrigin').val();
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
						console.log("결과값 1");
						$('#blurPw').css('color', 'green');
						$('#blurPw').text('현재 비밀번호가 일치합니다.');
						checkPwd = true;
					} else {
						console.log("결과값2");
						$('#blurPw').css('color', 'red');
						$('#blurPw').text('현재 비밀번호가 일치하지않습니다.');
						checkPwd = false;
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
		<c:forEach items="${genre }" var="gen_num">
		$("[name='genre'][value='${gen_num}']").attr('checked', true);
		</c:forEach>
	});		
				
</script>


<script type="text/javascript">
	var checkPwd = false;

	$(document).ready(function() {
		//작성버튼 동작
		$("#btnUpdate").click(function() {
			if($("#memberPwOrigin").val() != "" && checkPwd){
				alert("수정 되었습니다.");
			}  else {
				alert("현재 비밀번호를 확인해주세요.")
				return false;
			}
		});
		//취소버튼 동작
		$("#btnCancel").click(function() {
			confirm("취소 하시겠습니까?");
			history.go(-1);
		});
	});
</script>

<script type="text/javascript">
	$(function() {
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$("input").keyup(function() {
			var memberPwUp = $("#memberPw").val();
			var memberPwChk = $("#memberPwChk").val();
			if (memberPwUp != "" || memberPwChk != "") {
				if (memberPwUp == memberPwChk) {
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

<style type="text/css">
#selCnt {
	width: 180px;
}
</style>

<div class="container">
	<h1>개인정보 수정</h1>
	<hr>
	<br>

	<div class="container list-container">
		<form name="infoUpdateView" action="/mypage/infoUpdate" method="post">
			<input type="hidden" name="memberNo" value="${view.memberNo }" />
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">아이디</div>
				<div class="col-md-4" style="font-size: 16px;">${view.memberId }</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">이름</div>
				<div class="col-md-4" style="font-size: 16px;">${view.memberName }</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">닉네임</div>
				<div class="col-md-4">
					<input type="text" class="form-control" id="memberNick"
						name="memberNick" value="${view.memberNick }" required />
				</div>
				<div class="col-md-4">
					<a href="/member/check" target="_blank">
						<button id="nickcheckChk" class="btn btn-success">중복검사</button>
					</a>
				</div>
				<div class="col-md-1"></div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">현재 비밀번호</div>
				<div class="col-md-4">
					<input type="password" class="form-control" id="memberPwOrigin"
						name="memberPwOrigin" placeholder="현재 비밀번호를 입력하세요." required />
					<div class="pw_font" id="blurPw"></div>
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">수정 비밀번호</div>
				<div class="col-md-4">
					<input type="password" class="form-control" id="memberPw"
						name="memberPw" placeholder="변경할 비밀번호를 입력하세요." />
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">수정 비밀번호 확인</div>
				<div class="col-md-4">
					<input type="password" class="form-control" id="memberPwChk"
						name="memberPwChk" placeholder="변경할 비밀번호를 입력하세요." />
					<div class="alert alert-success" id="alert-success">수정 비밀번호가
						일치</div>
					<div class="alert alert-danger" id="alert-danger">수정 비밀번호가 일치하지 않음</div>
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">생년월일</div>
				<div class="col-md-4">
					<input type="text" class="form-control" id="memberBirth" required
						name="memberBirth" value="${view.memberBirth  }"  />
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">연락처</div>
				<div class="col-md-4">
					<input type="text" class="form-control" id="memberTel" required
						name="memberTel" value="${view.memberTel }" />
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-sm-2 control-label">
					<label id="zip_num" style="font-size: 20px;">우편번호</label>
				</div>
				<div class="col-sm-3">
					<input type="text" id="postCode" value="${view.postCode }" required
						name="postCode" placeholder="우편번호" class="form-control">
				</div>
				<div class="col-sm-3">
					<input type="button" onclick="sample4_execDaumPostcode()"
						value="우편번호 찾기" class="btn btn-primary">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-sm-2 control-label">
					<label id="address1" style="font-size: 20px;">배송지 주소</label>
				</div>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="roadAddress" required
						value="${view.roadAddress }" name="roadAddress"
						placeholder="도로명주소"> <input type="text"
						class="form-control" id="jibunAddress"
						value="${view.jibunAddress }" name="jibunAddress" required
						placeholder="지번주소">
				</div>
				<div class="col-sm-3">
					<input type="text" class="form-control" id="detailAddress"
						value="${view.detailAddress }" name="detailAddress" required
						placeholder="상세주소"> <input type="text"
						class="form-control" id="extraAddress"
						value="${view.extraAddress }" name="extraAddress" required
						placeholder="참고항목">
				</div>
			</div>
			<div class="row">
				<br>
				<div class="col-lg-1"></div>
				<div class="col-md-8">
					<hr>
				</div>
				<br>
				<div class="col-lg-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2" style="font-size: 20px;">관심장르</div>
				
				<ol>

				</ol>
				<div class="form-group">
					<div class="col-xs-3 control-label"></div>
					<div class="col-xs-9 text-left">
						<label><input type="checkbox" name="genre" value="1" />로맨스</label>&nbsp;
						<label><input type="checkbox" name="genre" value="2" />판타지</label>&nbsp;
						<label><input type="checkbox" name="genre" value="3" />자기계발</label>&nbsp;
						<label><input type="checkbox" name="genre" value="4" />예술</label>&nbsp;
						<label><input type="checkbox" name="genre" value="5" />컴퓨터/IT</label>&nbsp;
						<label><input type="checkbox" name="genre" value="6" />시/에세이</label>&nbsp;<br>
					</div>
				</div>

				
				<div class="form-group">
					<div class="col-xs-3 control-label"></div>
					<div class="col-xs-9 text-left">
						<label><input type="checkbox" name="genre" value="7" />경제/경영</label>&nbsp;
						<label><input type="checkbox" name="genre" value="8" />만화</label>&nbsp;
						<label><input type="checkbox" name="genre" value="9" />영화</label>&nbsp;
						<label><input type="checkbox" name="genre" value="10" />건강</label>&nbsp;
					</div>
				</div>


			</div>

			<div class="text-center">
				<button type="submit" id="btnUpdate" class="btn btn-info">정보수정</button>
				<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
			</div>

		</form>
	</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />