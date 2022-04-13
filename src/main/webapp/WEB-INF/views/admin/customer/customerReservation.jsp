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
                    <h2>전체 예약내역</h2>
                    <!-- search detail S -->
                    <form action="customerReservation" class="search_detail active" id="search_detail">
                        <div class="inputbox term">
                            <p class="inputbox_title">예약일</p>
                            <div class="inputbox_input">
                                <input type="date" id="reservation_start" name="reservation_start" value="${reservation_start}">
                            </div>
                        </div>
                        <div class="inputbox">
                            <div class="inputbox_input">
                                <input type="date" id="reservation_end" name="reservation_end"  value="${reservation_end}">
                            </div>
                        </div>
                        <div class="inputbox submit">
                            <div class="inputbox_input">
                                <input type="submit" value="검색">
                            </div>
                        </div>
                        <input type="hidden" id="id" name="id" value="${id}">
                        <input type="hidden" name="page" id="page">
                    </form>
                    <!-- search detail E -->
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>예약번호</th>
                                <th>승객</th>
                                <th>출발일</th>
                                <th>결제가격</th>
                                <th>예약일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:if test="${empty reservationList}">
			            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
			            	</c:if>
                        	<c:forEach var="reservation" items="${reservationList}" varStatus="status">
	                            <tr>
	                                <td>
	                                	<a href="${pageContext.request.contextPath}/admin/customer/customerReservationDetail?id=${id}&reservation_num=${reservation.RESERVATION_NUM }">
	                                		${reservation.RESERVATION_NUM }
	                                	</a>
	                                </td>
	                                <td>${reservation.PASSENGER_NAME }</td>
	                                <td>${reservation.DEPARTURE_DATE }</td>
	                                <td><fmt:formatNumber value="${reservation.PAYMENT }" pattern="#,###" />원</td>
	                                <td>${reservation.RESERVATION_DATE}</td>
	                                <td>
                                	<c:if test="${reservation.RESERVATION_STATE eq '예약완료'}">
					                    <button class="btn_s status">예약</button>
			                    	</c:if>
			                    	<c:if test="${reservation.RESERVATION_STATE eq '예약취소'}">
					                    <button class="btn_s status status_cancle">취소</button>
			                    	</c:if>
			                    	</td>
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