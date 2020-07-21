<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<meta charset="UTF-8">
<title>댓글</title>
<script type="text/javascript">
	$(function() {
		getCommentList(1);
	});

	//$(태그).on("click", function(){
	function getCommentList(){	
			
		$a.jax({
			url: "/community/json/getComment/"+commentNo,
			method : "GET",
			dataType : "json",
			headers : {
				"Accept" : "application/json",
				"Content-Type" : "application/json",
			},
			success: function(JSONData, status) {
				
				var displayValue = "<h6>"
					+"댓글번호: " + JSONData.commentNo + "<br/>"
					+"댓글내용: " + JSONData.commentContent + "<br/>"
					+"</h6>";
			}
			
			$("#"+commentNo+"").html(displayValue);
		})
		}
	
	}
	
</script>

</head>


<body>
	<input type="hidden" value="${post.postNo}"/>
	<input type="hidden" value="${post.userId}">
	<input type="hidden" value="${comment.commentNo}" />
	
	<h3>${comment.commentContent}</h3>
	<h3>${comment.user.userId}</h3>
	<h3>${comment.regDate}</h3>
</body>

<html lang="ko">

</html>