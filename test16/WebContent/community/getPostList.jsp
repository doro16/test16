<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
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
    <link rel="stylesheet" href="../css/pc-392fad76.css" type="text/css">

    <script type="text/javascript">
		//이거 페이지처리야 ㅁㅊ아..
		function fncGetUserList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method", "POST").attr("action", "/community/getPostList").submit();	
		}   
	    
		// $(function() {
		//  	 $("button.btn btn-default").on("click", function(){
		//   		alert("뭐냐고");
		//			self.location = "/community/addPost";
		//		}); 
		//    });
        
    </script>
</head>

<body>
<jsp:include page="/layout/toolbar.jsp" />
    <div class="container-doc">
        
        <main class="doc-main">
            	
        
				
                <article id="mainContent" class="content-article content-board">
                    
				    <form class="form-inline text-right">
				    
					  <div class="form-group">
					    <select class="form-control" name="searchCondition" >
							<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>글번호</option>
							<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>글제목</option>
							<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>글내용</option>
						</select>
					  </div>
					  
					  <div class="form-group">
					    <label class="sr-only" for="searchKeyword">검색어</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					  </div>
					  
					  <button type="button" class="btn btn-default">검색</button>
					  <button type="button" class="btn btn-info" onclick="location.href='/community/addPost' ">글쓰기</button>
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
					
	    			<p style="float:left"> 전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지 </p>
				    
                    <div class="warp_board">
                        <ul class="list_news">
                            <!-- 변수 지정하기  -->
							<c:set var="i" value="0" />
							<c:forEach var="post" items="${list}"> 
                            <c:set var="i" value="${ i+1 }" />
                            
                            <li>
                                <a href="/community/getPost?postNo=${post.postNo}" class="link_news before_thumb">
                				<strong class="tit_news">${ i }&nbsp;&nbsp;${post.postName}</strong>
             					</a>
             					 <a class="link_thumb">
             					<img src="/images/uploadFiles/${post.postImage}" alt="글사진" class="thumb_img" >
                                </a>
                                <a href="/community/getPost?postNo=${post.postNo}" class="txt_news">${post.postContent}</a>
                                <span class="txt_date">${post.regDate}</span>
                            </li>
                            </c:forEach>
                           
                          
                        </ul>
                    </div>
                    
                </article>
            </section>
        </main>
        
        <div class="dimmed_layer" style="display:none"></div>
        
    </div>
<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>

</html>