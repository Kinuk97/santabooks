<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />




<div class ="text-center">
<h5>회원가입이 완료 되었습니다.</h5>

<!-- 구독하기 -->
 <a href="/subscribe/first"><button>"산타북스 구독하러가기</button></a>

<!-- 메인으로 -->
 <a href="/main"><button>메인 </button></a>

</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />