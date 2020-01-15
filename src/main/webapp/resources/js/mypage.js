/**
 * 
 */

var curComment = 0;
var maxComment = 0;

$(document).ready(function() {
	
		getCommentList();
		
		// 답글보기
		$("div.commentDiv").on("click", ".viewReply", function() {
			var btn = $(this);
			
			if ($("li[data-parentcmtno='" + btn.data("commentno") + "'][data-type='reply']").data("type") == 'reply') {
				$("li[data-parentcmtno='" + btn.data("commentno") + "']").toggle(300);
			} else {
				$.ajax({
					type: "POST"
					, url: "/comment/getReply"
					, data: {
						"episodeNo" : $(this).data("episodeno"),
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
								btnDiv.append($("<button class='removeBtn btn btn-danger' data-commentno='" + commentList[i].commentNo + "'>삭제</button>"));
							}
							li.append(btnDiv);
							
							li.css("display", "none");
							
//							btn.parent().parent().next().after(li);
							$("li[data-commentno='" + commentList[i].parentCmtNo + "']").after(li);
						}
						
						$("li[data-parentcmtno='" + btn.data("commentno") + "']").toggle(300);
					}
					, error: function(e) {
						console.log(e);
					}
				});
				
			}
			
		});
		
		// 댓글 삭제
		$("div.commentDiv").on("click", ".removeBtn", function() {
			$.ajax({
				type: "POST"
				, url: "/comment/remove"
				, data: {
					"commentNo" : $(this).data("commentno")
				}
				, dataType: "json"
				, success: function(res) {
					location.href = "/mypage/commentList";
				}
				, error: function(e) {
					console.log(e);
				}
			});
		});
		
		$("div.commentDiv").on("click", ".episodeBtn", function() {
			location.href = "/episode/view?episodeNo=" + $(this).data("episodeno");
		});
		
		$("#moreBtn").on("click", function() {
			for (var i = curComment + 1; i <= curComment + 5; i++) {
				$("li[data-cmtrownum='" + i + "']").show(300);
			}
			curComment += 5;
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
		, url: "/mypage/commentList"
		, data: {
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
					btnDiv.append($("<button class='episodeBtn btn btn-success' data-episodeno='" + commentList[i].episodeNo + "'>보러가기</button>"));
					btnDiv.append($("<button class='removeBtn btn btn-danger' data-commentno='" + commentList[i].commentNo + "'>삭제</button>"));
				}
				btnDiv.append($("<button class='viewReply btn btn-info' data-commentno='" + commentList[i].commentNo + "' data-episodeno='" + commentList[i].episodeNo + "'>답글(" + commentList[i].replyCnt + ")</button>"));
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