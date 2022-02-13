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
	<form action="" class="flight_update">
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
	                <td><input type="text"/> </td>
	                <th>비행기아이디</th>
 	                <td><input type="text"/></td>
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
	                <td>
	                	<select name="departure_name" onchange="changeSelect(this)" id="departure_name">
	                     	<option value="" disabled selected>도시 혹은 공항</option>
	                     	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}">${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	                <th>도착지</th>
	                <td>
		                <select name="arrival_name" onchange="changeSelect(this)" id="arrival_name">
	                    	<option value="" disabled selected>도시 혹은 공항</option>
	                    	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" >${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	            </tr>
	            <tr>
	                <th>출발날짜</th>
	                <td>
						<input type="date" name="departure_date">
					</td>
	                <th>출발시간</th>
	                <td>
	                	<input type="time" name="departure_time">
	                </td>
	            </tr>
	            <tr>
	                <th>도착날짜</th>
	                <td>
						<input type="date" name="arrival_date">
					</td>
	                <th>도착시간</th>
	                <td>
	                	<input type="time" name="arrival_time">
	                </td>
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
	                <td><input type="number" name="normal_price"></td>
	                <th>프레스티지석</th>
	                <td><input type="number" name="prestige_price"></td>
	                <th>일등석</th>
	                <td><input type="number" name="first_price"></td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <div class="submit">
            <input type="submit" value="수정하기" onclick="updateBoard()">
        </div>
	</form>
</section>
<!-- popup E -->  
</body>
</html>