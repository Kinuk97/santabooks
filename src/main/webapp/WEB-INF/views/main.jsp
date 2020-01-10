<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/main_header.jsp"></jsp:include>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js" charset="utf-8"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


   

  <div class="container"  style="width:1700px; height:1000px;">
   <div id="bg">
     <img src="/resources/images/books.jpg" alt="">
   </div>
  
   <div class="box" style="padding-top: 247px;margin-top: -225px;">
   <h1>SantaBooks</h1>
   <h3>매월 10일, 관심사에 알맞는 추천 책을<br>
    랜덤으로 보내드립니다.
    <br>월 9,900원 산타북스와 함께하세요.</h3>
 
	
	
   <c:choose>
   <c:when test="${0 eq subNo }">
      <a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain" href="subscribe/agree"  >이용하러가기</a>
   </c:when>
   <c:when test="${null eq subNo }">
      <a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain" href="subscribe/agree"  >이용하러가기</a>
   </c:when>
   <c:otherwise>
      <a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain" onclick="location.href='/novel/list'" >이용하러가기</a>
   </c:otherwise>   
   </c:choose>
   
   </div>
   
   
	<div class="box"> <br><br><br><br><br><h1>SantaBooks</h1>
   	<h3>재미난 소설을 즐겨보세요.<br>
   	 이용자님의 의견을 기다리고 있습니다.
   	 <br>다양한 장르의 소설을 즐겨보세요. 
  	 </h3>
  	 
  
      <a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain_1" href="/novel/list"  >이용하러가기</a>
 
  	 
   	</div>
   	

	<div class="box"> <br><br><br><br><br><h1>SantaBooks</h1>
   	<h3>읽고자 하는 책을 검색하세요.<br>
   	 리뷰를 달고 회원들과 정보를 공유해 보세요
   	<br>산타북스는 사랑입니다 ^.^ </h3>
  
      <a class="btn btn-lg btn-secondary btn-block b-btn" id = "btnmain_2" href="/sns/list"  >이용하러가기</a>
 
  	</div>

   
   </div>




<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>

