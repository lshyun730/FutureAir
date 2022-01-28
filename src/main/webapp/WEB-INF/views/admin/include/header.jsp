<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <title>미래항공 관리자페이지</title>
</head>
<body>
<!-- header S -->  
<header class="header">
    <h1 class="logo"><a href="./admin"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="FUTURE AIR"></a></h1>
    <nav class="gnb">
        <ul>
            <span class="gnb_txt">GENERAL</span>
            <li class="active">
                <a href="./admin">홈
                    <span class="icon"><i class="fas fa-home"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">FLIGHT</span>
            <li>
                <a href="admin/flight/flightList">비행일정
                    <span class="icon"><i class="fas fa-plane"></i></span>
                </a>
            </li>
            <li>
                <a href="admin/flight/reservationList">예약현황
                    <span class="icon"><i class="fas fa-clipboard-list"></i></span>
                </a>
            </li>
            
            <span class="gnb_txt">CUSTOMER</span>
            <li>
                <a href="admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li>
                <a href="admin/customer/customerGrade">회원등급
                    <span class="icon"><i class="fas fa-arrow-circle-up"></i></span>
                </a>
            </li>
            <li>
                <a href="admin/customer/sendMail">메일발송
                    <span class="icon"><i class="fas fa-envelope"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">BOARD</span>
            <li>
                <a href="admin/board/boardManager">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li>
                <a href="admin/board/boardSetting">게시판설정
                    <span class="icon"><i class="fas fa-cog"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- header E -->  
<!-- util S -->  
<section class="util grid">
    <form action="#" class="search item">
        <span class="search_icon"><i class="fas fa-search"></i></span>
        <input type="text" name="search" placeholder="검색어 입력">
    </form>
    
    <section class="info item">
        <div class="bell">
            <span class="bell_icon"><i class="far fa-bell"></i></span>
        </div>
        <div class="profile">
            <div class="profile_img">
                <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="profile">
            </div>
            <p>홍길동<span>마스터관리자</span></p>
            <div class="btn_m"><span></span></div>
        </div>
    </section>
</section>
<!-- util E -->  