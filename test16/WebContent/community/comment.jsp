<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model2.mvc.service.domain.*"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>

<script type="text/javascript">
		$(function() { 
			 fncGetCommentList();		 
		});	
		
		
		

		$(function() { 
			$("#addComment").on("click", function(){
				var postNo = parseInt($("input[name='postNo']").val());
    			var commentContent = $('#commentContent').val();
    			//alert(postNo + commentContent);
				$.ajax(
				    	{  		 	
				        url : "/community/json/addComment",
				        method : "POST" ,
						dataType : "json" ,
						
						data : JSON.stringify({
	    					"postNo" : postNo,
	    					"commentContent" : commentContent
	    				}),
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {

						}	
				    	});
			})	
		});
		
		function fncGetCommentList(){
			
			var postNo = parseInt($("input[name='postNo']").val()); 
			
			//alert(postNo);
			$.ajax(
			    	{
			    		 	
			        url : "/community/json/getCommentList/"+postNo,
			        method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
								
								var displayValue = "";
								for(i=0; i < JSONData.list.length; i++){
									displayValue += "<h6>"
										+"<input type='hidden' class='commentNo' name='commentNo' value=" + JSONData.list[i].commentNo + ">"
										
										
										+ "<img src='../images/uploadFiles/"+JSONData.list[i].user.profile+"'  alt='프로필사진' style='height: 55px; width: 55px; float: left; margin-right: 10px; margin-bottom: 10px;'>"
										+"<p style='color:blue;'>" +JSONData.list[i].user.nickname + "</p>"
										
										+"<h6 id='yy'>" + JSONData.list[i].commentContent + "</h6>" 
										+"<div class='commentUpdateDelete'>"
											+"<input type='hidden' class='commentNo' value=" + JSONData.list[i].commentNo + ">"
											+"<p style='float:left; font-size: small;'>수정 </p>"
											+"<p style='font-size: small;'>&nbsp삭제</p>"
										+"</div>";	
								}
								
					$( "#hh" ).html(displayValue);
					}	
			    	});
		
		}
		$(document).on("click", ".commentUpdateDelete p:nth-child(2)", function(){
			commentNo = $(this).parent().find(".commentNo").val();
			$(this).parent().find("p").hide();
			$.ajax(
			    	{
			        url : "/community/json/updateComment/"+commentNo,
			        method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {
								
								var displayValue = "";
								displayValue += 
									"<textarea class='form-control col-9 col-md-10 mr-1' id='commentContent' name='commentContent' rows='3' maxlength='500'>"
									+ JSONData.commentContent
									+"</textarea><br><br><br><br>"
									+"<button class='col-2 col-md-1 btn btn-outline-info' id='updateComment'>등록</button>"

   
								
					$( "#yy" ).html(displayValue);
					}	
    	});
		
	});
		
		

	
	</script>
</head>


<body>
	<form name="addCommentForm" id="addCommentForm">
		<input type="hidden" id="postNo" name="postNo" value="${post.postNo}" />
		<div class="container">
			<div class="border-bottom mt-2 mb-4 py-4">
				<div class="form-row d-flex justify-content-center">
					<textarea class="form-control col-9 col-md-10 mr-1"
						id="commentContent" name="commentContent" rows="3" maxlength="500"></textarea>
					<button class="col-2 col-md-1 btn btn-outline-info" id="addComment">등록</button>


				</div>

			</div>
		</div>
	</form>

</body>

</html>