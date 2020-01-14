<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SantaBooks</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/main.css" rel="stylesheet">
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
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
<!-- Channel Plugin Scripts 1:1 채팅 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "d3dfd683-08c7-4997-bb1f-587b5c626519"
  });
</script>
<!-- End Channel Plugin -->



<!-- google login -->
<script src="https://apis.google.com/js/platform.js?onload=start" async defer></script>
<meta name="google-signin-client_id" content="885356568935-shi7r2ikuk7k8snemu76ckiec978dkpe.apps.googleusercontent.com">

<script>
function start() {
  gapi.load('auth2', function() {
    auth2 = gapi.auth2.init({
      client_id: '885356568935-shi7r2ikuk7k8snemu76ckiec978dkpe.apps.googleusercontent.com'
      , scope: 'profile email'
    });
  });
}

function signOut() {
	auth2.signOut().then(function () {
		console.log('User signed out.');
	});
	
	auth2.disconnect();
	location.href="/member/logout";
}
</script>


</head>
<body>

	<div class="header">

<nav class="navbar navbar-expand-sm navbar-dark" style="position: fixed;width: 1062px;">
	
	  <!-- Links -->
	  <ul class="navbar-nav">
   		
		<li class="nav-brand" id="navtitle">
			<a class="nav-link" href="/main">Santabooks</a>
		</li>

	  	<c:choose>
   		<c:when test="${0 eq subNo }">
		    <li class="nav-brand" id="navtitle" style="margin-left: 25px;">
		      <a class="nav-link" href="/subscribe/agree">구독</a>
	   		</li>
	    </c:when>
	    <c:when test="${null eq subNo }">
		    <li class="nav-brand" id="navtitle" style="margin-left: 25px;">
		      <a class="nav-link" href="/subscribe/agree">구독</a></li>
		</c:when>
		<c:otherwise>
		    <li class="nav-brand" id="navtitle" style="margin-left: 25px;">
		      <a class="nav-link" href="/mypage/subInfo">구독</a></li>
	     </c:otherwise>
	  	</c:choose>
	    <li class="nav-brand" id="navtitle">
	      <a class="nav-link" href="/novel/list">소설</a>
	    </li>
	    <li class="nav-brand" id="navtitle">
	      <a class="nav-link" href="/sns/list">리뷰SNS</a>
	    </li>
	    <c:if test="${not login}">	
	   		 <li class="nav-item" id="nav1">
	     		 <a class="nav-link" href="/member/join">회원가입 &nbsp;&nbsp;&nbsp;|</a>
	    	</li>
	    	<li class="nav-item" id="nav2">
	   		   	<a class="nav-link" href="/member/login">로그인</a>
	    	</li>
	   </c:if>
	    <c:if test="${login}">	
	    	<li class="nav-item" id="nav2">
	   		   	<a class="nav-link"  href="#" onclick="signOut();">로그아웃</a>
	    	</li>
	   </c:if>
	  </ul>
	  

</nav>
</div>