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

#my_info{
	height: 50px;
    line-height: 150%;
    text-align: left;  
}

</style>

<br>
<div id = "mypage_info" >
	<h2>나의 정보</h2>
</div>

<div class = "container">

</div>
<div id = "info_name"> 
	<label style="font-size: 20px;color: black"> 이름  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${Member.memberName }</strong></label>

</div>
<br>
<div id = "info_id">
	<label style="font-size: 20px;color: black"> 아이디  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${Member.memberId }</strong> </label>
</div>
<br>
<div id = "info_nick">
	<label style="font-size: 20px;color: black"> 닉네임  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${Member.member }</strong> </label>
</div>
<br>
<div id = "info_genre">
	<label style="font-size: 20px;color: black"> 장르  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${Member.genre }</strong> </label>
</div>

<button id="my_info" class="btn btn-success">개인정보 수정</button>

<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />