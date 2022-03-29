<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- header S -->    
<%@include file ="include/header.jsp" %>
<!-- header E -->
<!-- main visual S -->  
<section class="main_visual">
    <div class="swiper main_slider">
        <div class="swiper-wrapper">
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/resources/images/main/main_visual1.png" alt="메인이미지1">
                <div class="inner">
                    <p class="main_title">2022년 새해에도<br>미래항공과 함께하세요</p>
                    <a href="#" class="main_more">자세히보기</a>
                </div>
            </div>
            <div class="swiper-slide">
                <img src="${pageContext.request.contextPath}/resources/images/main/main_visual1.png" alt="메인이미지1">
                <div class="inner">
                    <p class="main_title">2022년 새해에도<br>미래항공과 함께하세요</p>
                    <a href="#" class="main_more">자세히보기</a>
                </div>
            </div>
        </div>
        <div class="controller">
            <div class="inner">
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <form action="book/flightBook" method="post" class="quick_reservation">
        <div class="inner">
            <div class="trip_type">
                <p class="title">여행타입</p>
                <label><input type="radio" name="trip_type" value="왕복" checked="checked">왕복</label>
                <label><input type="radio" name="trip_type" value="편도">편도</label>
                <label><input type="radio" name="trip_type" value="다구간" disabled>다구간</label>
            </div>
            <div>
                <p class="title">출발지</p>
                <select name="departure_name">
                <option value="" disabled selected>도시 혹은 공항</option>
                    <c:forEach var="continent" items="${destinationList}">
             			<optgroup label="${continent[0].continents}">
             				<c:forEach var="destination" items="${continent}">
				        		<option value="${destination.airport_name}">${destination.airport_name} / ${destination.airport_id}</option>
             				</c:forEach>
            			</optgroup>
		        	</c:forEach>
                </select>
            </div>
            <div>
                <p class="title">도착지</p>
                <select name="arrival_name">
               		<option value="" disabled selected>도시 혹은 공항</option>
                    <c:forEach var="continent" items="${destinationList}">
             			<optgroup label="${continent[0].continents}">
             				<c:forEach var="destination" items="${continent}">
				        		<option value="${destination.airport_name}">${destination.airport_name} / ${destination.airport_id}</option>
             				</c:forEach>
            			</optgroup>
		        	</c:forEach>
                </select>
            </div>
             <div class="flight_date">
                <p class="title">출발일</p>
                <input type="text" name="pick_date_list" id="dateRange">
            </div>
            <div>
                <p class="title">성인</p>
                <select name="seat_adult">
                    <c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_adult}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
            <div>
                <p class="title">소아</p>
                <select name="seat_childAge">
                    <c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_adult}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
            <div>
                <p class="title">유아</p>
                <select name="seat_infantAge">
                    <c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_adult}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
            <!-- <input type="hidden" name="pick_date_list" id="pick_date_list" value=""/> -->
            <div class="submit">
                <input type="submit">
            </div>
        </div>
    </form>
</section>
<!-- main visual E -->
<!-- popular flight S -->
<section class="popular_flight main_content">
    <div class="inner">
        <h2>인기 항공권</h2>
        <div class="swiper popular_slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/main/main_popular1.png" alt="main_popular1">
                    <div class="desc">
                        <p class="location">인천 - 이탈리아</p>
                        <p class="seat">일반석 왕복</p>
                        <p class="price">KRW 1,865,000 ~</p>
                    </div>
                </div>   
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/main/main_popular2.png" alt="main_popular1">
                    <div class="desc">
                        <p class="location">인천 - 이탈리아</p>
                        <p class="seat">일반석 왕복</p>
                        <p class="price">KRW 1,865,000 ~</p>
                    </div>
                </div>          
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/main/main_popular3.png" alt="main_popular1">
                    <div class="desc">
                        <p class="location">인천 - 이탈리아</p>
                        <p class="seat">일반석 왕복</p>
                        <p class="price">KRW 1,865,000 ~</p>
                    </div>
                </div> 
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/main/main_popular4.png" alt="main_popular1">
                    <div class="desc">
                        <p class="location">인천 - 이탈리아</p>
                        <p class="seat">일반석 왕복</p>
                        <p class="price">KRW 1,865,000 ~</p>
                    </div>
                </div> 
                <div class="swiper-slide">
                    <img src="${pageContext.request.contextPath}/resources/images/main/main_popular1.png" alt="main_popular1">
                    <div class="desc">
                        <p class="location">인천 - 이탈리아</p>
                        <p class="seat">일반석 왕복</p>
                        <p class="price">KRW 1,865,000 ~</p>
                    </div>
                </div> 
            </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
</section>
<!-- popular flight E -->
<!-- covid S -->
<section class="covid main_content">
    <div class="inner">
        <a href="#" class="covid_center">
            <p>코로나 19 종합안내 센터</p>
            <span>항공권 정보, 항공편 운항 등 코로나19와 관련된 최신 정보를 확인하실 수 있습니다.</span>
        </a>
    </div>
</section>
<!-- covid E -->
<!-- service S -->
<section class="service">
    <div class="inner">
        <h2>제휴서비스</h2>
        <ul class="service_list">
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>호텔</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>렌터카</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>마일리지</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>여행자보험</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>면세점</p>
                </a>
            </li>
            <li>
                <a href="#">
                    <span class="icon"><i class="fas fa-hotel"></i></span>
                    <p>엑티비티</p>
                </a>
            </li>
        </ul>
    </div>
</section>
<!-- service E -->
<<script type="text/javascript">

const startDate = new Date();
/* startDate.setDate(startDate.getDate()); */

$('#dateRange').daterangepicker({
	locale: {
	    "separator": " ~ ",                    
	    "format": 'YYYY-MM-DD',     
	    "applyLabel": "확인",                    
	    "cancelLabel": "취소",                 
	    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
	    },
	minDate: startDate
});

</script>
<!-- footer S -->
<%@include file ="include/footer.jsp" %>
<!-- footer E --> 