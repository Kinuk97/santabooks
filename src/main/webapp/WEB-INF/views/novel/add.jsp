<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<div class="container" style="width: 75%; padding-top: 5%;">

	<form action="/novel/add" method="post" enctype="multipart/form-data">
		<div class="col-3 text-center" style="float: left;">
			<input id="input_img" type="file" name="upload" style="display: none;">
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
				<label for="discription" class="col-sm-2 col-form-label">줄거리</label>
				<div class="col-sm-10">
					<textarea style="width: 100%; height: 150px;" class="form-control" id="discription" name="discription"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">장르</label>
				<div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio" name="category" value="1" required="required">
				    <label class="custom-control-label" for="customRadio">판타지</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio2" name="category" value="2" required="required">
				    <label class="custom-control-label" for="customRadio2">현판</label>
			    </div>
				<div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio3" name="category" value="3" required="required">
				    <label class="custom-control-label" for="customRadio3">로맨스</label>
			    </div>
				<div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio4" name="category" value="4" required="required">
				    <label class="custom-control-label" for="customRadio4">로판</label>
			    </div>
				<div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio5" name="category" value="5" required="required">
				    <label class="custom-control-label" for="customRadio5">무협</label>
			    </div>
				
			</div>
			<div class="form-group row">
				<div class="col-sm-2"></div>
				<div class="col-sm-10">
					<button type="submit" id="addEpisodeBtn" class="btn btn-primary">등록하기</button>
				</div>
			</div>
		</div>
		<div style="clear: both;"></div>
	</form>


</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />