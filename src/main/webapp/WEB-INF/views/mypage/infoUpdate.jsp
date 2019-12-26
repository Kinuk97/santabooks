<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<div class="container">
<h1>개인정보 수정</h1><hr><br>

<div class="container list-container">
<form name="update" action="/mypage/infoUpdate" method="post" >
      <input type="hidden" name="memberNo" value="${Member.memberId }" />
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">아이디</div>
  <div class="col-md-4"style="font-size: 16px;">${Member.memberName }</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">이름</div>
  <div class="col-md-4"style="font-size: 16px;">${Member.memberName }</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2"style="font-size: 20px;">닉네임</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberNick" name="memberNick" value="${Member.memberNick }" />
  </div>
  <div class="col-md-4"> 
  <a href="/member/check" target="_blank">
  <button id = "nickcheck" class="btn btn-success">중복검사</button> </a>
  </div>
  <div class="col-md-1"></div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">비밀번호</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberPw" name="memberPw" value="${Member.memberPw }" />
</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">생년월일</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberBirth" name="memberBirth" value="${Member.memberBirth  }" />
</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2"style="font-size: 20px;">연락처</div>
  <div class="col-md-4">
  	<input type="text" class="form-control" id="memberTel" name="memberTel" value="${Member.memberTel }" />
  </div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">주소</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberAdd" name="memberAdd" value="${Member.memberAdd }" />
</div>
<a href="/member/check" target="_blank">
  <button id = "nickcheck" class="btn btn-success">우편번호</button> </a>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="text-center">
       <button type="button" id="btnUpdate" class="btn btn-info">정보 수정</button>
         <button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />