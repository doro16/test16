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
		
		$("button:contains('삭제')").on("click", function(){
			self.location = "/community/deletePost?postNo=${post.postNo}"
			alert("게시글이 삭제되었습니다.");
		})
		
		$("button:contains('목록')").on("click", function(){
			self.location = "/community/getPostList"
		})
		
	});
	
	 $(function() { 
		 fncGetCommentList();		
	 });	
	 
	function fncGetCommentList(){
		alert("냐냐");
		$.ajax(
		    	{
		        url : "/community/json/getComment/"+10000,
		        method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(JSONData , status) {
							alert("멍"+JSONData);
							var displayValue = "";
							displayValue += "<h6>"
								+"댓글번호: " + JSONData.commentNo + "<br/>"
								+"댓글내용: " + JSONData.commentContent + "<br/>"
								+"</h6>";
						   
				
				$( "#hh" ).html(displayValue);
				}
				
		    	});

	}
	
		            

		            	
	

</script>
</head>
<body>
<input type="hidden" value="${post.postNo}" />

<h3>${post.postName}</h3>
<h3>${post.postContent}</h3>
<h3>${post.user.userId}</h3>
<h3>${post.regDate}</h3>
<br><br>
<div class="row" id="hh">
<button type="button" class="btn btn-default">수정하기</button>
<button type="button" class="btn btn-default">삭제하기</button>
<button type="button" class="btn btn-default">목록으로</button>
</body>
</html>