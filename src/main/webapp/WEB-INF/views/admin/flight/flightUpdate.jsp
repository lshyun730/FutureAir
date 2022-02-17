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
	<form class="flight_update" onsubmit="return updateFlight()">
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
	                <td><input type="text" name="route_num" value="${route.route_num}" readonly="readonly"/> </td>
	                <th>비행기아이디</th>
 	                <td><input type="text" name="airplane_id" value="${route.airplane_id}" readonly="readonly"/></td>
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
	                	<select name="departure_name" onchange="changeSelect(this)" id="departure_name" required="required">
	                     	<option value="" disabled selected>도시 혹은 공항</option>
	                     	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq route.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	                <th>도착지</th>
	                <td>
		                <select name="arrival_name" onchange="changeSelect(this)" id="arrival_name" required="required">
	                    	<option value="" disabled selected>도시 혹은 공항</option>
	                    	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq route.arrival_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	            </tr>
	            <tr>
	            	<fmt:parseDate value="${route.departure_date}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	               	<fmt:formatDate var="departure_date" pattern="yyyy-MM-dd" value="${departure_date_time}"/>
	               	<fmt:formatDate var="departure_time" pattern="HH:mm" value="${departure_date_time}"/>
	               	<fmt:parseDate value="${route.arrival_date}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	                <fmt:formatDate var="arrival_date" pattern="yyyy-MM-dd" value="${arrival_date_time}"/>
	               	<fmt:formatDate var="arrival_time" pattern="HH:mm" value="${arrival_date_time}"/>
	                <th>출발날짜</th>
	                <td>
						<input type="date" name="departure_date" value="${departure_date}" required="required">
					</td>
	                <th>출발시간</th>
	                <td>
	                	<input type="time" name="departure_time" value="${departure_time}" required="required">
	                </td>
	            </tr>
	            <tr>
	                <th>도착날짜</th>
	                <td>
						<input type="date" name="arrival_date" value="${arrival_date}" required="required">
					</td>
	                <th>도착시간</th>
	                <td>
	                	<input type="time" name="arrival_time" value="${arrival_time}" required="required">
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
	                <td><input type="number" name="normal_price" value="${route.normal_price}" required="required"></td>
	                <th>프레스티지석</th>
	                <td><input type="number" name="prestige_price" value="${route.normal_price}" required="required"></td>
	                <th>일등석</th>
	                <td><input type="number" name="first_price" value="${route.normal_price}" required="required"></td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <div class="submit">
            <input type="submit" value="수정하기">
        </div>
	</form>
</section>
<!-- popup E -->  
<script>
	function updateFlight() {
	 	$.ajax({
		    type: 'POST',
		    url: 'flightUpdate',
		    data: $('.flight_update').serialize(),
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