<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
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
                        <li><a href="${pageContext.request.contextPath}/admin/customer/customerReservation?id=${id}">예약내역</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/admin/customer/customerMileage?id=${id}">마일리지</a></li>
                    </ul>
                </nav>
                <div class="profile">
                    <div class="profile_img">
                        <img src="../../../images/profile.jpg" alt="proifle">
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
                    <h2>마일리지 정보</h2>
                    <!-- table S --> 
                    <table class="table">
                        <colgroup>
                            <col style="width:20%;">
                            <col style="width:30%;">
                            <col style="width:20%;">
                            <col style="width:30%;">
                        </colgroup>
                        <tr>
                            <th>총 마일리지</th>
                            <td><fmt:formatNumber value="${mileageAll }" pattern="#,###" /></td>
                            <th>사용된 마일리지</th>
                            <td><fmt:formatNumber value="${mileageUsed }" pattern="#,###" /></td>
                        </tr>
                        <tr>
                            <th>사용가능 마일리지</th>
                            <td><fmt:formatNumber value="${mileageUsable }" pattern="#,###" /></td>
                            <th>미가용 마일리지</th>
                            <td><fmt:formatNumber value="${mileageFUsable }" pattern="#,###" /></td>
                        </tr>
                    </table>
                    <!-- table E --> 
                </section>
                <!-- customer content E -->  
                <!-- customer content S -->  
                <section class="customer_content">
                    <h2>마일리지 적립내역</h2>
                    <!-- table S --> 
                    <table class="table">
                        <thead>
                            <tr>
                                <th>적립일</th>
                                <th>상세내용</th>
                                <th>유형</th>
                                <th>예약번호</th>
                                <th>증감/차감</th>
                                <th>잔액</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="mMap" items="${mileageBalance }" varStatus="status">
		                           <tr>
		                           		<td><c:out value="${mMap['MILEAGE_DATE'] }" /></td>
		                           		<td><c:out value="${mMap['MILEAGE_TYPE'] }" /></td>
		                           		<td><c:out value="${mMap['MILEAGE_TYPE'] }" /></td>
		                           		<td>
		                           			<c:if test="${mMap['MILEAGE_RESERVATION'] eq '-'}">-</c:if>
		                           			<c:if test="${mMap['MILEAGE_RESERVATION'] ne '-'}">
		                           				<a href="#"><c:out value="${mMap['MILEAGE_RESERVATION'] }" /></a>	
		                           			</c:if>
		                           		</td>
		                           		<td><fmt:formatNumber value="${mMap['MILEAGE_POINT'] }" pattern="#,###" /></td>
		                           		<td><fmt:formatNumber value="${mMap['MILEAGE_BALANCE'] }" pattern="#,###" /></td>
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