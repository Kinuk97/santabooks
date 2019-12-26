<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">
#newsbar{
	border: 1.5px solid black;
	float : right;
	width: 79%;
	height: 200px;
	overflow: auto;
	border: 1px solid #bcbcbc;

}
</style>

<div class="container">
<h1>배송받은 책</h1><hr><br>

	<div id="newsbar">
		<div id="newsTable"></div>
	</div>




</div>
<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />