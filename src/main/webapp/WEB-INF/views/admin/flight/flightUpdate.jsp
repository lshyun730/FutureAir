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
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>비행일정수정</h2>
        <form class="flight_update">
            <div class="inputbox">
                <p class="inputbox_title">비행번호</p>
                <div class="inputbox_input">
                    <input type="text" name="route_num" value="${route.route_num}" disabled="disabled">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">비행기ID</p>
                <div class="inputbox_input">
                    <input type="text" name="airplane_id">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착지</p>
                <div class="inputbox_input selectbox">
                     <select name="departure_name">
                     	<c:forEach var="continent" items="${destinationList}">
               				<optgroup label="${continent[0].continents}">
               				<c:forEach var="destination" items="${continent}">
						        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq route.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
               				</c:forEach>
               				</optgroup>
				        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발지</p>
                <div class="inputbox_input selectbox">
                    <select name="arrival_name">
                    	<c:forEach var="continent" items="${destinationList}">
               				<optgroup label="${continent[0].continents}">
               				<c:forEach var="destination" items="${continent}">
						        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq route.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
               				</c:forEach>
               				</optgroup>
				        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발날짜 및 시간</p>
                <div class="inputbox_input">
                	<fmt:parseDate value="${route.departure_date}" var="departure_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
                    <input type="datetime-local" name="departure_date" value="${departure_date}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착날짜 및 시간</p>
                <div class="inputbox_input">
                    <input type="datetime-local" name="arrival_date">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">비행시간</p>
                <div class="inputbox_input">
                    <input type="text" name="eta" value="${route.eta}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">이코노미 가격</p>
                <div class="inputbox_input">
                    <input type="text" name="normal_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">프레스티지 가격</p>
                <div class="inputbox_input">
                    <input type="text" name="prestige_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">일등석 가격</p>
                <div class="inputbox_input">
                    <input type="text" name="first_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="submit">
                <input type="submit" value="수정하기" onclick="">
            </div>
        </form>
</section>
<!-- popup E -->  
</body>
</html>