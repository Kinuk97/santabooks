<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<style type="text/css">
body{
	background-color:#F7F7F4;
}

#subBtn {
	background-color: rgba(20, 121, 87, .25);
	border: none;
	width: 200px;
	color: black;
}

#reviewCard{
	width: 300px;
    height: 300px;
    left:50px;
    
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	border: 2px solid rgba(20, 121, 87,.25);
	padding: 16px;
	background-color: #f1f1f1;
}

#reviewCard:hover {
    border-color: #147957;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(20, 121, 87,.0);
}

#writeBtn{
	background-color:rgba(20, 121, 87,.25); 
	border:none; 
	color: black;
	width: 200px;
}

#reviewWrite{
	background-color:rgba(20, 121, 87,.25); 
	border:none; 
	color: black;
}

#cancel{
	background-color: #f1f1f1;
	border:none; 
	color: black;
}

.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;}

</style>

<script type="text/javascript">

	
	$(document).ready(function() {

		//리뷰 작성
		$("#reviewWrite").click(function() {
			$("#writeForm").submit();
		});
		
		// 별점
		$('.starRev span').click(function() {
			$(this).parent().children('span').removeClass('on');
			$(this).addClass('on').prevAll('span').addClass('on');
			return false;
		});

	});

	// 	function check() {

	// 		if ($("input:checkbox[id='privacy']").is(":checked")) {
	// 			$("input:checkbox[id='privacy']").prop("checked", true);

	// 			$("#privacy").attr("value", 1);

	// 		} else {
	// 			$("input:checkbox[id='privacy']").prop("checked", false);
	// 			$("#privacy").attr("value", 0);

	// 		}
	// 	}
</script>

<input type="hidden" value="${review.feedNo }" name="feedNo" />
<div class="container">
	<h1 style="font-weight: bold;">${review.bookName }</h1>
	<h5 style="color: #696969; font-weight: bold;">${review.bookWriter }</h5>
	<hr>

	(평점들갈 예정)
	<hr>
	<div style="position: relative;">
	<button class="btn btn-secondary" id="subBtn"
		onclick="location.href='/subscribe/agree'">구독 하기</button>
	<div class="starRev" style="position: absolute; z-index:1; left: 230px; top:-18px;">
		<div>
			<small>평가하기</small>
		</div>
		<span class="starR on">별1</span> 
		<span class="starR">별2</span> 
		<span class="starR">별3</span> 
		<span class="starR">별4</span> 
		<span class="starR">별5</span>
	</div>
	</div>
	<hr>

	<div class="card" style="height: 70px; margin-bottom: 10px;">
		<div class="card-text" style="margin: 16px;">
			${MemberNick }님의 생각을 글로 적어보세요. &nbsp;&nbsp;&nbsp;&nbsp;
			<button class="btn btn-secondary" id="writeBtn" data-toggle="modal"
				data-target="#writeModal">리뷰 작성</button>
		</div>
	</div>
	
	<div class="column">
		<div class="card" id="bookInfo" style="height: 1000px;">
			<div class="card-text">
				<div style="padding: 0px 20px 0px 20px;">
					<h4 style="font-weight: bold;">책 정보</h4>
					<ul>
						<li>책이름 : ${review.bookName }</li>
						<li>작가 : ${review.bookWriter }</li>
						<li>출판사 : ${review.bookPublisher }</li>
						<li>출판년도 : ${review.publishingYear }</li>
					</ul>
				</div>
				<hr>
				
				<div style="padding: 0px 20px 0px 20px;">
				<h4 style="font-weight: bold;">책 내용</h4>
				${review.bookContent }
				</div>
				<hr>
				
				<div style=" position: relative; padding: 0px 20px 0px 20px;">
					<h4 style="font-weight: bold; display: contents;">리뷰</h4>

					<a href="/sns/reviewall?bookNo=${review.bookNo }"
						style="color: #ff2f6e; text-decoration: none; font-weight: bold; position: absolute; right: 20px;">더보기</a>

				</div>
				
				<br>
				<div class="row">
				<c:forEach items="${list }" var="list">
						<div class="column"onclick="location.href='/sns/detailview?feedNo=${list.feedNo}'" 
						style="width: 300px; height: 300px; padding: 4px;margin-right: 65px;">
							<div class="card" id="reviewCard">
								<div class="card-text">
									<p>${list.review }</p>
									<br><br><br><br><br><br><br><br>
									<div class="text-right">${list.reviewDate }</div>
								</div>
							</div>
						</div>
						
				</c:forEach>
				</div>
				<br><hr>
				
				<div style="padding: 0px 20px 0px 20px;">
					<h4 style="font-weight: bold;">별점 그래프</h4>
				</div>
				
			</div>
		</div>
	</div>

</div>

<form action="/sns/write" method="post" id="writeForm">
	<div class="modal fade" id="writeModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">리뷰 작성</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-body">
					<input type="hidden" value="${review.memberNo }" id="memberNo" name="memberNo" /> 
					<input type="hidden" value="${review.bookNo }" id="bookNo" name="bookNo" />
					<input type="hidden" value="${review.bookName }" id="bookName" name="bookName" />
					<input type="hidden" value="${review.bookWriter }" id="bookWriter" name="bookWriter" />
					<input type="hidden" value="${review.bookPublisher }" id="bookPublisher" name="bookPublisher" />
					<input type="hidden" value="${review.publishingYear }" id="publishingYear" name="publishingYear" />
					<input type="hidden" value="${review.bookContent }" id="bookContent" name="bookContent" />
					<input type="hidden" value="${review.genreNo }" id="genreNo" name="genreNo" />
					 
					(책이름 띄울 예정)
					<hr>
					<textarea type="text" name="review" id="review"
						placeholder="이 작품에 대한 생각을 표현해 주세요." required="required"
						style="border: none; width: 460px; height: 200px;"></textarea>
					<hr>
					<p><strong>공개 / 비공개</strong></p>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" id="privacy" name ="privacy" class="custom-control-input" >
						<label class="custom-control-label" for="privacyCheck">공개</label>
					</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary" id="reviewWrite">작성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal"
						id="cancel">취소</button>
				</div>
			</div>
		</div>
	</div>
</form>


<jsp:include page="/WEB-INF/views/layout/footer.jsp" />