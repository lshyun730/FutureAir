<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                            <tr>
                                <td><a href="#">R10001</a></td>
                                <td>홍길동</td>
                                <td>M12345678</td>
                                <td>50,000원</td>
                                <td>
                                    <button class="btn_s more"><span>출력</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                                    <button class="btn_s more"><span>PDF</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                                    <button class="btn_s more"><span>이메일</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                                </td>
                            </tr>
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
                                <th>편명/기종</th>
                                <th>기종</th>
                                <th>클래스</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2022-03-01</td>
                                <td class="flight_info">
                                    <div class="from">부산/김해<span>08:50</span></div>
                                    <div class="to">서울/김포<span>09:50</span></div>
                                    <div class="direction"></div>
                                </td>
                                <td>F01032</td>
                                <td>A330</td>
                                <td>이코노미</td>
                            </tr>
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