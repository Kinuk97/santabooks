<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<style type="text/css">

.column {
	width: 100%;
	padding: 0 10px;
}

.card {
	height: 380px;
}

.card {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	/* this adds the "card" effect */
	padding: 16px;
	background-color: #f1f1f1;
}

@media screen and (max-width: 600px) {
	.column {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	//뒤로가기
	$("#back").click(function() {
		history.go(-1);
	});
	
	//알림 모달 호출 메서드
	 function warningModal(content) {
	    $(".modal-contents").text(content);
	    $("#defaultModal").modal('show');
	 }
	
	//삭제버튼 동작
		$("#btnDelete").click(function() {
			
			warningModal("리뷰를 삭제하시겠습니까?");
	    	
	    	$('#ok').click(function(){    		
			$(location).attr("href", "/sns/remove?feedNo=${review.feedNo}");

	    	});
		});
	
		// 좋아요 버튼
		$("#likeBtn").on("click", function() {
			$.ajax({
		 		type: "POST"
		 		, url: "/sns/like"
				, data: {
					"feedNo" : feedNo,
				}
				, dataType: "json"
				, success: function( res ) {
					if(res.result) {
						// 추천 성공
						$("#likeBtn").html("<button style='color: #ff2f6e; font-weight: bold; border:none;'>싫어요</button>");
					} else {
						// 추천 취소 성공
						$("#likeBtn").html("<button style='color: #ff2f6e; font-weight: bold; border:none;'>좋아요</button>");
					}
					
					//추천수 적용
	        		$("#likeCnt").html(res.favoriteCnt);
				}
				, error: function(e) {
// 					$("#loginModal").modal();
					console.log(e);
				}
			});
		});
	
});
</script>

<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-left" id='back'></i>
 <br><br>
<h1 style="font-weight: bold;">&nbsp;&nbsp;리뷰</h1>
<hr>
<div class="container">

	<div class="row">
		<div class="column">
			<div class="card" id="review">
				<div class="card-text">
				<c:if test="${MemberNo eq review.memberNo }">
					<button id="btnDelete" style="float: right; border: none; font-size: 30px;">×</button>
				</c:if>
					<h5 style="font-weight: bold;">${review.memberNick }</h5>(작성자가 준 별점 들어갈 예정)
					<hr>
					<p>${review.review }</p>
					<br><br><br>
					<p class="text-right">${review.reviewDate }</p>
					<hr>
					&nbsp;&nbsp;<i class="far fa-thumbs-up">${likeCnt }</i>
					<hr>
					<button style="color: #ff2f6e; font-weight: bold; border:none;" id="likeBtn">좋아요</button>
				</div>
			</div>

		</div>
	</div>
</div>

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
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="ok">확인</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- 모달창 -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />