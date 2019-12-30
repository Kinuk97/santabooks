<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">

#searchBtn {
	width: 100px;
	background-color: rgba(20, 121, 87, .25);
	border: none;
	color: black;
}

</style>

<div id="search">
			<br>
			<center>
				<form action="/book/list" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목,작가를 입력하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="submit">검색</button>
					</div>
					</div>
				</form>

			</center>
		</div>
		<br><br>
    <table>
        <tr>
            <td colspan="7" width="100%" bgcolor="pink"></td>
        </tr>
        <c:forEach items="${bookList}" var ="b">
            <tr>
                <td rowspan="2"><img src="${b.image}"></td>
                <td rowspan="4" width="800">"${b.title}"</td>
                <td width="200">${b.author}</td>
            </tr>
            <tr>
                <td width="200">${b.price }</td>
                <td width="200">${b.discount }</td>
                <td width="200">${b.publisher }</td>
                <td width="200">${b.pubdate }</td>
                <td width="200">${b.isbn }</td>
            </tr>
            <tr>
                <td colspan="7">${b.description}</td>
            </tr>
            <tr>
                <td colspan="7" width="100%" bgcolor="pink"></td>
            </tr>
        </c:forEach>
    </table>
	<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
	<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
