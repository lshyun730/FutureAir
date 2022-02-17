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
                    <h2>전체 예약내역</h2>
                    <!-- search detail S -->
                    <form action="customerReservation" class="search_detail active" id="serch_detail">
                        <div class="inputbox term icon">
                            <p class="inputbox_title">예약일</p>
                            <div class="inputbox_input">
                                <input type="date" id="reservation_start" name="reservation_start" placeholder="2022-01-22">
                                <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="inputbox icon">
                            <div class="inputbox_input">
                                <input type="date" id="reservation_end" name="reservation_end" placeholder="2022-01-22">
                                <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="inputbox submit">
                            <div class="inputbox_input">
                                <input type="submit" value="검색">
                            </div>
                        </div>
                    </form>
                    <!-- search detail E -->
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>예약일</th>
                                <th>예약번호</th>
                                <th>승객</th>
                                <th>출발지</th>
                                <th>도착지</th>
                                <th>출발일</th>
                                <th>결제가격</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="rList" items="${reservationList }" varStatus="status">
	                            <tr>
	                                <td>${rList['RESERVATION_DATE'] }</td>
	                                <td>
	                                	<a href="${pageContext.request.contextPath}/admin/customer/customerReservationDetail?id=${rList['CUSTOMER_ID'] }&reservationNum=${rList['RESERVATION_NUM'] }">
	                                		${rList['RESERVATION_NUM'] }
	                                	</a>
	                                </td>
	                                <td>${rList['PASSENGER_NAME'] }</td>
	                                <td>${rList['DEPARTURE_NAME'] }</td>
	                                <td>${rList['ARRIVAL_NAME'] }</td>
	                                <td>${rList['DEPARTURE_DATE'] }</td>
	                                <td><fmt:formatNumber value="${rList['PAYMENT'] }" pattern="#,###" />원</td>
	                            </tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <!-- table E -->
		    </div> 
                </section>
                <!-- customer content E -->  
            </div>
        </div>
        <!-- customer contents  E -->  
    </div>
    <!-- customer detail  E -->  
</body>
</html>