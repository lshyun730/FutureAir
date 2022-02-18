<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
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
                    <div class="profile_img">
                        <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="proifle">
                    </div>
                    <p class="profile__info">홍길동<span>일반등급</span></p>
                </div>
            </header>
            <!-- customer header E --> 
        </div>
        <!-- customer contents S -->  
        <div class="customer_contents">
            <div class="inner">
                <!-- customer content S -->  
                <section class="customer_content">
                    <h2>예약내역상세</h2>
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>이름</th>
                                <th>여권번호</th>
                                <th>결제가격</th>
                                <th>여정안내서</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="schedule" items="${scheduleList }" varStatus="status">
	                            <tr>
	                                <td>${reservationNum }</td>
	                                <td>${schedule.passenger_name }</td>
	                                <td>${schedule.passport_num }</td>
	                                <td>
	                                	<c:choose>
	                                		<c:when test="${schedule.passenger_name eq name && status.index eq '0' }">
	                                			<fmt:formatNumber value="${payment }" pattern="#,###" />원
	                                		</c:when>
	                                		<c:otherwise>-</c:otherwise>
	                                	</c:choose>
	                                </td>
	                                <td>
	                                    <button class="btn_s more"><span>출력</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
	                                    <button class="btn_s more"><span>PDF</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
	                                    <button class="btn_s more"><span>이메일</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
	                                </td>
	                            </tr>
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
                        <col width="38%">
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

                            <c:forEach var="router" items="${getRoute }" varStatus="status">
	                            <tr>
	                                <td>
	                                	<fmt:parseDate value="${router.departure_date }" var="d_date" pattern="yyyy-mm-dd HH:mm"/>
	                                	<fmt:formatDate value="${d_date }" pattern="yyyy-MM-dd"/>
	                                </td>
	                                <td class="flight_info">
	                                    <div class="from">${router.departure_name }
	                                    	<span>
												<fmt:parseDate value="${router.departure_date }" var="d_time" pattern="yyyy-mm-dd HH:mm"/>
                            					<fmt:formatDate value="${d_time }" pattern="HH:mm"/>
	                                    	</span>
	                                    </div>
	                                    <div class="to">${router.arrival_name }
	                                    	<span>
	                                    		<fmt:parseDate value="${router.arrival_date }" var="a_time" pattern="yyyy-mm-dd HH:mm"/>
                            					<fmt:formatDate value="${a_time }" pattern="HH:mm"/>
	                                    	</span>
	                                    </div>
	                                    <div class="direction"></div>
	                                </td>
	                                <td>${router.airplane_id }</td>
	                                <td>${router.airplane.airplane_model }</td>
	                                	<td>
	                                		<c:forEach var="schedule" items="${scheduleList }" varStatus="status">
		                                		<c:if test="${schedule.route_num eq router.route_num }">
		                                			${schedule.seat_class }<br>
		                                		</c:if>
	                                		</c:forEach>
	                                	</td>
	                            </tr>
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