<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

vv<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="../../../css/admin.css">
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
                        <li class="active"><a href="customerReservation.html">예약내역</a></li>
                        <li><a href="customerMileage.html">마일리지</a></li>
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
                    <h2>전체 예약내역</h2>
                    <!-- search detail S -->
                    <form action="#" class="search_detail">
                        <div class="inputbox term">
                            <p class="inputbox_title">예약일</p>
                            <div class="inputbox_input">
                                <input type="text" placeholder="2022-01-22">
                                <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                            </div>
                        </div>
                        <div class="inputbox">
                            <div class="inputbox_input">
                                <input type="text" placeholder="2022-01-22">
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
                            <tr>
                                <td><input type="checkbox"></td>
                                <td><a href="#">R10001</a></td>
                                <td><a href="customerInfo.html">홍길동</a></td>
                                <td>부산</td>
                                <td>인천</td>
                                <td>2022-03-01</td>
                                <td>2022-03-01</td>
                                <td>431,000 원</td>
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