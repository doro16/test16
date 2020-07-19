<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>libLIBERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    

    <!-- 웹 폰트 (나눔고딕) -->
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean" rel="stylesheet">


    <!--부트스트랩 CSS-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!-- fontawesome cdn(웹 아이콘 라이브러리) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />



    <!-- jQuery js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- 부트스트랩 js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


	<!-- Scrollbar Custom CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
	<!-- jQuery Custom Scroller CDN -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.concat.min.js"></script>
	<!-- Header js & css -->




<!-- ////////////////////////위를 복사하세요//////////////////////////////////////// -->


	<!-- sweet alert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9.7.2/dist/sweetalert2.all.min.js"></script>
    
	<link rel="stylesheet" href="../css/post.css">

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>
<!-- include summernote-ko-KR -->
<script src="../javascript/summernote-ko-KR.js"></script>
<style>
</style>

<script>

function fncAddBoardpost(){
	var boardCode = $("input[name='boardCode']").val();
	var postType = $("select[name='postType']").val();
	var postTitle = $("input[name='postTitle']").val();
	var postContent = $("textarea[name='postContent']").val();


	if(postType == null || postType.length < 1){
		alert("말머리를 선택해주세요.");
		return false;
	}
	
	if(postTitle == null || postTitle.length < 1){
		alert("게시글 제목을 입력해주세요.");
		return false;
	}
	
	if(postContent == null || postContent.length < 1){
		alert("게시글 내용을 입력해주세요.");
		return false;
	}
	 
	$("#lyk-add-free").attr("method","POST").attr("action","/post/addBoardpost").submit();
}


	
	$(function() {

		$('#summernote').summernote({
			minHeight: 600,
	        maxHeight: 600,
			lang : 'ko-KR',
			callbacks: {
	        	onImageUpload: function(files, editor, welEditable) {
	                for (var i = files.length - 1; i >= 0; i--) {
	                  sendFile(files[i], this);
	                }
	              }
        	},
        	disableResizeEditor: true
		});
		$('.note-statusbar').hide();
		
		$("button.btn-basic").on("click", function(){
			fncAddBoardpost();
		});
		
		

	});
	
	function sendFile(file, el) {
		conlyke.log("??????????????" + el);
		var boardCode = $("input[name='boardCode']").val();
	    var form_data = new FormData();
	    form_data.append('file', file);
	    form_data.append('boardCode', boardCode);
	    $.ajax({
	      data: form_data,
	      type: "POST",
	      url: '/post/json/saveImage',
	      cache: false,
	      contentType: false,
	      enctype: 'multipart/form-data',
	      processData: false,
	      success: function(form_data) {
	        $(el).summernote('editor.insertImage', '/images/lyk/free_board/' + form_data.fileName);
	        
	      }
	    });
	  }
</script>


</head>

<body>


	<div class="mt-5">&nbsp;</div>
	<div class="container">
    <h1 class="lyk-board-header">게시글 작성</h1>
        <form id="lyk-add-free" class="form-group my-5 py-5">
            <input type="hidden" name="boardCode" value="0">
            <div class="form-row my-3">
                <div class="input-group col-lg-3">
                    <select class="form-control" name="postType">
                        <option selected disabled>말머리 선택</option>
                        <option value="1">문의용</option>
                        <option value="2">으로</option>
                        <option value="3">일단</option>
                    </select>
                </div>
                <div class="input-group col-lg-9">
                    <input type="text" class="form-control" name="postTitle" placeholder="게시글 제목을 입력하세요">
                </div>
            </div>
            <textarea id="summernote" name="postContent"></textarea>
            
            <div class="form-row d-flex justify-content-center my-5">
                <button type="button" class="btn btn-outline-basic m-1">취소</button>
                <button type="button" class="btn btn-basic m-1">등록</button>
            </div>
        </form>

    </div>
    
    
    <%-- <jsp:include page="/common/footer.jsp"/> --%>
</body>

</html>