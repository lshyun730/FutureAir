<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- breadcrumbs S --> 
<div class="breadcrumbs inner">
	<ul>
		<li><i class="fas fa-home"></i></li>
		<li>예매</li>
		<li>항공권 예약</li>
		<li><a href="#">항공권 예약</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- book flight S -->
<section class="inner content">
    <h2>항공권 예약</h2>
    <ul class="selectList">
        <li class="active"><a href="#">왕복</a></li>
        <li><a href="#">편도</a></li>
        <li><a href="#">다구간</a></li>
    </ul>
    <form action="" method="post" class="bookFlightForm">
        <div class="row">
            <div>
                <p class="title">출발지</p>
                <select name="departure">
                    <option value="김포">김포</option>
                </select>
            </div>
            <div>
                <p class="title">도착지</p>
                <select name="arrival">
                    <option value="김포">김포</option>
                </select>
            </div>
            <div class="flight_date">
                <p class="title">탑승일</p>
                <input type="date" name="departure_date">
            </div>
        </div>
        <div class="row">
            <div>
                <p class="title">성인</p>
                <select name="seat_adult">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="1">4</option>
                    <option value="2">5</option>
                </select>
            </div>
            <div>
                <p class="title">소아</p>
                <select name="seat_childAge">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="1">4</option>
                    <option value="2">5</option>
                </select>
            </div>
            <div>
                <p class="title">유아</p>
                <select name="seat_infantAge">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="1">4</option>
                    <option value="2">5</option>
                </select>
            </div>
        </div>
        <div class="submit">
            <input type="submit" value="검색">
        </div>
    </form>

    <div class="trip">
        <h3>가는 편 <span>PUS 부산 - SEL 서울</span></h3>
        <ul class="weekList">
            <li class="navigation prev"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li class="active"><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li class="navigation next"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
        </ul>
        <ul class="flight_list">
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li class="active"><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
        </ul>
    </div>
    
    <div class="trip">
        <h3>오는 편 <span>PUS 부산 - SEL 서울</span></h3>
        <ul class="weekList">
            <li class="navigation prev"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li class="active"><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li><a href="#">02/01 (화) <span>22,600</span></a></li>
            <li class="navigation next"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
        </ul>
        <ul class="flight_list">
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li class="active"><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
            <li>
                <div class="flight_info">
                    <div class="from">부산/김해<span>08:50</span></div>
                    <div class="to">서울/김포<span>09:50</span></div>
                    <div class="direction"></div>
                </div>
                <div class="flight_time">1시간 10분</div>
                <ul class="flight_contents">
                    <li><a href="#">이코노미석 <span>33,600원</span></a></li>
                    <li><a href="#">비즈니스석 <span>33,600원</span></a></li>
                    <li><a href="#">일등석 <span>33,600원</span></a></li>
                </ul>
            </li>
        </ul>
    </div>

    <div class="flight_payment_wrap">
        <div class="flight_payment">
            <p>총 결제금액</p>
            <p class="price">67,200원</p>
        </div>
        <button class="btn_primary" onclick="location='${pageContext.request.contextPath}/book/passengerInfo'">다음</button>
    </div>
</section>
<!-- book flight E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 