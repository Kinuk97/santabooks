/**
 * 소설에 적용할 JS
 */

var curComment = 0;
var maxComment = 0;

var orderType = 0;


$(document).ready(function() {
	var novelNo = $("#novelNo").val();
	var episodeNo = $("#episodeNo").val();
	
	// score
	drawStars($("#score").val(), $("#cntScore").val());
	
	if ($("#score").val() != "") {
		$("#removeScore").addClass("active");
	}

	// 리스트 필터 버튼 active 보여주기
	var url = location.href;
	var temp = url.split("?");

	if (temp[1] == undefined) {
		$(".category").eq(0).children().addClass("active");
	} else {
		let paramTemp = temp[1].split("&");

		let identifier = null;

		for (var i = 0; i < paramTemp.length; i++) {
			for (var j = 0; j < paramTemp[i].split("=").length; j++) {
				if (paramTemp[i].split("=")[j] == "category") {
					identifier = paramTemp[i].split("=")[j + 1];
				}
			}
		}

		if (identifier == "1") {
			$(".category").eq(1).children().addClass("active");
		} else if (identifier == "2") {
			$(".category").eq(2).children().addClass("active");
		} else if (identifier == "3") {
			$(".category").eq(3).children().addClass("active");
		} else if (identifier == "4") {
			$(".category").eq(4).children().addClass("active");
		} else if (identifier == "5") {
			$(".category").eq(5).children().addClass("active");
		} else {
			$(".category").eq(0).children().addClass("active");
		}
	}

	// 소설 등록하기

	// 소설 이미지 등록하면 미리보기 보여주기
	$("#input_img").on("change", showImage);

	$("#imageBtn").on("click", function() {
		$("#input_img").click();
	});
	
	var categoryNo = $("#novelCategory").data("category");
	
	if (categoryNo == "1") {
		$("#customRadio").attr("checked", true);
	} else if (categoryNo == "2") {
		$("#customRadio2").attr("checked", true);
	} else if (categoryNo == "3") {
		$("#customRadio3").attr("checked", true);
	} else if (categoryNo == "4") {
		$("#customRadio4").attr("checked", true);
	} else if (categoryNo == "5") {
		$("#customRadio5").attr("checked", true);
	}
	
	// 별점주는 기능
	$(".rating-stars").on("click", function() {
		$.ajax({
	 		type: "POST"
	 		, url: "/episode/score/add"
			, data: {
				"episodeNo" : episodeNo,
				"score" : $("#rating-system").val()
			}
			, dataType: "json"
			, success: function(res) {
				drawStars(res.score.score, res.score.cntScore);
				$("#removeScore").addClass("active");
			}
			, error: function(e) {
				$("#loginModal").modal();
				console.log(e);
			}
		});
	});
	// 별점 취소하는 기능
	$("#removeScore").on("click", function() {
		$.ajax({
	 		type: "POST"
	 		, url: "/episode/score/remove"
			, data: {
				"episodeNo" : episodeNo,
			}
			, dataType: "json"
			, success: function(res) {
				if (res.score != null) {
					drawStars(res.score.score, res.score.cntScore);
				} else {
					drawStars(0);
				}
				$("#removeScore").removeClass("active");
			}
			, error: function(e) {
				$("#loginModal").modal();
				console.log(e);
			}
		});
	});
	
	// 즐겨찾기 버튼
	$("#favoriteBtn").on("click", function() {
		$.ajax({
	 		type: "POST"
	 		, url: "/novel/favorite"
			, data: {
				"novelNo" : novelNo,
			}
			, dataType: "json"
			, success: function(res) {
				if(res.result) {
					// 추천 성공
					$("#favoriteImg").attr("src", "/resources/images/novel/heart-fill.svg");
				} else {
					// 추천 취소 성공
					$("#favoriteImg").attr("src", "/resources/images/novel/heart.svg");
				}
				
				//추천수 적용
        		$("#favoriteCnt").html(res.favoriteCnt);
			}
			, error: function(e) {
				$("#loginModal").modal();
				console.log(e);
			}
		});
	});
	
	// 댓글 ===================================================
	
	
	if (episodeNo != undefined && episodeNo != 0) {
		orderType = $("#orderType").val();
		
		if (orderType == '2') {
			$("#addOrder").addClass("active");
		} else if (orderType == '3') {
			$("#replyOrder").addClass("active");
		} else {
			$("#newOrder").addClass("active");
		}
		
		getCommentList(episodeNo);
		
		$("div.commentDiv").on("click", ".replyWriteBtn", function() {
//			let parentCmtNo = $(this).parent().parent().parent().parent().data("parentno");
//			let content = $(this).parent().parent().prev().val();
			
			let form = $("<form action='/comment/reply' method='POST'></form>").append($(this).parent().parent().prev()).submit();
			form.append($("<input type='text' name='episodeNo' value='" + episodeNo + "' hidden='hidden'/>"));
			form.append($("<input type='text' name='parentCmtNo' value='" + $(this).parent().parent().parent().parent().data("parentcmtno") + "' hidden='hidden'/>"));
			$("div.commentDiv").append(form);
			$("form").submit();
			
		});
		
		// 답글보기
		$("ul.commentUl").on("click", ".viewReply", function() {
			
			// 답글 작성 폼 만들기
			var textarea = $("<textarea class='form-control' name='content' id=''></textarea>");
			var addBtnDiv = $("<div class='input-group-append'><span class='input-group-text' style='padding: 0;'><button class='btn btn-default replyWriteBtn' style='height: 100%; width: 100%'>작성</button></span></div>");
			var inputDiv = $("<div class='input-group'></div>");
			inputDiv.append(textarea);
			inputDiv.append(addBtnDiv);
			var li = $("<li class='list-group-item' data-parentcmtno='" + $(this).data("commentno") +"' style='background: #e9ecef' data-replytext='1'></li>");
			li.append(inputDiv);
			li.css("display", "none");
			
			if ($("li[data-parentcmtno='" + $(this).data("commentno") + "'][data-replytext='1']").data("replytext") == undefined) {
				
				if ($("li[data-parentcmtno='" + $(this).data("commentno") + "']").eq(0).data("commentno") == undefined) {
					$("li[data-commentno='" + $(this).data("commentno") + "']").after(li);
				}
			}
			
			var btn = $(this);
			
			if ($("li[data-parentcmtno='" + btn.data("commentno") + "'][data-type='reply']").data("type") == 'reply') {
				$("li[data-parentcmtno='" + btn.data("commentno") + "']").toggle(300);
			} else {
				$.ajax({
					type: "POST"
					, url: "/comment/getReply"
					, data: {
						"episodeNo" : episodeNo,
						"parentCmtNo" : $(this).data("commentno")
					}
					, dataType: "JSON"
					, success: function(res) {
						var commentList = res.commentList;
						
						for (var i = 0; i < commentList.length; i++) {
							var li = $("<li class='list-group-item reply' data-type='reply' data-commentno='" + commentList[i].commentNo + "' data-parentcmtno='" + commentList[i].parentCmtNo + "'><div class='row'><div class='col-5 text-left'>" + commentList[i].memberName + "</div><div class='col-7 text-right'>" + commentList[i].addDate + "</div></div></li>")
							li.append($("<hr>"));
							li.append($("<div>" + commentList[i].content + "</div>"));
							var btnDiv = $("<div class='text-right btnDiv'></div>");
							if (res.MemberNo != undefined && res.MemberNo != null && res.MemberNo == commentList[i].memberNo) {
								btnDiv.append($("<button class='modifyBtn btn btn-warning' data-commentno='" + commentList[i].commentNo + "'>수정</button>"
										+ "<button class='removeBtn btn btn-danger' data-commentno='" + commentList[i].commentNo + "'>삭제</button>"
								));
							}
							li.append(btnDiv);
							
							li.css("display", "none");
							
							btn.parent().parent().next().after(li);
						}
						
						$("li[data-parentcmtno='" + btn.data("commentno") + "']").toggle(300);
					}
					, error: function(e) {
						console.log(e);
					}
				});
				
			}
			
			
			
			
//			$("li[data-parentno='" + $(this).data("commentno") + "']").toggle(300);
		});
		// 댓글 수정
		$("div.commentDiv").on("click", ".modifyBtn", function() {
			
			if ($("textarea[data-commentno='" + $(this).data("commentno") + "']").val() == undefined) {
				$(this).parent().prev().html(
						"<form action='/comment/modify' method='POST'><div class='input-group'><textarea class='form-control' style='margin-bottom: 5px;' data-commentno='" + $(this).data("commentno") +"' name='content'>" + $(this).parent().prev().text().trim() + "</textarea>"
						+ "<div class='input-group-append' style='margin-bottom: 5px;'><span class='input-group-text' style='padding: 0;'><button class='btn btn-defualt' style='height: 100%; width: 100%;'>수정완료</button></span></div></div>"
						+ "<input type='text' hidden='hidden' value='" + $(this).data("commentno") + "' name='commentNo'>"
						+ "<input type='text' hidden='hidden' value='" + episodeNo + "' name='episodeNo'>"
						+ "</from>"
				);
			} else {
				$(this).parent().prev().html("<div>" + $(this).parent().prev().find("textarea").text().trim() +"</div>");
			}
		});
		// 댓글 삭제
		$("div.commentDiv").on("click", ".removeBtn", function() {
//			$("li[data-parentno='" + $(this).data("commentno") + "']").toggle(300);
			// comfirm 쓰기
			$.ajax({
				type: "POST"
				, url: "/comment/remove"
				, data: {
					"commentNo" : $(this).data("commentno")
				}
				, dataType: "json"
				, success: function(res) {
					location.href = "/episode/view?episodeNo=" + episodeNo + "&orderType=" + orderType;
				}
				, error: function(e) {
					console.log(e);
				}
			});
		});
		
		$("#newOrder").on("click", function() {
			$(".btn-outline-dark").removeClass("active");
			orderType = 1;
			$("#newOrder").addClass("active");
			getCommentList(episodeNo);
		});
		$("#addOrder").on("click", function() {
			$(".btn-outline-dark").removeClass("active");
			orderType = 2;
			$("#addOrder").addClass("active");
			getCommentList(episodeNo)
		});
		$("#replyOrder").on("click", function() {
			$(".btn-outline-dark").removeClass("active");
			orderType = 3;
			$("#replyOrder").addClass("active");
			getCommentList(episodeNo)
		});
		
		
		$("div.commentDiv").on("click", "#addCommentBtn", function() {
			$.ajax({
				type: "POST"
				, url: "/comment/write"
				, data: {
					"episodeNo" : episodeNo,
					"content" : $("#commentContent").val(),
				}
				, dataType: "json"
				, success: function(res) {
					location.href = "/episode/view?episodeNo=" + episodeNo + "&orderType=" + orderType;
				}
				, error: function(e) {
					$("#loginModal").modal();
					console.log(e);
				}
			});
		});
		
		$("#moreBtn").on("click", function() {
			for (var i = curComment + 1; i <= curComment + 5; i++) {
				$("li[data-cmtrownum='" + i + "']").show(300);
			}
			curComment += 5;
			console.log(curComment);
			console.log(maxComment);
			if (maxComment <= curComment) {
				if ($(this).text() == '더보기') {
					$(this).text("모두 접기");
				} else {
					hideComment();
					$(this).text("더보기");
					curComment = 5;
				}
			}
		});
	}
	
});

function hideComment() {
	for (var i = 6; i <= maxComment + 1; i++) {
		$("li[data-cmtrownum='" + i + "']").hide(300);
	}
}

function getCommentList(episodeNo) {
	$(".commentUl").html("");
	$.ajax({
		type: "POST"
		, url: "/comment/list"
		, data: {
			"episodeNo" : episodeNo,
			"orderType" : orderType
		}
		, dataType: "JSON"
		, success: function(res) {
			var commentList = res.commentList;
			
			maxComment = commentList.length;
			
			for (var i = 0; i < commentList.length; i++) {
				var li = $("<li class='list-group-item' data-commentno='" + commentList[i].commentNo + "' data-cmtrownum='" + (i + 1) + "'><div class='row'><div class='col-5 text-left'>" + commentList[i].memberName + "</div><div class='col-7 text-right'>" + commentList[i].addDate + "</div></div></li>")
				li.append($("<hr>"));
				li.append($("<div>" + commentList[i].content + "</div>"));
				var btnDiv = $("<div class='text-right btnDiv'></div>");
				if (res.MemberNo != undefined && res.MemberNo != null && res.MemberNo == commentList[i].memberNo) {
					btnDiv.append($("<button class='modifyBtn btn btn-warning' data-commentno='" + commentList[i].commentNo + "'>수정</button>"
							+ "<button class='removeBtn btn btn-danger' data-commentno='" + commentList[i].commentNo + "'>삭제</button>"
					));
				}
				btnDiv.append($("<button class='viewReply btn btn-info' data-commentno='" + commentList[i].commentNo + "'>답글(" + commentList[i].replyCnt + ")</button>"));
				li.append(btnDiv);
				if (i >= 5) {
					li.css("display", "none");
				} else {
					curComment++;
				}
				
				$(".commentUl").append(li);
			}
			
		}
		, error: function(e) {
			console.log(e);
		}
	});
}

function drawStars(score, cntScore) {
	$("#starSpan").html("");
	
	for (var i = 1; i <= 5; i++) {
	
		if (i <= score) {
			$("#starSpan").html($("#starSpan").html() + "<img src='/resources/images/novel/star-fill.svg' class='icon'>");
		} else {
			if (score - (i - 1) < 1) {
				switch (parseInt(score * 10) - ((i- 1) * 10)) {
				case 4:
				case 5:
				case 6:
				case 7:
					$("#starSpan").html($("#starSpan").html() + "<img src='/resources/images/novel/star-half.svg' class='icon'>");
					continue;
					break;
				case 8:
				case 9:
					$("#starSpan").html($("#starSpan").html() + "<img src='/resources/images/novel/star-fill.svg' class='icon'>");
					continue;
					break;
				default:
					break;
				}
			}
			
			$("#starSpan").html($("#starSpan").html() + "<img src='/resources/images/novel/star.svg' class='icon'>");
		}
		
	}
	
	$("small[class='cntScore']").text(" (" + cntScore + ")");
}

// 선택한 파일
var sel_file;

// input 상태가 변하면 실행할 메소드
function showImage(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지만 업로드 가능합니다.");
			$("input[type='file']").val("");
			$("#img").attr("src", "/resources/images/logo.png");
			return;
		}

		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
		}

		reader.readAsDataURL(f);
	});

}

