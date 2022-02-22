<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <title>미래항공 관리자페이지</title>
</head>
<body>
<!-- header S -->  
<header class="header">
    <h1 class="logo"><a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="FUTURE AIR"></a></h1>
    <nav class="gnb">
        <ul>
            <span class="gnb_txt">GENERAL</span>
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin">홈
                    <span class="icon"><i class="fas fa-home"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">FLIGHT</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/flightList">비행일정
                    <span class="icon"><i class="fas fa-plane"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/reservationList">예약현황
                    <span class="icon"><i class="fas fa-clipboard-list"></i></span>
                </a>
            </li>
            
            <span class="gnb_txt">CUSTOMER</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerGrade">회원등급
                    <span class="icon"><i class="fas fa-arrow-circle-up"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/sendMail">메일발송
                    <span class="icon"><i class="fas fa-envelope"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">BOARD</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/postList">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/boardList">게시판설정
                    <span class="icon"><i class="fas fa-cog"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- header E -->  
<!-- util S -->  
<div class="util contents">
    <div class="row">
        <div class="search_box">
            <form action="#" class="search item">
                <span class="search_icon"><i class="fas fa-search"></i></span>
                <input type="search_text" name="search" placeholder="Search for...">
            </form>
        </div>
        
        <div class="info">
            <button class="bell" onclick="location.href='${pageContext.request.contextPath}/'"></button>
            <div class="profile">
                <div class="profile_img">
                    <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="profile">
                </div>
                <p>홍길동<span>마스터관리자</span></p>
                <div class="btn_m"><span></span></div>
            </div>
        </div>
    </div>
</div>
<!-- util E -->  