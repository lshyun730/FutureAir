<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <title>미래항공 관리자페이지</title>
</head>
<body>
    <!-- customer detail  S -->  
    <div class="customer_detail">
        <div class="inner">
            <!-- customer header  S -->  
            <header class="customer_header">
                <nav class="lnb">
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/admin/customer/customerInfo?id=${id}">회원정보</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/admin/customer/customerReservation?id=${id}">예약내역</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/customer/customerMileage?id=${id}">마일리지</a></li>
                    </ul>
                </nav>
                <div class="profile">
                    <p class="profile__info">${customer.customer_name }<span>${customer.customer_grade }등급</span></p>
                </div>
            </header>
            <!-- customer header E --> 
        </div>
        <!-- customer contents S -->  
        <div class="customer_contents">
            <div class="inner">
            <!-- customer content S -->  
                <section class="customer_content">
                    <h2>예약내역</h2>
                    <!-- table S --> 
                    <table class="table">
                    	<colgroup>
                    		<col width="20%">
                    		<col width="30%">
                    		<col width="20%">
                    		<col width="30%">
                    	</colgroup>
                    	<fmt:parseDate value="${scheduleList[0].DEPARTURE_DATE}" var="date" pattern="yyyy-mm-dd"/>
                        <tr>
                             <th>예약번호</th>
                             <td>${scheduleList[0].RESERVATION_NUM }</td>
                             <th>예약날짜</th>
                             <td><fmt:formatDate value="${date}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </table>
                    <!-- table E --> 
                </section>
                <!-- customer content E -->  
                <!-- customer content S -->  
                <section class="customer_content">
                    <h2>예약내역상세</h2>
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th>여권번호</th>
                                <th>분류</th>
                                <th>성별</th>
                                <th>여정안내서</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="schedule" items="${scheduleList}" varStatus="status">
                        		<c:if test="${schedule.TYPE eq '여정1' }">
		                            <tr>
		                                <td>${schedule.PASSENGER_NAME }</td>
		                                <td>${schedule.PASSPORT_NUM }</td>
		                                <td>${schedule.CUSTOMER_TYPE }</td>
		                                <td>${schedule.PASSENGER_GENDER}</td>
		                                <td>
		                                    <button class="btn_s more"><span>출력</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                                    <button class="btn_s more"><span>PDF</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                                    <button class="btn_s more"><span>이메일</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                                </td>
		                            </tr>
                        		</c:if>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- table E --> 
                </section>
                <!-- customer content E -->  
                <!-- customer content S -->  
                <section class="customer_content">
                    <h2>여정</h2>
                    <!-- table S --> 
                    <table class="table">
                        <colgroup>
                        <col width="15%">
                        <col width="40%">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>여정</th>
                                <th>출도착시간</th>
                                <th>편명</th>
                                <th>기종</th>
                                <th>클래스</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="schedule" items="${scheduleList }" varStatus="status">
                            	<c:if test="${schedule.ID eq id}">
		                            <tr>
		                                <td>
		                                	<fmt:parseDate value="${schedule.DEPARTURE_DATE}" var="d_date" pattern="yyyy-mm-dd HH:mm"/>
		                                	<fmt:formatDate value="${d_date}" pattern="yyyy-MM-dd"/>
		                                	<p>${schedule.TYPE }</p>
		                                </td>
		                                <td class="flight_info">
		                                    <div class="from">${schedule.DEPARTURE_NAME }
		                                    	<span>
	                            					<fmt:formatDate value="${d_date }" pattern="HH:mm"/>
		                                    	</span>
		                                    </div>
		                                    <div class="to">${schedule.ARRIVAL_NAME }
		                                    	<span>
		                                    		<fmt:parseDate value="${schedule.ARRIVAL_DATE }" var="a_time" pattern="yyyy-mm-dd HH:mm"/>
	                            					<fmt:formatDate value="${a_time }" pattern="HH:mm"/>
		                                    	</span>
		                                    </div>
		                                    <div class="direction"></div>
		                                </td>
		                                <td><a href="javascript:popupOpen('${pageContext.request.contextPath}/admin/flight/flightView?route_num=${schedule.ROUTE_NUM}', 1000, 800)">${schedule.ROUTE_NUM }</a></td>
		                                <td>${schedule.AIRPLANE_MODEL }</td>
	                                	<td>${schedule.SEAT_CLASS }</td>
		                            </tr>
	                            </c:if>
							</c:forEach>
                        </tbody>
                    </table>
                    <!-- table E --> 
                </section>
                <!-- customer content E -->  
            </div>
        </div>
        <!-- customer contents  E -->  
    </div>
    <!-- customer detail  E -->  
</body>
</html>