<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>리브리베로</title>
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
            	
            	<div class="col-md-6 text-left">
				    	<p class="text-primary">
				    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
				    	</p>
				    </div>
				    <div class="col-md-6 text-right">
				    <form class="form-inline" name="detailForm">
				    
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
					  
					  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					  <input type="hidden" id="currentPage" name="currentPage" value=""/>
					  
					</form>
	    			</div>
            	
                <article id="mainContent" class="content-article content-board">
                    
                   	
				    
                    <div class="warp_board">
                        <h3 class="screen_out">언론보도 목록</h3>
                        <ul class="list_news">
                            <!-- 변수 지정하기  -->
							<c:set var="i" value="0" />
							<c:forEach var="post" items="${list}"> <!-- 너가 모델에 넣었잖아.. -->
                            <c:set var="i" value="${ i+1 }" />
                            
                            <li>
                                <a href="/community/getPost?postNo=${post.postNo}" class="link_news">
                				<strong class="tit_news">${ i }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${post.postName}</strong>
             					</a>
             					 <a class="link_thumb">
             					<img src="/images/uploadFiles/${post.postImage}" alt="글사진" class="thumb_img" >
                                </a>
                                <a href="/community/getPost?postNo=${post.postNo}" class="txt_news">${post.postContent}</a>
                                <span class="txt_date">${post.regDate}</span>
                            </li>
                            </c:forEach>
                            
                             <!-- 
                            <li>
                                <a href="/board/detail/55?pageIndex=1" class="link_news before_thumb">
                				<strong class="tit_news">카카오엔터프라이즈, 한국은행과 인공지능 협력 MOU 체결</strong>
              					</a>
                                <a href="/board/detail/55?pageIndex=1" class="link_thumb">
                  				<img src="https://t1.kakaocdn.net/kakaoenterprise_com/thumbnail/NEWS/file-1592891708388" alt="" class="thumb_img" onerror="this.parentElement.remove()">
                				</a>
                                <a href="/board/detail/55?pageIndex=1" class="txt_news">- 인공지능 기술 활용해 한국은행 업무 인프라 고도화 지원- 경제 금융 분야 노하우와 인공지능 데이터 상호 공유[2020-06-23] 카카오엔터프라이즈가 인공지능 기술로 한국은행의 업무 고도화를 돕는다.카카오엔터프라이즈(대표 백상엽)는 23일(오늘) 서울 중구에 위치한 한국은행에서 카카오엔터프라이즈 백상엽 대표, 한국은행 윤면식 부총재 등이 참석한 가운데 인공지능 기술 협업과 연구에 관한 전략적 업무 협약(MOU)을 체결했다.한국은행은 최근 창립 제 70주년을 맞이해 중장기 발전전략을 발표하고 인공지능, 머신러닝 등 디지털 신기술을 적용하겠다고 공표한 바 있다. 이번 협약은 이를 위해 민간 기업과 협업하는 첫번째 사례로, 카카오엔터프라이즈는 한국은행의 업무 인프라 고도화를 위해 다양한 인공지능 기술을 제공한다. 한국은행은 경제 금융 분야의 노하우와 인공지능 학습데이터를 공유하고 빅데이터, AI 등 연구 조직을 설치할 예정이다.카카오엔터프라이즈는 다양한 인공지능 기술을 단계적으로 활용해 한국은행의 업무 수행 및 정책 결정을 지원한다. 우선, 기계번역 기술을 활용한 문서 번역, STT(speech to text) 기술을 활용한 회의록 작성, 인공지능 큐레이터 'AI도슨트' 등 사용자 맞춤형 인공지능을 개발한다. 중장기적으로는 금융 관련 정책 분야에 필요한 인공지능 기술 협력으로 확대해 나갈 것이다.카카오엔터프라이즈 백상엽 대표는 “카카오엔터프라이즈의 IT 기술과 한국은행의 노하우를 결합해 국가경제의 안정과 발전을 이끄는 한국은행이 효율적으로 금융과 경제 정책을 수립하는데 기여하겠다” 라고 말하며 “궁극적으로 이용자들에게 더 편리하고 혁신적인 서비스를 제공할 수 있도록 한국은행과 꾸준한 협력을 이어나갈 예정” 이라고 전했다.한편, 카카오엔터프라이즈는 지난 12월 출범 후 상반기 동안 각 업계 최고 수준의 파트너들과 13건의 업무협약을 맺었다. 가전, 문화, 레저, 헬스케어, 금융사, 물류 등 다양한 이종 산업과 협력을 맺고 기업 간 거래사업의 폭을 확대해나가고 있다. 다양한 기업 파트너에게 데이터를 활용, 분석하는 노하우 및 맞춤형 데이터 서비스와 기술을 제공하면서 전산업분야와 디지털 협력을 지속하고 혁신을 선도하고 있다. [끝]</a>
                                <span class="txt_date">2020.06.23</span>
                            </li>
                            
                            <li>
                                <a href="/board/detail/50?pageIndex=1" class="link_news before_thumb">
                				<strong class="tit_news">B2B 샛별로 떠오른 카카오의 전략은 'AI 백화점'</strong>
             					 </a>
                                <a href="/board/detail/50?pageIndex=1" class="link_thumb">
                 				<img src="https://t1.kakaocdn.net/kakaoenterprise_com/thumbnail/NEWS/file-1589418178791" alt="" class="thumb_img" onerror="this.parentElement.remove()">
                				</a>
                                <a href="/board/detail/50?pageIndex=1" class="txt_news">[2020-05-14] 카카오엔터프라이즈가 중앙일보에 소개되었습니다. 디지털 전환에 대한 수요 증가로, 다양한 AI 솔루션을 제공하고 있는 카카오엔터프라이즈가 주목을 받고 있습니다. 자세한 내용은 아래 기사를 통해 확인하실 수 있습니다. [출처: 중앙일보] B2B 샛별로 떠오른 카카오의 전략은 'AI 백화점' (2020-05-11)</a>
                                <span class="txt_date">2020.05.14</span>
                            </li>
                             -->
                          
                        </ul>
                    </div>
                    
                </article>
            </section>
        </main>
        <button type="button" class="btn btn-default" onclick="location.href='/community/addPost' ">글쓰기</button>
        <div class="dimmed_layer" style="display:none"></div>
        
    </div>
<jsp:include page="../common/pageNavigator_new.jsp"/>
</body>
<script src="/resources/scripts/runtime-2c7303c0.js"></script>
<script>
    window._pageInfo = {
        'pageNumber': '202'
    };
    Tiara.init();
    TiaraTracker.getInstance().setAutoClick(true);
    
   
</script>
<script src="/resources/scripts/pages/common/common-a0e7f210.js"></script>
<script src="/resources/scripts/pages/common/pc-ed7275d7.js"></script>
<script>
    Tiara.trackPageView({
        page: 'newsList',
        section: 'news',
        custom_props: ''
    });
</script>

</html>