<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

 

            <!-- Nested Row within Card Body -->
       <div class="col-xs-6 text-center">     
          <div class="text-center">
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-2">비밀번호를 잊으셨나요?</h1>
                    <p class="mb-4">회원가입하신 이메일 주소를 입력해 주시면, 비밀번호를 재설정할 수 있습니다.</p>
                  </div>
                  <form class="member">
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="exampleInputEmail" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <a href="login.html" class="btn btn-primary btn-user btn-block">
                      비밀번호 재설정
                    </a>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="register.html">회원가입</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="login.html">로그인</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
         </div> 
          




<jsp:include page="/WEB-INF/views/layout/footer.jsp" />