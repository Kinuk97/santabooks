<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<br><br><br><br>
<div class="text-center">
<h3><Strong>로그인에 실패하였습니다.</Strong></h3>

<br><br><br>

<a href="/member/find_pass"><input type="submit" value="비밀번호 찾기" class="btn btn-success"></aㄴ>
<a href="/member/join"><input type="submit" value="회원가입 하기" class="btn btn-success"></a>


</div>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />