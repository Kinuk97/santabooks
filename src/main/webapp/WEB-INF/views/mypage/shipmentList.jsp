<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<jsp:include page="/WEB-INF/views/mypage/mypageMenu.jsp" />

<style type="text/css">

.card-text {
	float: right;
}

</style>

<div class="container">

<h1>받은 책 내역</h1>
<hr><br><br>
      <div class="row">
<c:forEach items="${list }" var="book">
        <div class="col-4">
          <div class="card">
            <div class="card-header">${book.SHIPMENTDATE }</div>
            <div class="card-body">
              <h5 class="card-title">${book.BOOKNAME }</h5><br>
              <h6 class="card-title">${book.BOOKWRITER }&nbsp;|&nbsp;${book.BOOKPUBLISHER }</h6>
              <p class="card-text"><a href="/sns/view?bookNo=${book.BOOKNO }">리뷰작성</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="/mypage/shipmentChk">배송조회</a></p><br>
            </div>
          </div>
        </div>
</c:forEach>
      </div>
    </div>
    
<br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />