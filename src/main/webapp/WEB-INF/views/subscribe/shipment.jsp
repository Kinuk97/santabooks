<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>MouseWheel</title>
    <style type="text/css">
        html,body{ margin:0; padding:0; width:100%; height:100%;}
        .box{ width:100%; height:100%; position:relative; color:black; font-size:24pt;}
    </style>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.onload = function () {
            var elm = ".box";
            $(elm).each(function (index) {
                // 개별적으로 Wheel 이벤트 적용
                $(this).on("mousewheel DOMMouseScroll", function (e) {
                    e.preventDefault();
                    var delta = 0;
                    if (!event) event = window.event;
                    if (event.wheelDelta) {
                        delta = event.wheelDelta / 120;
                        if (window.opera) delta = -delta;
                    } 
                    else if (event.detail)
                        delta = -event.detail / 3;
                    var moveTop = $(window).scrollTop();
                    var elmSelecter = $(elm).eq(index);
                    // 마우스휠을 위에서 아래로
                    if (delta < 0) {
                        if ($(elmSelecter).next() != undefined) {
                            try{
                                moveTop = $(elmSelecter).next().offset().top;
                            }catch(e){}
                        }
                    // 마우스휠을 아래에서 위로
                    } else {
                        if ($(elmSelecter).prev() != undefined) {
                            try{
                                moveTop = $(elmSelecter).prev().offset().top;
                            }catch(e){}
                        }
                    }
                     
                    // 화면 이동 0.5초(500)
                    $("html,body").stop().animate({
                        scrollTop: moveTop + 'px'
                    }, {
                        duration: 500, complete: function () {
                        }
                    });
                });
            });
        }
    </script>
<style type="text/css">
img {
	z-index:-9999;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
</head>
<body>
<div style="width: 650px; height:1000px;">
	<div id="bg">
  	<img src="/resources/images/books.jpg" alt="">
	</div>

    <div class="box" ><h3>매월 10일, 관심사에 알맞는 추천 책을<br>
	 랜덤으로 보내드립니다.gg
	 <br>월 9,900원 산타북스와 함께하세요. </div>
    <div class="box" >2</div>
    <div class="box" >3</div>
</div>
</body>
</html>

