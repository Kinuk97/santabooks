<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<table border="1" width="300" height="300" align= "center">

<span style="color: green; font-weight: bold;">입력한 이메일로 받은 인증번호를 입력하세요. (인증번호가 맞아야 다음 단계로 넘어가실 수 있습니다.)</span> <br> <br>    
        <br> <br>
        
        
        <div style="text-align:center;">
            <tr>        
                <td>
                <center>
                    <form action="/member/join_injeung.do${dice}" method="post"> //받아온 인증코드를 컨트롤러로 넘겨서 일치하는지 확인                  
                    <center>
                        <br>
                        <div>
                            인증번호 입력 : <input type="number" name="email_injeung"
                                placeholder="  인증번호를 입력하세요. ">
                                
                                
                                <input hidden="hidden" type="email" name="uemail" value="${email }"/>
                        </div>                                        
 
                        <br> <br>
                        <button type="submit" name="submit">인증번호 전송</button>
 
                        </div>
                    </td>
                </tr>
            </table>
        </form>
</center>
 
 
</body>
</html>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />