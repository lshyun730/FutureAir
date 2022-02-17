<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>비행정보</h2>
        <section>
        	<h3>기본정보</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>비행번호</th>
	                <td>${route.route_num}</td>
	                <th>비행기아이디</th>
 	                <td>${route.airplane_id }</td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>비행일정</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>출발지</th>
	                <td>${route.departure_name }</td>
	                <th>도착지</th>
	                <td>${route.arrival_name }</td>
	            </tr>
	            <tr>
	            	<fmt:parseDate value="${route.departure_date}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	               	<fmt:formatDate var="departure_date" pattern="yyyy-MM-dd" value="${departure_date_time}"/>
	               	<fmt:formatDate var="departure_time" pattern="HH:mm" value="${departure_date_time}"/>
	               	<fmt:parseDate value="${route.arrival_date}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	                <fmt:formatDate var="arrival_date" pattern="yyyy-MM-dd" value="${arrival_date_time}"/>
	               	<fmt:formatDate var="arrival_time" pattern="HH:mm" value="${arrival_date_time}"/>
	                <th>출발날짜</th>
	                <td>${departure_date }</td>
	                <th>출도착시간</th>
	                <td>${departure_time } - ${arrival_time } <c:if test="${departure_date ne arrival_date}">익일</c:if> </td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>가격정보</h3>
        	<!-- table S --> 
        	<table class="table">
        		<colgroup>
	        		<col width="13%">
	        		<col width="20%">
	        		<col width="15%">
	        		<col width="20%">
	        		<col width="13%">
	        		<col width="20%">
	        	</colgroup>
	            <tr>
	                <th>일반석</th>
	                <td>${route.normal_price }</td>
	                <th>프레스티지석</th>
	                <td>${route.prestige_price }</td>
	                <th>일등석</th>
	                <td>${route.first_price }</td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
</section>
<!-- popup E -->  
</body>
</html>