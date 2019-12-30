<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container">

<table class="table" style="border: 1px solid #CCC">
  <tbody>
    <tr>
      <td rowspan="3" colspan="2" style="width: 50px;"><img src="/resources/images/logo.png" width="100%"></td>
      <td>${novel.title } ㅁㅁㅁㅁㅁ</td>
      <td>${novel.memberName }</td>
    </tr>
    <tr>
      <td colspan="2" style="padding-top: 10px;">
        <div style="height: 65px;">${novel.discription }</div>
        <diV class="text-right"><button class="btn btn-warning">즐겨찾기</button></diV>
      </td>
    </tr>
  </tbody>
</table>

${episodeList }
	
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />