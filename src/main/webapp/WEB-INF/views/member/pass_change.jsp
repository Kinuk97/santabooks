<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/layout/header.jsp"></jsp:include><body>
 
<table border="1" width="300" height="300" align= "center">
<center>
<span style="color: green; font-weight: bold;">변경할 비밀번호를 입력해주세요.</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                    <form action="/member/pass_change${memberId}" method="post">

                        <br>
                        <div>
                            변경할 비밀번호 입력 : <input type = "password" name = "memberPw"
                                                  placeholder = "비밀번호를 입력하세요." >
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">비밀번호 변경</button>
 
        </form>
                        </div>
                    </td>
                </tr>
            </table>
 
<jsp:include page="/WEB-INF/views/layout/footer.jsp"></jsp:include>
