<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="ko">
<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   	<link href="/css/animate.min.css" rel="stylesheet">
   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   	<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   	<!-- jQuery UI toolTip 사용 CSS-->
  	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  	<!-- jQuery UI toolTip 사용 JS-->
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- 추가된건 이거 한 줄 -->
    <link rel="stylesheet" href="../css/pc-966ebda2.css" type="text/css">

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
<input type="hidden" id="userId" name="userId" value="${post.user.userId}"/>
</form>
		<article id="mainContent" class="content-board">
		<section class="wrap_content">
           <div class="tit_board">
               <h4>${post.postName}</h4> <h3>${post.user.nickname}</h3>
               <span> ${post.regDate}</span>
           </div>
           <div class="txt_board">
               <p><img src="../images/uploadFiles/${post.postImage}"></p>
               <p>${post.postContent}</p>
           </div>
		</section>
		<br><br><br>
		<button type="button" class="btn btn-outline-info">수정하기</button>&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btn-outline-info">삭제하기</button>
		<button type="button" class="btn btn-info" style="float: right;">목록으로</button>
		</article>

<div class="container">

	<jsp:include page="comment.jsp"></jsp:include>
	<div class="border-bottom mt-2 mb-4 py-4" id="hh"></div> 
</div>
</body>
</html>