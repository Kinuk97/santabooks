<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container" style="width: 80%;">

	<form action="/novel/add" method="post">
		<div class="col-3 text-center" style="float: left;">
			<input id="input_img" type="file" name="" style="display: none;">
			<img id="img" class="img-thumbnail" width="100%" height="200px" />
			<br><br>
			<button class="btn btn-success" id="imageBtn" type="button">사진 업로드</button>
		</div>
		
		<div class="col-9" style="float: left;">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" id="inputEmail3">
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="inputPassword3">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<button type="submit" class="btn btn-primary">Sign in</button>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</form>


</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />