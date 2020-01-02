<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    
       <title>::산타북스 회원가입::</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
 <!-- 생년월일 날짜 선택 -->
 <!-- jQuery UI CSS파일 -->
 <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
 
 <!-- jQuery 기본 js파일 -->
 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
 
 <!-- jQuery UI 라이브러리 js파일 -->
 <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  
 
 
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    
<script type="text/javascript">



// 날짜 추가하는 메소드
$(function() {
    $( "#testDatepicker" ).datepicker({
    	dateFormat: "yymmdd"
    });
});
</script>    
    
</head>
<body>

     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>산타북스 회원가입</h2>
    <form action="/member/join" method="post">
        <table class="table table-boardered">
        
        
        
            <tr>
                <th>이메일</th>
                <td><input type="text" class="form-control" name="memberId" placeholder="e-mail을 입력하세요">
                               
            </tr>

            
            
              <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" name="memberName" placeholder="성함을 입력해주세요"></td>      
            </tr>
            
            
              <tr>
                <th>닉네임</th>
                <td><input type="text" class="form-control" name="memberNick" placeholder="닉네임을 입력해주세요"></td>      
            </tr>
            
          
            <tr>
                <th>비밀번호</th>
                <td><input type="password" class="form-control" name="memberPw" placeholder="영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8-16자"></td>      
            </tr>
             
            <tr>
                <th>비밀번호확인</th>
                <td><input type="password" class="form-control" name="memberPwChk"></td>        
            </tr>
             
               <tr>
                <th>생년월일</th>
                <td><input type="text" style="cursor: pointer;" class="form-control" id="testDatepicker" name="memberBirth" readonly="readonly"></td>        
            </tr>
            
                 <tr>
                <th>휴대전화</th>
                <td><input type="tel" class="form-control" name="2" placeholder="(-)없이 입력해주세요"></td>        
            </tr>
             
             
 			<tr>
                <th>주소</th>
                <td><input type="text" class="form-control" name="memberAdd"></td>
                        
            </tr>
             
             
             
                         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="memberGender" value="female">여성 &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="radio"  name="memberGender" value="male">남성 &nbsp;&nbsp;
    
                </td>   
                  
            </tr>
            
                <tr>
                <th>장르</th>
                <td>
                <input type="radio"  name="genre" value="female">추후삭제
            </tr>
             
                             <tr>
                <th>구독여부</th>
                <td>
                <input type="radio"  name="subcheck" value="female">추후삭제
            </tr>
             
                         <tr>
                <th>이용약관</th>
                <td>
                <input type="checkbox"  name="pleaseyes" value="이용약관">이용약관 및 개인정보수집 및 이용, 마케팅 수신(선택)에 모두 동의합니다. &nbsp;&nbsp;
              
                </td>     
            </tr>
             
             
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="회원가입">
                <input type="reset" class="btn btn-danger" value="취소">
                </td>
            </tr>
             
             
        </table>
    </form>
    </div>
     
    </div>
    </div>
</div>
</body>
</html>