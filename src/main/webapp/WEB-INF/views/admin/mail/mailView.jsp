<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
<title>메일 미리보기</title>

</head>
<body style="background: #fff">
<!-- popup S -->  
    <section class="popup mail_view" id="popup">
    	<h2>메일 미리보기</h2>
        <table class="table">
        	<tr>
        		<th>제목</th>
        		<td>${mail.mail_title}</td>
        	</tr>
        	<tr>
        		<th>메일내용</th>
        		<td class="mail_body">
        			${mail.mail_body}
        		</td>
        	</tr>
        </table>   	
    </section>
    <!-- popup E -->
</body>
</html>