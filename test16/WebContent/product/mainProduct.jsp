<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!DOCTYPE html>
	<script type="text/javascript">
	//�����������ڸ���
	$(function() {
		fncGetUserList(1);
		console.log("������");
		
	});

	
	function fncGetUserList(currentPage) {
		$("#currentPage").val(currentPage);
		$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=${param.menu}").submit();	
	}
	
	 $(function() {
		 

		$( "td:nth-child(6) > i" ).on("click" , function() {
			var array = $(this).text().split(",");
			console.log("�ĳ�"+array);
			prodName = array[0].trim();
			prodNo = array[1].trim();
			proTranCode = array[2].trim();
			console.log("�߾�" +  array[0].trim() + "�߾�" + array[1].trim() + "�߾�" +array[2].trim() + "��"+ proTranCode );
			var menu = "${param.menu}";
			//console.log("��ȣ" + menu );
			$.ajax(
				{
					url : "/product/json/getProduct/"+prodNo,
					method : "GET",
					dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json",
					},
					success : function(JSONData, status) {
						
						var displayValue = "<h6>" 
								+ "��ǰ�� : " +JSONData.prodName+ "<br/>"
								+ "��ǰ������ : " + JSONData.prodDetail+ "<br/>"
								+ "�������� : " +JSONData.manuDate+ "<br/>"
								+ "���� : " + JSONData.price+ "<br/>"
								+"��ǰ �̹��� : <img src='/images/uploadFiles/"+JSONData.fileName+"'><br/>"
								+"</h6>";
								
							
						if(menu == "manage"){				
							displayValue += "<h6>" + '<a href="/product/updateProduct?prodNo=' + JSONData.prodNo + '&menu='+menu+'">'
							+ "�����ϱ�</a>" + "</h6>";
						} else if (menu == "search" && proTranCode == ''){ 
							displayValue += "<h6>" + '<a href="/product/getProduct?prodNo=' + JSONData.prodNo + '&menu='+menu+'">'
							+ "���Ÿ�ũ</a>" +"</h6>";
						} else if (menu == "search" && proTranCode != null){ 
							displayValue += "<h6>�ǸźҰ�</h6>"; 
						} 
						
						
						$("h6").remove();
						$("#"+prodName+"").html(displayValue);
					}
					
				});
			
		});
		
		$( "td:nth-child(2)" ).on("click" , function() {
			var array = $(this).text().split(",");
			prodName = array[0].trim();
			prodNo = array[1].trim();
			proTranCode = array[2].trim();
			console.log("�߾�" +  array[0].trim() + "�߾�" + array[1].trim() + "�߾�" +array[2].trim() + "��"+ proTranCode );
			var menu = "${param.menu}"; 
			
			if(menu == "manage"){				
				self.location = "/product/updateProduct?prodNo=" + prodNo + "&menu=" +menu;
			} else if (menu == "search" && proTranCode == ''){ 
				self.location = "/product/getProduct?prodNo=" + prodNo + "&menu=" +menu;
			} else if (menu == "search" && proTranCode != null){ 
				
			} 
			
		});
		
		$( "td:nth-child(2)" ).css("color" , "red");
		
			
		

	});	
	
</script>
	
	
	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <c:if test="${param.menu=='manage'}">
	       <h3>��ǰ ����</h3>
	       </c:if>
	       <c:if test="${param.menu=='search'}">
	       <h3>��ǰ�����ȸ</h3>
	       </c:if>
	    </div>
	    
	    <!-- table ���� �˻� Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
						<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : ""}>��ǰ��ȣ</option>
						<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : ""}>��ǰ��</option>
						<option value="2" ${! empty search.searchCondition && search.searchCondition==2 ? "selected" : ""}>��ǰ����</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table ���� �˻� Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
            <th align="left">��������</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr class="ct_list_pop">
			  <td align="center">${ i }</td>
			  <td align="left"  title="Click : ��ǰ���� Ȯ��">
			  	${product.prodName}
				<div style= "display: none;">,${product.prodNo}</div>
				<div style= "display: none;">,${product.proTranCode}</div>
			  </td>	
			  <td align="left">${product.price}</td>
			  <td align="left">${product.regDate}</td>
			  <td align="left" id = "proTran">
				<c:choose>
					<%-- null �̸� --%>
					<c:when test="${ empty product.proTranCode }">�Ǹ���</c:when>
					
					<c:when test="${param.menu=='manage'}">
						<c:if test="${ fn:contains(product.proTranCode, '1') }">
							���ſϷ� <a href="/purchase/updateTranCodeByProd?prodNo=${product.prodNo}&tranCode=2">����ϱ�</a>
						</c:if>
						<c:if test="${ fn:contains(product.proTranCode, '2') }"> ����� </c:if>
						<c:if test="${ fn:contains(product.proTranCode, '3') }"> ��ۿϷ� </c:if>		
					</c:when>
					
					<c:when test="${param.menu=='search' && user.role=='admin'}">
						<c:if test="${ fn:contains(product.proTranCode, '1') }"> ���ſϷ� </c:if>
						<c:if test="${ fn:contains(product.proTranCode, '2') }"> ����� </c:if>
						<c:if test="${ fn:contains(product.proTranCode, '3') }"> ��ۿϷ� </c:if>			
					</c:when>
					
					<c:otherwise>
						������
					</c:otherwise>	
				</c:choose>
			  </td>	
			  <td align="left"><!-- ���� -->
				  	<i class="glyphicon glyphicon-ok" id= "${product.prodName}">
				  	<div style= "display: none;">${product.prodName}</div>
				  	<div style= "display: none;">,${product.prodNo}</div>
					<div style= "display: none;">,${product.proTranCode}</div>
					</i>
				  	<input type="hidden" value="${product.prodName}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
      
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  ȭ�鱸�� div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
	
