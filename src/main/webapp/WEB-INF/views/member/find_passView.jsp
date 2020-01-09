<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 
			<form:form id="signupform" class="form-horizontal" role="form" commandName = "userDto" action="find_pass" method="post">
                                <div class="form-group">
                                    <label for="email" class="col-md-2 control-label">이메일</label>
                                    <div class="col-md-10">
                                        <input type="text" class="form-control" name="memberId" value="${userDto.bEmail}"placeholder="이메일을 작성해주세요">
                                    </div>
                                    
                                        <div class="col-md-offset-2 col-md-10">
                                            <div style="color:red ; margin-top:2px" >
                                                <form:errors path="memberId"/>
                                                 <form:errors/>
                                            </div>
                                        </div>                 
                                    
                                </div>
                                    
                                <div class="form-group" style="margin-left:82%">
                                    <!-- Button -->
                                                  
                                    <div class="col-md-offset-10 col-md-9">
                                        <button id="btn-signup" type="submit" class="btn btn-warning">확인</button>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                                가입하신 이메일로 아이디와 비밀번호를 전송해드리겠습니다.
                                        </div>
                                    </div>
                                </div>    
                                
                            </form:form>




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />