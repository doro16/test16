<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<!DOCTYPE html>
<html lang="ko">

<head>
	<title>libLIBERO</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	<script src="../javascript/summernote-ko-KR.js"></script>


<script type="text/javascript">
	
	function fncAddPost(){
		var postName = $("input[name='postName']").val();
		var postContent = $("textarea[name='postContent']").val();
	
		if(postName == null || postName.length <1){
			alert("제목을 입력해주세요.");
			return;
		}
		
		if(postContent == null || postContent.length <1){
			alert("내용을 입력해주세요.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/community/addPost").attr("enctype", "multipart/form-data").submit();
	}
	
	
	$(function() {

		$('#summernote').summernote({
			minHeight: 600,
	        maxHeight: 600,
			lang : 'ko-KR',
			focus: true,
			
     
        	 toolbar: [
 			    // [groupName, [list of button]]
 			    ['fontname', ['fontname']],
 			    ['fontsize', ['fontsize']],
 			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
 			    ['color', ['forecolor','color']],
 			    ['table', ['table']],
 			    ['para', ['ul', 'ol', 'paragraph']],
 			    ['height', ['height']],
 			    ['insert',['picture','link','video']],
 			    ['view', ['fullscreen', 'help']]
 			  ],
 			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
 			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
		});
		$('.note-statusbar').hide();
		
		$("button:contains('등록')").on("click", function(){
			
			fncAddPost()
		});
		
		
		
	});
</script>


</head>

<body>


	<div class="mt-5">&nbsp;</div>
	<div class="container">
    <h1>게시글 작성</h1>
        <form class="form-group my-5 py-5">
            <input type="hidden" name="postType" value="0">
            <div class="form-row my-3">
                <div class="input-group col-lg-12">
                    <input type="text" class="form-control" name="postName" placeholder="제목을 입력해주세요">
                </div>
            </div>
            <textarea id="summernote" name="postContent"></textarea>
            
            <div class="form-row justify-content-center my-5">
                <button type="button" class="btn">취소</button>
                <button type="button" class="btn">등록</button>
            </div>
        </form>

    </div>
</body>

</html>