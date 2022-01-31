<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
<title>미래항공 관리자페이지</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script defer src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</head>
<body>

<section class="util">
		<div class="inner">
			<ul>
				<li><a href="${pageContext.request.contextPath}/login">로그인</a></li>
				<li><a href="#">이벤트</a></li>
				<li><a href="#">고객서비스</a></li>
				<li><a href="#">한국어</a></li>
			</ul>
		</div>
	</section>
	<!-- header S -->
	<header class="header">
		<div class="inner">
			<h1>
				<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="미래항공 로고"></a>
			</h1>
			<nav>
				<ul class="gnb">
					<li><a href="#">예매</a>
						<div class="gnb_cont">
							<div class="inner">
								<ul class="gnb_dep2">
									<li><a href="#">항공권예약</a>
										<ul class="gnb_dep3">
											<li><a href="#">항공권예약</a></li>
											<li><a href="#">예약안내</a></li>
										</ul></li>
									<li><a href="#">예매조회</a>
										<ul class="gnb_dep3">
											<li><a href="#">예약내역</a></li>
											<li><a href="#">변경 및 환불</a></li>
										</ul></li>
									<li><a href="#">운항정보</a>
										<ul class="gnb_dep3">
											<li><a href="#">스케줄조회</a></li>
											<li><a href="#">출도착조회</a></li>
										</ul></li>
									<li><a href="#">취향지정보</a></li>
									<li><a href="#">운항노선도</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">공항</a>
						<div class="gnb_cont">
							<div class="inner">
								<ul class="gnb_dep2">
									<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageInfo">수하물</a>
										<ul class="gnb_dep3">
											<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageInfo">수하물안내</a></li>
											<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageRestricted">운송 제한 물품</a></li>
											<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageCarryOn">휴대수하물</a></li>
											<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageChecked">위탁수하물</a></li>
										</ul></li>
									<li><a href="#">탑승절차</a>
										<ul class="gnb_dep3">
											<li><a href="#">탑승수속</a></li>
											<li><a href="#">탑승권 발급</a></li>
										</ul></li>
									<li><a href="#">체크인</a>
										<ul class="gnb_dep3">
											<li><a href="#">사전체크인</a></li>
											<li><a href="#">공항체크인</a></li>
										</ul></li>
									<li><a href="#">도움이 필요한 승객</a>
										<ul class="gnb_dep3">
											<li><a href="#">유아동반승객</a></li>
											<li><a href="#">몸이 불편한 승객</a></li>
											<li><a href="#">임신 중인 승객</a></li>
											<li><a href="#">반려동물 동반 승객</a></li>
										</ul></li>
									<li><a>사전좌석배정</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">기내</a>
						<div class="gnb_cont">
							<div class="inner">
								<ul class="gnb_dep2">
									<li><a href="#">클래스별 서비스</a>
										<ul class="gnb_dep3">
											<li><a href="${pageContext.request.contextPath}/plane/seatClass">일등석</a></li>
											<li><a href="${pageContext.request.contextPath}/plane/seatClass">비즈니스석</a></li>
											<li><a href="${pageContext.request.contextPath}/plane/seatClass">이코노미석</a></li>
										</ul></li>
									<li><a href="#">기내 서비스</a>
										<ul class="gnb_dep3">
											<li><a href="${pageContext.request.contextPath}/plane/service/flightMeals">기내식</a></li>
											<li><a href="#">기내 면세점</a></li>
											<li><a href="#">기내 특별 서비스</a></li>
										</ul></li>
									<li><a href="${pageContext.request.contextPath}/plane/aircraft">항공기 안내</a>
										<ul class="gnb_dep3">
											<li><a href="${pageContext.request.contextPath}/plane/aircraft">보잉 787</a></li>
											<li><a href="${pageContext.request.contextPath}/plane/aircraft">보잉 777</a></li>
											<li><a href="${pageContext.request.contextPath}/plane/aircraft">에어버스 A380</a></li>
											<li><a href="${pageContext.request.contextPath}/plane/aircraft">에어버스 A330</a></li>
										</ul></li>
									<li><a href="#">부가서비스</a>
										<ul class="gnb_dep3">
											<li><a href="#">레그룸 좌석</a></li>
											<li><a href="#">프론트존</a></li>
											<li><a href="#">기내 WIFI</a></li>
										</ul></li>
									<li><a href="#">사전좌석배정</a></li>
								</ul>
							</div>
						</div></li>
					<li><a href="#">서비스</a>
						<div class="gnb_cont">
							<div class="inner">
								<ul class="gnb_dep2">
									<li><a href="#">회원혜택</a>
										<ul class="gnb_dep3">
											<li><a href="#">회원안내</a></li>
											<li><a href="#">제휴사 할인</a></li>
										</ul></li>
									<li><a href="#">마일리지 적립</a>
										<ul class="gnb_dep3">
											<li><a href="#">마일리지 적립</a></li>
											<li><a href="#">마일리지 적립몰</a></li>
										</ul></li>
									<li><a href="#">마일리지 사용</a>
										<ul class="gnb_dep3">
											<li><a href="#">미래항공</a></li>
											<li><a href="#">마일리지 몰</a></li>
											<li><a href="#">제휴 항공사</a></li>
										</ul></li>
									<li><a href="#"><span style="display: block; width: 200px; height: 120px; background: #000;"></span></a></li>
								</ul>
							</div>
						</div></li>
				</ul>
			</nav>
			<div class="search">
				<a href="#"><i class="fas fa-search"></i></a>
			</div>
		</div>
	</header>
	<!-- header E -->