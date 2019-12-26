<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<c:import url="/WEB-INF/views/layout/header.jsp" />


<script type="text/javascript">
$(document).ready(function() {
	$("#cancel").click(function() {
			history.back(-1);
		)};
		
	$("#id").focus();
});
</script>

<style type="text/css">
</style>

<div class="container">

<h1>로그인</h1>
<hr>
<div>
<form action="/member/login" method="post" class="form-horizontal">
	<div class="form-group">
		<label class="col-xs-3 control-label" for="id">아이디 : </label>
		<div class="col-xs-6">
			<input type="text" class="form-control" id="id" name="id" placeholder="Id"/>
		</div>
	</div>

	<div class="form-group">
		<label class="col-xs-3 control-label" for="pw">패스워드 : </label>
		<div class="col-xs-6">
			<input type="password" class="form-control" id="pw" name="pw" placeholder="Password"/>
		</div>
	</div>
		
	<div class="form-group">
		<div class="col-xs-offset-3 col-xs-10">
			<button class="btn btn-primary">로그인</button>
			<input type="reset" id="cancel" class="btn btn-danger" value="취소"/>
		</div>
	</div>
</form>
</div>

</div><!-- .container -->

<c:import url="/WEB-INF/views/layout/footer.jsp" />
