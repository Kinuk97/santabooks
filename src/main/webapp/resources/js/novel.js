/**
 * 소설에 적용할 JS
 */

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
	
	$.ajax({
 		type: "POST"
 		, url: "/comment/list"
		, data: {
			"episodeNo" : episodeNo,
		}
		, dataType: "HTML"
		, success: function(res) {
			console.log(res);
			$(".commentDiv").html(res);
		}
		, error: function(e) {
			$("#loginModal").modal();
			console.log(e);
		}
	});
	
	
});

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