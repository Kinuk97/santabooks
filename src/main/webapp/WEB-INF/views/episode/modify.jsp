<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script type="text/javascript" src="/resources/js/novel.js"></script>

<script src="https://cdn.ckeditor.com/4.13.1/standard/ckeditor.js"></script>

<div class="container text-center" style="width: 75%; padding-top: 2%;">

	<form action="/episode/modify" method="post">
		<div class="col-12">
			<div class="form-group">
				<input type="text" class="form-control" id="novelTitle" name="title" placeholder="제목을 입력하세요" autocomplete="off" value="${episode.title }" required="required">
			</div>
			<div class="form-group">
				<textarea style="width: 100%; height: 150px;" class="form-control" id="content" name="content" required="required">${episode.content }</textarea>
				<script>
                       CKEDITOR.replace( 'content' );
               	</script>
			</div>
			<div class="text-center">
				<input type="text" name="episodeNo" value="${episode.episodeNo }" hidden="hidden">
				<button type="submit" class="btn btn-primary">등록하기</button>
			</div>
		</div>
		<div style="clear: both;"></div>
	</form>


</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />