/**
 * 소설에 적용할 JS
 */

$(document).ready(function() {
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

});
