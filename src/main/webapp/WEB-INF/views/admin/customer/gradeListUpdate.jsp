<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup gradeListUpdate" id="popup">
        <h2>등급변경</h2>
        <form>
	        <div class="inputbox">
	            <p class="inputbox_title">등급선택</p>
	            <div class="inputbox_input select_box">
	                <select>
	                	<option>선택</option>
	                </select>
	            </div>
	        </div>
	        <div class="submit">
	            <input type="submit" value="수정하기">
	        </div>
        </form>
</section>
<!-- popup E -->  
</body>
</html>