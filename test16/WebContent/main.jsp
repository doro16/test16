<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   <script type="text/javascript">

	</script>
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
        body {
            padding-top : 70px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	 <script type="text/javascript">
	 $(function() { 
		 testUserList();
				
	 });	
	 
	 function testUserList(){
				var userId = $(this).next().val();
				
				$.ajax( 
						{
							url : "/product/json/listProduct" ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {
								//alert("Server에서 받은 내용 : \n"+"아이디 : "+JSON.stringify(JSONData.list[0])+"<br/>");
								//console.log("Server에서 받은 내용 : \n"+"아이디 : "+JSON.``(JSONData.list[0])+"<br/>");
								
								
								 
								var members =  JSON.stringify(JSONData.list[0]);
								//List<Product> list =  objectMapper.readValue(jsonManyValue, new TypeReference<List<Product>>() {});
								
								//for (int i=0; i<list.size(); i++) {
								//	Product str = list.get(i);
								//	System.out.println(str);
								//}
								var displayValue = ""
								for (i=0; i < JSONData.list.length; i++){
									displayValue += '<div class="col-sm-6 col-md-4">'
							       +' <div class="thumbnail">'
							       +'  <img src="/images/uploadFiles/' + JSONData.list[i].fileName + '" width="242" height="220" alt="썸네일">'
							       +'   <div class="caption">'
							       +'     <h3>'+ JSONData.list[i].prodName +'</h3>'
							       +'     <p>'+ JSONData.list[i].prodDetail +'</p>'
							       +'     <p>'+ JSONData.list[i].price +'</p>'
							       +'     <p>'+ JSONData.list[i].manuDate +'</p>'
							       +'     <p><a href="/product/getProduct?prodNo='+  JSONData.list[i].prodNo  + '&menu=search" class="btn btn-primary" role="button">상품보기</a> </p>'
							       +'   </div>'
							       +' </div>'
							       +'</div>'
								;
								
								}

															
								//$("h6").remove();
								$( "#hh" ).html(displayValue);
							}
					});
					///////////////////////////////////////////////////////////////////////////////////////////
	 
	 }

	 
	 </script>
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />

   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>baskinrobbins </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework 학습 후 Mini-Project 진행</p>
     </div>
    </div>

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
	<div class="container" >
        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
    <div class="row" id="hh">
      
      
     
    </div>
  	</div>
  	 


</body>

</html>