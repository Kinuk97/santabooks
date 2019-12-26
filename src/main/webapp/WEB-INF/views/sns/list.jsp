<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp"/>

	<script type="text/javascript">
	
	var curPage = 1;
	var loading = false;
	var totalPage = "${paging.totalPage}";
	
	function reviewSnsList(){
	    	$.ajax({
				type : "post",
				url : "/sns/list",
				data : { "curPage" : curPage, "feedNo" : "${paging.feedNo}", "memberNo" : "${paging.memberNo}",
					"bookNo" : "${paging.bookNo}", "review" : "${paging.review}","privacy" : "${paging.privacy}" }, 
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						
						var caption = $("<div class='caption caption-project' onclick=\"location.href='/sns/view?feedNo="+data[i].feedNo+"'\"></div>");
						
						caption.append($("<p></p>").text(data[i].reviews));
						
						var board = $("<div class='col-sm6 col-md-4 col-lg-3'></div>").append($("<div class='thumbnail'></div>").append(caption));
						
						$("#review").append(review);
					}	
					
					loading = false;
				},
				error : function(e) {
					console.log(e);
				}
			});
	} // project end
	
	$(document).ready(function() {
			
		$(window).scroll(function() {
			if (loading) {
				return;
			}
			if (curPage >= totalPage) {
				return;
			}
			
			if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
		    	loading = true;
		    	curPage += 1;
		    	projectList();
			}
		}); // scroll end
	
}); // document end
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//경고 모달 호출 메서드
	 function warningModal(content) {
	    $(".modal-contents").text(content);
	    $("#defaultModal").modal('show');
	   }
	
	//로그인을 하지 않았는데 새로운 글 작성을 눌렀을 때
	$("#btnNoLogWrite").click(function() {
		warningModal("로그인이 필요합니다.");
	});
});

</script>


<div id="review" class="container list-container">
	<h1 class="text-center">리뷰</h1>
	


</div>

	
<br>	
<hr>

<!-- 모달창 -->
            <div class="modal fade" id="defaultModal">
               <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header panel-heading">
                            <h4 class="modal-title">알림</h4>
                        </div>
                        <div class="modal-body">
                            <p class="modal-contents"></p>
                        </div>
                        <div class="modal-footer">
                           <button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
       
            <!--// 모달창 -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


