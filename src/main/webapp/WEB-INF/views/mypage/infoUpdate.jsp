<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<script>
jQuery(document).ready(function($) {
    $("input[name=chk]:checkbox").change(function() {// 체크박스들이 변경됬을때
        var cnt = $("#selCnt").val();
        if( cnt==$("input[name=chk]:checkbox:checked").length ) {
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
	
	//작성버튼 동작
	$("#btnUpdate").click(function() {
		alert("수정 되었습니다.");
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});
</script>

<style type="text/css">
#selCnt {
	width: 180px;
}
</style>

<div class="container">
<h1>개인정보 수정</h1><hr><br>

<div class="container list-container">
<form name="update" action="/mypage/infoUpdate" method="post" >
      <input type="hidden" name="memberNo" value="${info.memberNo }" />
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">아이디</div>
  <div class="col-md-4"style="font-size: 16px;">${info.memberId }</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">이름</div>
  <div class="col-md-4"style="font-size: 16px;">${info.memberName }</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2"style="font-size: 20px;">닉네임</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberNick" name="memberNick" value="${info.memberNick }" />
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
  <div class="col-md-2" style="font-size: 20px;">현재 비밀번호</div>
  <div class="col-md-4">
  <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="현재 비밀번호를 입력하세요." value="${info.memberPw }" />
</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">수정 비밀번호</div>
  <div class="col-md-4">
  <input type="password" class="form-control" id="memberPw" name="memberPw" placeholder="변경할 비밀번호를 입력하세요." value="${info.memberPw }" />
</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">생년월일</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberBirth" name="memberBirth" value="${info.memberBirth  }" />
</div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2"style="font-size: 20px;">연락처</div>
  <div class="col-md-4">
  	<input type="text" class="form-control" id="memberTel" name="memberTel" value="${info.memberTel }" />
  </div>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">주소</div>
  <div class="col-md-4">
  <input type="text" class="form-control" id="memberAdd" name="memberAdd" value="${info.memberAdd }" />
</div>
<a href="/member/check" target="_blank">
  <button id = "nickcheck" class="btn btn-success">우편번호</button> </a>
</div>
<div class="row"><br><div class="col-lg-1"></div><div class = "col-md-8"><hr></div><br><div class="col-lg-2"></div></div>
<div class="row">
  <div class="col-md-1"></div>
  <div class="col-md-2" style="font-size: 20px;">관심장르</div>
  
 	<select class="form-control" id="selCnt">
    <option value="1">1개까지 선택 가능</option>
    <option value="2">2개까지 선택 가능</option>
    <option value="3" selected="selected">3개까지 선택 가능</option>
    <option value="4">4개까지 선택 가능</option>
    <option value="5">5개까지 선택 가능</option>
</select>
</div>
<div class="row">
<div class="col-md-1"></div>
  <div class="col-md-2"></div>
<table>
    <tr>
    	<td><label>소설 ㅣ </label></td>
        <td><label><input type="checkbox" name="chk" value="1" />로맨스</label></td>
        <td><label><input type="checkbox" name="chk" value="2" />추리</label></td>
        <td><label><input type="checkbox" name="chk" value="3" />판타지</label></td>
        <td><label><input type="checkbox" name="chk" value="4" />스릴러</label></td>
        <td><label><input type="checkbox" name="chk" value="5" />액션</label></td>
        <td><label><input type="checkbox" name="chk" value="6" />로맨스 판타지</label></td>
        <td><label><input type="checkbox" name="chk" value="7" />미스터리</label></td>
        <td><label><input type="checkbox" name="chk" value="8" />공포</label></td>
     	<td><label><input type="checkbox" name="chk" value="9" />무협</label></td>
    </tr>
    <tr>
        <td><label><input type="checkbox" name="chk" value="10" />여행</label></td>
        <td><label><input type="checkbox" name="chk" value="11" />과학</label></td>
        <td><label><input type="checkbox" name="chk" value="12" />게임</label></td>
        <td><label><input type="checkbox" name="chk" value="13" />인문/사회</label></td>
        <td><label><input type="checkbox" name="chk" value="14" />시/산문</label></td>
        <td><label><input type="checkbox" name="chk" value="15" />역사</label></td>
        <td><label><input type="checkbox" name="chk" value="16" />여행</label></td>
    </tr>
</table>
</div><br>
<div class="text-center">
       <button type="submit" id="btnUpdate" class="btn btn-info">정보 수정</button>
         <button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>

</form>
</div>

</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />