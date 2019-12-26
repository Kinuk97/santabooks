<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">
#ship_list{
	border: 1px solid black;
	width: 70%;
	height: 400px;
	overflow: auto;
	text-align: center;
}
</style>

<div class="container">
<h1>배송받은 책</h1><hr><br>

	<div id="ship_list" style="text-align: center">
	</div>




</div>
<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />