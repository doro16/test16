<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<meta charset="UTF-8">
<title>댓글</title>
<script type="text/javascript">
	$(function() {
		getCommentList(1);
	});

	//$(태그).on("click", function(){
	function getCommentList(){	
		var postId = $(this).next().val();
		
		$.ajax(
			{
				url: "/community/json/getComment/"+commentNo,rrrdddd
				method: "GET",
				dataType: "json",
				header: {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				}
				success: function(JSONData, status){
					var displayValue = "<h6>"
							+"댓글아이디:"+JSONData.comment.user.userId+"<br/>"
							+"댓글닉네임:"+JSONData.comment.user.nickname+"<br/>"
							+"댓글내용:"+JSONdata.commen
							+"사진: "
							+"작성일자: "
							
					$("h6").remove();
					$("#"+commentNo+"").html(displayValue); 
					
				}
			
			
			
			
			}		
		
		
		)
		
	}){
		
	});
</script>

</head>


<body>
	<input type="hidden" value="${post.postId}"/>
	<input type="hidden" value="${post.userId}">
	<input type="hidden" value="${comment.commentNo}" />
	
	<h3>${comment.commentContent}</h3>
	<h3>${comment.user.userId}</h3>
	<h3>${comment.regDate}</h3>
</body>
</html>