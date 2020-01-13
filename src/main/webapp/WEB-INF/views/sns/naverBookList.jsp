<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript">
$(document).ready(function() {
	$("#bookTable").click(function(){
		$(location).attr("href", "https://book.naver.com/search/search.nhn?sm=sta_hty.book&sug=&where=nexearch&query=${keyword}");
	})
});
</script>

<style type="text/css">

#searchBtn {
	width: 100px;
	background-color: rgba(20, 121, 87, .25);
	border: none;
	color: black;
}

</style>

<script type="text/javascript">
$(document).ready(function() {
					
	//알림 모달 호출 메서드
	function warningModal(content) {
		$(".modal-contents").text(content);
		$("#defaultModal").modal('show');
	}

	
	$("#searchBtn").on("click", function() {
// 		var keyword = $("#keyword").val();
		var keyword = $(this).parents("form").find("[name='keyword']").val();

		if (keyword == null || keyword == "") {
			warningModal("검색어가 없습니다.");
		} else {
// 			$("#reviewSearch").submit();
			$(this).parents("form").submit();
		}
	});

})
</script>

<div id="search">
			<br>
			<center>
				<form action="/book/list" class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
					<div class="input-group">
					<img src="/resources/images/naver.ico" style="height:35px;"> &nbsp;
					<input type="text" class="form-control bg-light border-0 small" name="keyword" placeholder="책제목,작가를 입력하세요" 
					aria-label="Search" aria-describedby="basic-addon2" style="width:500px;"> 
					 <div class="input-group-append">
					<button class="btn btn-primary" id ="searchBtn" type="button">검색</button>
					</div>
					</div>
				</form>

			</center>
		</div>
		<br><br>
   
   <table id="bookTable">
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
    <br>

<!--모달창 -->
<div class="modal fade" id="defaultModal">
	<div class="modal-dialog">
		<div class="modal-content ">
			<div class="modal-header panel-heading">
				<h4 class="modal-title">알림</h4>
			</div>
			<div class="modal-body">
				<p class="modal-contents"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal"
					id="ok" style="background-color:rgba(20, 121, 87,.25); border: none;">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<jsp:include page="/WEB-INF/views/layout/paging.jsp" />
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />
