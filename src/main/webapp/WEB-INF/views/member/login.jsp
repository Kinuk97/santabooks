<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>SANTA BOOKS 회원가입</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 

<!-- jQuery 2.2.4 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- google login -->
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

<meta name="google-signin-client_id" content="885356568935-shi7r2ikuk7k8snemu76ckiec978dkpe.apps.googleusercontent.com">



<script>
	$(document).ready(function() {
		$("#find_pw_btn").click(function(){
			location.href="/member/find_pw"
		});
	});
	
</script>



<!-- 구글로그인 -->
<script>
	
	
	var clickedGSignIn = false;
	function clickGSignIn() {
		clickedGSignIn = true;
	}
	
    function onSuccess(googleUser) {
		$("div.abcRioButton.abcRioButtonBlue").css("width", "100%");
		$("span.abcRioButtonContents").children("span:nth-child(2)").text("구글 계정으로 로그인");
		$("div.abcRioButton.abcRioButtonBlue").css("visibility", "visible");
    	if (!clickedGSignIn) return;
    	
    	var profile = googleUser.getBasicProfile();
    	var email = profile.getEmail();
    	var name = profile.getName();
    	var id_token = email;
    	
		var url = '/member/login/google';
		$.ajax({
			url : url,
			data : {
				id_token: id_token,
			},
			method : "POST",
			dataType : "json"
		}).done(function(data) {
			if (data == true) {
				var href = window.location.href;
				var loginUriRegex = RegExp("/member/login");
				
				if (loginUriRegex.test(href)) {
					window.location.replace("/");
				} else {
					window.location.replace(href);
				}
				
			} else {
				var url = '/member/join/google';
				var form = $('<form action="' + url + '" method="post">'
					+ '<input type="email" name="memberId" value="' + email + '" />'
					+ '<input type="text" name="memberName" value="' + name + '" />'
					+ '<input type="text" name="id_token" value="' + id_token + '" />'
					+ '</form>');
				$('body').append(form);
				form.submit();
			}
		})
	}
	function onFailure(error) {
		console.log(error);
	}
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope' : 'profile email',
			'longtitle' : false,
			'height': 48,
			'theme' : 'dark',
			'onsuccess' : onSuccess,
			'onfailure' : onFailure
		});
	}
</script>

<!-- 시영이네 로그인 -->
<script type="text/javascript">
	$(document).ready(function() {
		$(".form-signin").on("submit", function(){
			$(".btn-ajax").click();
   			return false;
 		});
 		
		$(".btn-ajax").on("click", function() {
			$.ajax({
				url: "/ajax/member/login", 
				data: {
					user_id: $("#memberId").val(),
					user_pw: $("#memberPw").val(),
					shouldRemember: $("#shouldRemember").val()
				},
				method: "POST", 
				dataType: "json"
			}).done(function(data) {
				if (data == true) {
					window.location.replace(window.location.href);
				} else {
					alert("틀림");
				}
			})
		});
	});
	
</script>





<!-- 기억하기 쿠키를 이용한 ID 저장  -->
 <script>
 $(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var memberInputId = getCookie("memberInputId");
	    $("input[name='memberId']").val(memberInputId); 
	    if($("input[name='memberId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }
	     
	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='memberId']").val();
	            setCookie("memberInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("memberInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='memberId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='memberId']").val();
	            setCookie("memberInputId", memberInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
 
 </script>



<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 30px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .login-form .hint-text {
		color: #777;
		padding-bottom: 15px;
		text-align: center;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .login-btn {        
        font-size: 15px;
        font-weight: bold;
    }
    .or-seperator {
        margin: 20px 0 10px;
        text-align: center;
        border-top: 1px solid #ccc;
    }
    .or-seperator i {
        padding: 0 10px;
        background: #f7f7f7;
        position: relative;
        top: -11px;
        z-index: 1;
    }
    .social-btn .btn {
        margin: 10px 0;
        font-size: 15px;
        text-align: left; 
        line-height: 24px;       
    }
	.social-btn .btn i {
		float: left;
		margin: 4px 15px  0 5px;
        min-width: 15px;
	}
	.input-group-addon .fa{
		font-size: 18px;
	}
</style>




</head>
<body>

<div class="login-form">
    <form action="/member/login" method="post">
        <h2 class="text-center">산타북스 로그인</h2><br><br>	
        <div class="form-group">
        	<div class="input-group">
                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                <input type="text" class="form-control" id="id" name="memberId" placeholder="ID" required="required">
            </div>
        </div>


		<div class="form-group">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                <input type="password" class="form-control" id="pw" name="memberPw" placeholder="Password" required="required">
            </div>
        </div>        
        <div class="form-group">
        
         <button type="submit" class="btn btn-success btn-block login-btn">Sign in</button>
        
        
        <div class="or-seperator"><i>or</i></div>
        
         <div class="text-center social-btn">
            <a href="#" class="btn btn-primary btn-block"><i class="fa fa-facebook"></i> Sign in with <b>Facebook</b></a>
            <a href="#" class="btn btn-info btn-block"><i class="fa fa-twitter"></i> Sign in with <b>Twitter</b></a></div>
		<div id="my-signin2" onclick="clickGSignIn()" data-onsuccess="onSignIn"></div>
        
          
        </div>
        <div class="clearfix">
			<label class="pull-left checkbox-inline">
			<input type="checkbox" id="idSaveCheck"/> 이메일 저장</label>
            <a href="/member/find_pass" class="pull-right text-success">비밀번호를 잊으셨나요?</a>
        </div>  
        
    </form>
    <div class="hint-text small" >계정이 없으신가요? <a href="/member/join" class="text-success">회원가입하세요!</a></div>
</div>




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />