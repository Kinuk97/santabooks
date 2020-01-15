<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style>

.container {
	width : 1400px;
    display: block;
    text-align: center;
	justify-content: center;
	align-items: stretch;
}

#info_name{
	width: 80%;
 	float : right;
	height: 50px;
    color: #1C5B8C;
    line-height: 150%;
    text-align: left;
}

#info_id{
	width: 80%;
	float : right;
	height: 50px;
    color: #1C5B8C;
    line-height: 150%;
    text-align: left;
}

#info_nick{
	width: 80%;
	float : right;	
	height: 50px;
    line-height: 150%;
    text-align: left;    
}

#info_genre{
	width: 80%;
	float : right;	
	height: 50px;
    line-height: 150%;
    text-align: left;    
}

.container {
	text-align: center;
}
</style>

<br>
<div id = "mypage_info" style="text-align: center;" >
	<h2>📂 ${info.memberNick }님의 마이페이지</h2>
</div>
<hr><br>

<div class = "container" style="height: 400px; width: 30%; border:1px solid black; border-radius: 25px;">

<div id = "info_name"> 
	<label style="font-size: 20px;color: black"> 이름  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${info.memberName }</strong></label>

</div>
<br>
<div id = "info_id">
	<label style="font-size: 20px;color: black"> 아이디  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${info.memberId }</strong> </label>
</div>
<br>
<div id = "info_nick">
	<label style="font-size: 20px;color: black"> 닉네임  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${info.memberNick }</strong> </label>
</div>
<br>
<div id = "info_genre">
	<label style="font-size: 20px;color: black">관심 장르  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>
	<c:forEach items="${genre }" var="gen_str">
	${gen_str }&nbsp;
	
	</c:forEach>

	</strong> </label>

	<br><br>
	<a href="/mypage/infoUpdate?memberId=${info.memberId }"><button id="my_info" class="btn btn-success btn-sm">개인정보 수정</button></a>
	<a href="/mypage/delete?memberNo=${info.memberNo }"><button id="memberDrawal" class="btn btn-danger btn-sm">회원탈퇴</button></a>
	<c:if test="${info.subcheck == '구독중'}">
		<a href="/mypage/subCancel?memberNo=${info.memberNo }"><button id="subCancel" class="btn btn-warning btn-sm">구독취소</button></a>
	</c:if>
</div>
</div>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />