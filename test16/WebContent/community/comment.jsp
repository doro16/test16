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
			 fncGetCommentList();		
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
									displayValue += "<h6> &nbsp;&nbsp;&nbsp;&nbsp;"
										+"댓글번호: " + JSONData.list[i].commentNo + "<br/>&nbsp;&nbsp;&nbsp;&nbsp;"
										+"댓글내용: " + JSONData.list[i].commentContent + "<br/>"
										+"</h6>";	
								}
								
								
								
							   
					
					$( "#hh" ).html(displayValue);
					}
					
			    	});
		
		}
		
		$(function() { 
			$("#addComent").on("click", function(){
				//var userId = $("input[name='userId']").val();
				var content = $("textarea[id='commentContent']").val();
				alert(userId + content);
				$.ajax(
				    	{  		 	
				        url : "/community/json/addComment",
				        method : "POST" ,
						dataType : "json" ,
						data: JSON.stringify({
							commentContent: commentContent
						}), // 전송할 데이터
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
									alert(JSON.stringify(JSONData.list[0]));
									alert(JSONdata.commentContent);	
						}
						
				    	});
			
				
				
			})	
		});
	
	</script>
</head>


<body>
  <form method="POST"  >
	
	<div class="container">
	        <div class="border-bottom mt-2 mb-4 py-4">
	            <div class="form-row d-flex justify-content-center">
	                <textarea class="form-control col-9 col-md-10 mr-1" id="commentContent" name="commentContent" rows="3" maxlength="500"></textarea>
	                <button class="col-2 col-md-1 btn btn-basic" id="addComment">등록</button>
	                
	            </div>
	            <span class="m-3 m-md-5"><strong class="text-danger" id="counter">0</strong> / 500자</span>
	        </div>
	</div>
  </form>
</body>

</html>