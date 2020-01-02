<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />


<script src="https://ajax.googleapis.com/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
$("input[type='checkbox']").on("click", function(){
var count=$("input:checked[type='checkbox']").length;

if(count>5){
$(this).attr("checked", false);
alert("5개까지만 선택할 수 있습니다")
}	
});	
});

</script>

<div style="text-align: center">

<div class="container" style="width:630px; ">

<br><br>
<h5>관심장르<h5><br><br>

<h6>최대 다섯개까지 선택이 가능합니다.<h6><br><br>

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
<br><br>


<div class="text-center">
       <button type="submit" id="btnUpdate" class="btn btn-info">정보 수정</button>
</div>       


<br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />


</div>
</div>

