<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdn.ckeditor.com/4.17.2/standard-all/ckeditor.js"></script>
	<title>메일 수정하기</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
    <section class="popup" id="popup">
    	<h2>메일 수정하기</h2>
    	<form class="mail_update" onsubmit="return updateFlight()">
	        <table class="table">
	        	<tr>
	        		<th>제목</th>
	        		<td><input type="text" name="mail_title" value="${mail.mail_title}"/> </td>
	        	</tr>
	        	<tr>
	        		<th>메일내용</th>
	        		<td class="mail_body">
	        			<div class="textbox" >
		        			<textarea id="editor_body" name="mail_body">${mail.mail_body}</textarea>
	        			</div>
	        		</td>
	        	</tr>
	        </table>   	
	        <div class="submit">
	        	<input type="hidden" name="mail_num" value="${mail.mail_num}" />
	            <input type="submit" value="수정하기">
	        </div>
        </form>
    </section>
    <!-- popup E -->
    <script>
    	CKEDITOR.replace( 'editor_body', {
    		height:400
    	} ); 
    	
    	function updateFlight() {
    		const date = CKEDITOR.instances.editor_body.getData();
    		const body = document.querySelector('textarea[name="mail_body"]'); 
    		body.value = date;
    		
    	 	$.ajax({
    		    type: 'POST',
    		    url: 'mailUpdate',
    		    data: $('.mail_update').serialize(),
    		    success: function (data) {
    		    	if(data==1) {
    		    		alert('수정되었습니다');
   		    		 	opener.location.reload();
    		    		window.close();
    				}
    		    }
    		}); 
    	}
    </script>
</body>
</html>