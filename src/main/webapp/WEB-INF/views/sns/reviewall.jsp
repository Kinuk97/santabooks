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

#cancel{
	background-color: #f1f1f1;
	border:none; 
	color: black;
}

.likeBtn{
	color: #ff2f6e; 
	font-weight: bold; 
	border:none;
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
		$(".btnDelete").click(function() {
	    	var feedNo = "";
			feedNo = $(this).attr("data-feedNo");
			
			warningModal("리뷰를 삭제하시겠습니까?");
	    	
	    	$('#ok').click(function(){    		
			$(this).attr("onclick", "location.href='/sns/remove?feedNo=" + feedNo + "';");

	    	});
		});
	
		// 좋아요 버튼
		$(".likeBtn").on("click", function() {
			var $likeBtn = $(this);
			console.log("---feedno---")
			console.log($likeBtn)
			console.log($likeBtn.attr("data-feedNo"))
			$.ajax({
		 		type: "POST"
		 		, url: "/sns/like"
				, data: {
					"feedNo" : $likeBtn.attr("data-feedNo")
				}
				, dataType: "json"
				, success: function( res ) {
					if(res.result) {
						// 좋아요 성공
						console.log("추천!!!");
						$likeBtn.html("좋아요 취소");
						
					} else {
						// 좋아요 취소 성공
						console.log("추천 취소!!!");
						$likeBtn.html("좋아요");
					}
					
					//좋아요 적용
	        		console.log($likeBtn);
	        		console.log($likeBtn.parent());
	        		console.log($likeBtn.parent().find(".likeCnt"));
	        		$likeBtn.parent().find(".likeCnt").html(res.likeCnt);
				}
				, error: function(e) {
					console.log(e);
					$("#loginModal").modal();
				}
			});
		});
	
});
</script>

<hr>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-arrow-left" id='back'></i>
 <br><br>
 <input type="hidden" value="${review.feedNo }" name="feedNo" />
 <input type="hidden" value="${bookName.bookName }" name="bookName">
<h1 style="font-weight: bold;">&nbsp;&nbsp;리뷰(${bookName.bookName })</h1>
<hr>
<div class="container">
<c:forEach items="${reviewList }" var="review">
<c:if test="${review.privacy eq 1}">
	<div class="row">
		<div class="column">
			<div class="card" id="review">
				<div class="card-text">
				<div style="position: relativce">
					<h5 style="font-weight: bold;">${review.memberNick }</h5>
					<div style="position: absolute; top: 0px; right:10px">
						<c:if test="${MemberNo eq review.memberNo }">
							<button class="btnDelete" style="float: right; border: none; font-size: 30px;" data-feedNo="${review.feedNo }">×</button>
						</c:if>
					</div>
				</div>
					<hr>
					<p>${review.review }</p>
					<br><br><br>
					<p class="text-right">${review.reviewDate }</p>
					<hr>
					&nbsp;&nbsp;<i class="far fa-thumbs-up likeCnt">${review.likeCnt }</i>
					<hr>
						<input type="hidden" value="${review.feedNo }" id="feedNo">
						<c:choose>
							<c:when test="${review.likeCheck == 1}">
								<button class="likeBtn"  style="background-color: FF2F6E; color: FFFFFF;" data-feedNo="${review.feedNo }">좋아요 취소</button>
							</c:when>
							<c:otherwise>
								<button class="likeBtn" data-feedNo="${review.feedNo }">좋아요</button>
							</c:otherwise>
						</c:choose>
					</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	</c:if>
</c:forEach>
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
				<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">취소</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- loginModal -->
	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="loginModalLabel">로그인</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <span>로그인이 필요한 기능입니다!</span>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
<!-- /.loginModal -->

<!-- 모달창 -->

<jsp:include page="/WEB-INF/views/layout/paging2.jsp" />
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />