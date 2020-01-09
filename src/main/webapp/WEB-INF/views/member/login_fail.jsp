<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />



<h1>로그인에 실패하였습니다.</h1>

<a href="/member/find_pass"><button>비밀번호 찾기</button></a>
<a href="/member/join"><button>회원가입 하기</button></a>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />