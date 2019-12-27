/**
 * 	헤더에 적용할 JS
 */

$(document).ready(function() {
    var url = location.href;
    var arr = url.split("/");
    
    let identifier = arr[3];
    
    if (arr.length == 4 || identifier == "subscribe") {
    	// url이 메인이거나 구독이라면
    	$("#navBar").find("li").eq(0).addClass("active");
    } else {
    	
    	if (identifier == "novel") {
    		$("#navBar").find("li").eq(1).addClass("active");
    		
    	} else if (identifier == "") {
    		$("#navBar").find("li").eq(2).addClass("active");
    	}
    	
    }

});
