<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="resources/css/admin.css">
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
                        <li><a href="customerInfo.html">회원정보</a></li>
                        <li><a href="customerReservation.html">예약내역</a></li>
                        <li class="active"><a href="customerMileage.html">마일리지</a></li>
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
                            <td>10,000</td>
                            <th>사용된 마일리지</th>
                            <td>0</td>
                        </tr>
                        <tr>
                            <th>사용가능 마일리지</th>
                            <td>10,000</td>
                            <th>미가용 마일리지</th>
                            <td>10,000</td>
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
                                <th>차감</th>
                                <th>잔액</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>2022-03-01</td>
                                <td>항공권 예약</td>
                                <td>결제적립</td>
                                <td><a href="#">R001</a></td>
                                <td>10,000</td>
                                <td>10,000</td>
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