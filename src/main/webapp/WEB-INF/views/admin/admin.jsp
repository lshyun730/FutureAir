<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<div class="contents contents_box">
    <div class="row">
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 매출액</h2>
                    <p class="income">${todayInfo.TODAY_INCOME / 10000} 만</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-coins"></i>
                </span>
            </div>
        </section>
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 예약수</h2>
                    <p class="income">${todayInfo.TODAY_RESERVATION }</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-wallet"></i>
                </span>
            </div>
        </section>
    
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 비행일정</h2>
                    <p class="income">${todayInfo.TODAY_FLIGHT }</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-tags"></i>
                </span>
            </div>
        </section>
    
        <section class="today_info">
            <div class="inner flex_space_between">
                <div class="today_info_txt">
                    <h2>오늘의 총 방문자</h2>
                    <p class="income">30,942</p>
                </div>
                <span class="today_info_icon">
                    <i class="fas fa-exchange-alt"></i>
                </span>
            </div>
        </section>
    </div>
    
    <div class="row">
        <section class="popular_flight">
                <div class="inner">
                <h2>인기 비행노선</h2>
                <ul>
                   	<c:forEach var="flight" items="${popularFlight}">
		        		<li>
			                <a href="#">
			                    <div class="popular_flight_img">
			                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
			                    </div>
			                    <div class="popular_flight_info">
			                        <p >${flight.DEPARTURE_NAME} - ${flight.ARRIVAL_NAME}</p>
			                        <div class="flex_space_between">
			                            <span>${flight.AIRPLANE_TYPE}</span><span>${flight.PRICE / 10000}만~</span>
			                        </div>
			                    </div>
			                </a>
			            </li>
		        	</c:forEach>
                </ul>
            </div>
        </section>
        <section class="graph_income width50">
            <div class="inner">
                <h2>기간 매출 그래프</h2>
                <div class="chartWrap">
                    <canvas id="incomeChart"></canvas>
                </div>
            </div>
        </section>
        <section class="graph_reservation">
            <div class="inner">
                <h2>예약 분석</h2>
                <div class="chartWrap">
                    <canvas id="reservationChart"></canvas>
                </div>
            </div>
        </section>
    </div>
    <div class="row">
        <section class="state_flight">
            <div class="inner">
                <h2>항공편 상황</h2>
                <div class="chartWrap">
                    <canvas id="flightChart"></canvas>
                </div>
            </div>
        </section>
        <section class="rate_reservation">
                <div class="inner">
                <h2>대륙별 점유율</h2>
                <ul>
                    <c:forEach var="continents" items="${rateContinents}">
			        	<li>
			                <div class="flex_space_between">
			                    <p>${continents.CONTINENTS}</p>
			                    <span>${continents.RATE}%</span>
			                </div>
			                <div class="progress">
			                    <div class="progress_bar" role="progressbar" aria-valuenow="${continents.RATE}" aria-valuemin="0" aria-valuemax="100" style="width:${continents.RATE}%"></div>
			                </div>
			            </li>
        			</c:forEach>
                </ul>
            </div>
        </section>
        <section class="recent_reservation width50">
            <div class="inner">
                <h2>최근 예약현황</h2>
                <table class="table">
                    <tr>
                        <th>예약번호</th>
                        <th>예약자</th>
                        <th>출발지</th>
                        <th>도착지</th>
                        <th>가격</th>
                    </tr>
                    <c:forEach var="recent" items="${recentReservation}">
			            <tr>
			                <td>${recent.RESERVATION_NUM}</td>
			                <td>${recent.CUSTOMER_NAME}</td>
			                <td>${recent.DEPARTURE_NAME}</td>
			                <td>${recent.ARRIVAL_NAME}</td>
			                <td>${recent.PAYMENT}</td>
			            </tr>
	            	</c:forEach>
                </table>
            </div>
        </section>
    </div>
</div>
<!-- content E --> 
<!-- footer S -->
<%@include file ="include/footer.jsp" %>
<!-- footer E --> 
