<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	
  	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

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
	
	
	</script>
</head>
<body>
<form>
<input type="hidden" id="postNo" name="postNo" value="${post.postNo}"/>
</form>

<h3>${post.postName}</h3>
<h3>${post.postContent}</h3>
<h3>${post.user.userId}</h3>
<h3>${post.regDate}</h3>
<br><br>
<jsp:include page="comment.jsp"></jsp:include>
<div class="row" id="hh"></div> 
<div class="container">
<button type="button" class="btn btn-outline-info">수정하기</button>&nbsp;&nbsp;&nbsp;
<button type="button" class="btn btn-outline-info">삭제하기</button>
<button type="button" class="btn btn-info" style="float: right;">목록으로</button>
</div>
</body>
</html>