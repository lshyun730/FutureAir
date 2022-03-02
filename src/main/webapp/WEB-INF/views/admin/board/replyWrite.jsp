<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.17.2/basic/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>답변작성</h2>
        <form id="reply_write">
            <div class="inputbox no_icon width100">
                <p class="inputbox_title">제목</p>
                <div class="inputbox_input">
                    <input type="text" name="title" id="title" value="re) ${post_title}">
                </div>
            </div>
            <input type="hidden" id="board_name" name="board_name" value="${board_name}">
            <input type="hidden" id="post_type" name="post_type" value="${post_type}">
            <input type="hidden" id="post_index" name="post_index" value="${post_index}">
            <div class="inputbox width100">
                <p class="inputbox_title">내용</p>
                <div class="inputbox_input textbox">
                	<textarea id="editor_body" name="contents"></textarea>
                </div>
            </div>
            <div class="submit">
                <input type="button" value="추가하기" onclick="replyWrite()">
            </div>
        </form>
</section>
<!-- popup E -->  
</body>
<script type="text/javascript">
	function replyWrite(){
		var title = document.getElementById('title').value
		var contents = CKEDITOR.instances.editor_body.getData()
		const textarea = document.querySelector('textarea[name="contents"]'); 

		if(title ==''){
			alert('제목을 한글자 이상 입력해주세요');
			return false;
		}

		if(contents ==''){
			alert('내용을 한글자 이상 입력해주세요');
			return false;
		}
		
		textarea.value = contents;

		 $.ajax({
			 url : 'replyWrite',
				data : $('#reply_write').serialize(),
				dataType : "json",
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data >= 1) {
						alert('답변작성 완료되었습니다')
						opener.parent.location.reload();
						window.close();
					}
				}
		 });
		
		return true;
	}
	
	CKEDITOR.replace( 'editor_body', {
		height:200
	} ); 
</script>
</html>