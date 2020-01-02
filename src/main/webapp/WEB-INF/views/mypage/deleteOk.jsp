<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	//삭제버튼 동작
	$("#btnDelete").click(function() {
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		$(location).attr("href", "mypage/main");
	});
	
});
</script>

</head>
<body>

<h3 style="color: red;">정말로 회원탈퇴를 진행하시겠습니까? </h3>

<form action="mypage/delete" method="post">
<input type="hidden" value="${member.memberNo }" name="memberNo"/>
</form>

<button type="button" id="btnDelete">확인</button>
<button type="button" id="btnCancel">취소</button>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />