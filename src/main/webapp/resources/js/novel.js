/**
 * 소설에 적용할 JS
 */

$(document).ready(function() {
	
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
});

// 선택한 파일
var sel_file;

// input 상태가 변하면 실행할 메소드
function showImage(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지만 업로드 가능합니다.");
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