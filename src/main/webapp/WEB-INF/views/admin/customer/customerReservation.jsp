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
                    <h2>전체 예약내역</h2>
                    <!-- search detail S -->
                    <form action="customerReservation" class="search_detail active" id="serch_detail">
                        <div class="inputbox term">
                            <p class="inputbox_title">예약일</p>
                            <div class="inputbox_input">
                                <input type="text" id="reservation_start" name="reservation_start" placeholder="2022-01-22">
                                <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="inputbox">
                            <div class="inputbox_input">
                                <input type="text" id="reservation_end" name="reservation_end" placeholder="2022-01-22">
                                <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="inputbox submit">
                            <div class="inputbox_input">
                                <input type="submit" value="검색">
                            </div>
                        </div>
                        <input type="hidden" id="id" name="id" value="${id }">
                    </form>
                    <!-- search detail E -->
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th><input type="checkbox"></th>
                                <th>예약번호</th>
                                <th>승객</th>
                                <th>출발지</th>
                                <th>도착지</th>
                                <th>출발일</th>
                                <th>예약일</th>
                                <th>결제가격</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="rList" items="${reservationList }" varStatus="status">
	                            <tr>
	                                <td><input type="checkbox"></td>
	                                <td>
	                                	<a href="${pageContext.request.contextPath}/admin/customer/customerReservationDetail?id=${rList['CUSTOMER_ID'] }&reservationNum=${rList['RESERVATION_NUM'] }">
	                                		${rList['RESERVATION_NUM'] }
	                                	</a>
	                                </td>
	                                <td>${rList['PASSENGER_NAME'] }</td>
	                                <td>${rList['DEPARTURE_NAME'] }</td>
	                                <td>${rList['ARRIVAL_NAME'] }</td>
	                                <td>${rList['RESERVATION_DATE'] }</td>
	                                <td>${rList['DEPARTURE_DATE'] }</td>
	                                <td><fmt:formatNumber value="${rList['PAYMENT'] }" pattern="#,###" />원</td>
	                            </tr>
							</c:forEach>
                        </tbody>
                    </table>
                    <!-- table E --> 
                        <!-- content footer S --> 
        <div class="flex_content_footer">
            <div class="navi">
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
               	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}"> class="active"</c:if>>${counter}</a>
				</c:forEach>
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
           </div>
        </div>
	<!-- content footer E --> 
                </section>
                <!-- customer content E -->  
            </div>
        </div>
        <!-- customer contents  E -->  
    </div>
    <!-- customer detail  E -->  

</body>
</html>