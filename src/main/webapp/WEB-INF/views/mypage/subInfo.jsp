<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style>
#info_nick{
	width: 80%;
	float : right;	
	height: 50px;
    line-height: 150%;
    text-align: left;    
}

#info_sub{
	width: 80%;
	float : right;	
	height: 50px;
    line-height: 150%;
    text-align: left;    
}

</style>


<div class="container">
<h1>구독 정보</h1><hr><br>
<h2>📂 ${subInfo.memberNick }님의 구독정보</h2><br><br>

<div id = "info_name">
	<label style="font-size: 20px;color: black"> 이름  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.memberName }</strong> </label>
</div>
<br>
<div id = "info_sub">
	<label style="font-size: 20px;color: black"> 구독여부  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.subcheck }</strong> </label>
</div>
<br>
<div id = "info_postCode">
	<label style="font-size: 20px;color: black"> 구독여부  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.subDate }</strong> </label>
</div>
<br>
<div id = "info_nick">
	<label style="font-size: 20px;color: black"> 닉네임  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.memberNick }</strong> </label>
</div>
<br>
<div id = "info_add">
	<label style="font-size: 20px;color: black"> 주소1  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.postCode }</strong> </label>
</div>
<br>
<div id = "info_name">
	<label style="font-size: 20px;color: black"> 주소2  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.roadAddress }</strong> </label>
</div>
<br>
<div id = "info_name">
	<label style="font-size: 20px;color: black"> 주소3 </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.jibunAddress }</strong> </label>
</div>
<br>
<div id = "info_name">
	<label style="font-size: 20px;color: black"> 주소4 </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.detailAddress }</strong> </label>
</div>
<br>
<div id = "info_name">
	<label style="font-size: 20px;color: black"> 주소5  </label>&nbsp;&nbsp;&nbsp;
	<label style="font-size: 20px;color: black"><strong>${subInfo.extraAddress }</strong> </label>
</div>
<br>

</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />