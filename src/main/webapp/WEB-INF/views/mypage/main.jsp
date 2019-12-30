<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style>
#mypage_info{
	height: 40px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: stretch;
	margin-right: 730px;
}

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
<div id = "mypage_info" >
	<h2>📂 ${info.memberNick }님의 마이페이지</h2>
</div>
<hr>

<div class = "container" style="height: 350px; width: 30%; border:1px solid black; border-radius: 25px;">

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
	<label style="font-size: 20px;color: black"><strong>${info.genre }</strong> </label>

	<br><br>
	<a href="/mypage/infoUpdate?memberId=${info.memberId }"><button id="my_info" class="btn btn-success btn-sm">개인정보 수정</button></a>
	<a href="/mypage/drawal"><button id="memberDrawal" class="btn btn-danger btn-sm">회원탈퇴</button></a>
	<button id="qna" class="btn btn-primary btn-sm">1:1문의</button>
</div>

</div>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />