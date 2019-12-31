<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container" style="width: 75%; padding-top: 10%;">

	<form action="/novel/add" method="post">
		<div class="col-3 text-center" style="float: left;">
			<input id="input_img" type="file" name="" style="display: none;">
			<img id="img" class="img-thumbnail" width="100%" height="200px" src="/resources/images/logo.png" />
			<br><br>
			<button class="btn btn-success" id="imageBtn" type="button">사진 업로드</button>
		</div>
		
		<div class="col-9" style="float: left;">
			<div class="form-group row">
				<label for="novelTitle" class="col-sm-2 col-form-label">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="novelTitle" name="title">
				</div>
			</div>
			<div class="form-group row">
				<label for="dicription" class="col-sm-2 col-form-label">줄거리</label>
				<div class="col-sm-10">
					<textarea style="width: 100%; height: 150px;" class="form-control" id="dicription" name="discription"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<button type="button" id="addEpisodeBtn" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</form>


</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />