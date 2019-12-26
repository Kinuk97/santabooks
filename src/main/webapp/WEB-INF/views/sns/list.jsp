<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/layout/header.jsp" />
<style type="text/css">
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Float four columns side by side */
.column {
  width: 60%;
  padding: 0 10px;
}

.card {
	height: 200px;
}


/* Remove extra left and right margins, due to padding in columns */
.row {
	margin: 0 -5px;

}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* this adds the "card" effect */
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}

/* Responsive columns - one column layout (vertical) on small screens */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}
</style>

<div class="container">
<c:forEach items="${reviewList }" var="review">
	<div class="row">
		<div class="column">
			<div class="card">
				<p>${review.review }</p>
				<div class="text-right">${review.reviewDate }</div>
			</div>
		</div>
	</div>
	<br>
</c:forEach>
</div>




<jsp:include page="/WEB-INF/views/layout/paging.jsp"/>
<jsp:include page="/WEB-INF/views/layout/footer.jsp" />


