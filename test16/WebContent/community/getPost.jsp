<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<meta charset="EUC-KR">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("button:contains('수정')").on("click", function(){
			self.location = "/community/updatePost?postNo=${post.postNo}"
		})		
	});
</script>
</head>
<body>
<input type="hidden" value="${post.postNo}" />

<h3>${post.postName}</h3>
<h3>${post.postContent}</h3>
<h3>${post.user.userId}</h3>
<h3>${post.regDate}</h3>

<button type="button" class="btn btn-default">수정하기</button>
</body>
</html>