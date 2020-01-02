<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
 
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
 
<title>JSP AJAX 회원가입</title>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>
 
<!-- ajax를 시작 -->
<script type="text/javascript">
 
//registerCheckFunction->button ID CHECK를 누르면 실행되는 함수
function registerCheckFunction() {
    //id가 userID인 variable을 저장
    var memberNick = $('#memberNick').val();
        //ajax : jquery안에 포함되어있는 것
        $.ajax({
            type : 'POST',
            url : './MemberRegisterCheckServlet', //여기로 가서 function을 실행할꺼에요
            data : {
                memberID : memberID
            },
            success : function(result) { //result를 받아올꺼죠
                if (result == 1) {
                    $('#checkMessage').html("you can use this ID"); //이 id 값에다가 저장해주세요
                    $('#checkType')
                            .attr('class', 'modal-content panel-success');
                } else {
                    $('#checkMessage').html("you can not use this ID");
                    $('#checkType')
                            .attr('class', 'modal-content panel-warning'); //chekType의 class를 지정해줍니다.(attr = Attribute)
                }
                $('#checkModal').modal("show"); //checkModal을 보여주세요 -> modal은 popup창 같은 겁니당ㄴ
            }
        })
    }
    //passwordCheckFunction -> PasswordCheck를 하여 실시간으로 뿌려주는 것입니다.
    function pwCheckFunction(){
        var memberPw = $('MemberPw').val();
        var memberPwChk = $('#MemberPwCheck').val();
         
        if(userPassword1!=userPassword2){
            $('#passwordCheckMessage').html("비밀번호가 일치하지 않습니다");
        }
        else{
            $('#passwordCheckMessage').html("");
        }
    }
</script>
</head>
 
    <div class="container">
    <!-- post형식으로 userRegister로 보냅니다 -->
        <form method="post" action="./userRegister">
            <table class="table table-bordered table-hover"
                style="text-align: center; border: 1px solid #dddddd;">
                <thead>
                    <tr>
                        <th colspan="3"><h4>회원 등록</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 110px;"><h5>ID</h5></td>
                        <td><input class="form-control" type="text" id="userID"
                            name="userID" maxlength="20"></td>
                            <!-- 아래에 보면 ID CHECK button이 있고 그 버튼을 누르면 registerCheckFunction이 실행됩니다 -->
                        <td style="width: 110px;"><button class="btn btn-primary"
                                onClick="registerCheckFunction();" type="button">ID
                                CHECK</button></td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Password</h5></td>
                        <!-- onkeyup이 실시간으로 실행되는 함수인가봐요 passwordCheckFunction을 실행합니다 -->
                        <td colspan="2"><input class="form-control" type="password"
                            onkeyup="passwordCheckFunction();" id="userPassword1"
                            name="userPassword1" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Password Check</h5></td>
                        <!-- password가 일치해야하는 것이기 때문에 아래에도 함수를 추가해줍니다 -->
                        <td colspan="2"><input class="form-control" type="password"
                            onkeyup="passwordCheckFunction();" id="userPassword2"
                            name="userPassword2" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Name</h5></td>
                        <td colspan="2"><input class="form-control" type="text"
                            id="userName" name="userName" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Age</h5></td>
                        <td colspan="2"><input class="form-control" type="text"
                            id="userAge" name="userAge" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Gender</h5></td>
                        <td colspan="2">
                            <div class="form-group"
                                style="text-align: center; margin: 0 auto;">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary"> <input type="radio"
                                        name="userGender" id="userGender" value="남자">남자
                                    </label> <label class="btn btn-primary active"> <input
                                        type="radio" name="userGender" id="userGender" value="여자">여자
                                    </label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 110px;"><h5>Email</h5></td>
                        <td colspan="2"><input class="form-control" type="email"
                            id="userEmail" name="userEmail" maxlength="20"></td>
                    </tr>
                    <tr>
                        <td colspan="3" style="text-align: left"><input
                            class="btn btn-primary pull-right" type="submit" value="회원가입">
                            <!-- passwordCheckMessage id가 있네요 위에 passwordCheckFunction을 보면 이값이 정해집니다 (현재는 빈공간)-->
                            <h5 style="color: red;" id="passwordCheckMessage"></h5></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <%
    //messageContent라는 String이 있습니다
    //session에서 messageContent를 가져온 이후 그것이 null이 아니라면
    //session에서 가져온 messageContent를 현재 변수에 저장해줍니다
    //messageType도 똑같습니다
        String messageContent = null;
        if (session.getAttribute("messageContent") != null) {
            messageContent = (String) session.getAttribute("messageContent");
        }
        String messageType = null;
        if (session.getAttribute("messageType") != null) {
            messageType = (String) session.getAttribute("messageType");
        }
        if (messageContent != null) {
            //가져온 messageContent가 있다면 modal로 popup창을 만들어줘야합니다.
    %>
    <div class="modal fade" id="messageModal" tableindex="-1" role="dialog"
        aria-hidden="true">
        <dv class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div
                class="modal-content
                <!-- div의 class에 지정해주는데 messageType에 따라서 modal색을 다르게 해주고 싶기 때문에 이렇게 코드를 짭니다 -->
                <%if (messageType.equals("오류 메시지"))
                    out.println("panel-warning");
                else
                    out.println("panel-success");%>">
                <div class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span> <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">
                        <%=messageType%>
                    </h4>
                </div>
                <div class="modal-body">
                    <%=messageContent%>
                </div>
            </div>
        </div>
        </dv>
    </div>
    <script>
    //div class안의 messageModal
        $('#messageModal').modal("show");
    </script>
    <%
    //다 끝나면 Attribute를 삭제해줘야함
        session.removeAttribute("messageContent");
            session.removeAttribute("messageType");
        }
    %>
    <div class="modal fade" id="checkModal" tableindex="-1" role="dialog"
        aria-hidden="true">
        <dv class="vertical-alignment-helper">
        <div class="modal-dialog vertical-align-center">
            <div id="checkType" class="modal-content panel-info">
                <div class="modal-header panel-heading">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span> <span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title">Check Message</h4>
                </div>
                <!-- 여기에 비밀번호가 일치하는지 하지 않는지를 실시간으로 나타내줌 -->
                <!-- 이것이 모달이라니! 알아두자 -->
                <div class="modal-body" id="checkMessage"></div>
            </div>
        </div>
        </dv>
    </div>
 
 

