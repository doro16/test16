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
	<!--  CSS �߰� : ���ٿ� ȭ�� ������ ���� �ذ� :  �ּ�ó�� ��, �� Ȯ��-->
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
								alert("Server���� ���� ���� : \n"+"���̵� : "+JSON.stringify(JSONData.list[0])+"<br/>");
								console.log("Server���� ���� ���� : \n"+"���̵� : "+JSON.stringify(JSONData.list[0])+"<br/>");
								
								
								 
								var members =  JSON.stringify(JSONData.list[0]);
								//List<Product> list =  objectMapper.readValue(jsonManyValue, new TypeReference<List<Product>>() {});
								
								//for (int i=0; i<list.size(); i++) {
								//	Product str = list.get(i);
								//	System.out.println(str);
								//}
								var displayValue = "<h6>"
								for (i=0; i < JSONData.list.length; i++){
									displayValue +="���̵� : "+JSONData.list[i].prodNo+"<br/>"
									+"��  �� : "+JSONData.list[i].prodName+"<br/>"
									+"������ : "+JSONData.list[i].prodDetail+"<br/>"
									+"���� : "+JSONData.list[i].price+"<br/>"
									+"������ : "+JSONData.list[i].manuDate+"<br/>"
									+"��ǰ �̹��� : <img src='/images/uploadFiles/"+JSONData.list[i].fileName+"'><br/>"
									+"</h6>";
								
								}

								
															
								//$("h6").remove();
								$( "h3" ).html(displayValue);
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

	<!--  �Ʒ��� ������ http://getbootstrap.com/getting-started/  ���� -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2MVCShop </h1>
        <p>J2SE , DBMS ,JDBC , Servlet & JSP, Java Framework , HTML5 , UI Framework �н� �� Mini-Project ����</p>
     </div>
    </div>

	<!-- ���� : http://getbootstrap.com/css/   : container part..... -->
	<div class="container">
        <div class="bs-example" data-example-id="thumbnails-with-custom-content">
    <div class="row">
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img src="/images/holder.jpg" width="240" height="220" alt="Generic placeholder thumbnail">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">��ǰ����</a> </p>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img src="/images/holder.jpg" width="240" height="220" >
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">��ǰ����</a> </p>
          </div>
        </div>
      </div>
      <div class="col-sm-6 col-md-4">
        <div class="thumbnail">
          <img src="/images/holder.jpg" width="240" height="220" alt="Generic placeholder thumbnail">
          <div class="caption">
            <h3>Thumbnail label</h3>
            <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
            <p><a href="#" class="btn btn-primary" role="button">��ǰ����</a> </p>
         </div>
        </div>
      </div>
    </div>
  	 </div>
  	 
<button type="button" class="btn btn-default">��ư</button>

<p name="hh" id="hh" ></p>

</body>

</html>