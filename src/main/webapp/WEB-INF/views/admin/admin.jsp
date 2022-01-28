<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="include/header.jsp" %>
<!-- header E -->

<!-- content S -->   
<section class="contents main_contents grid">
    
    <div class="today_info flex_space_between item">
        <div class="today_info_txt">
            <h2>오늘의 총 매출액</h2>
            <p class="income">10,034</p>
        </div>
        <span class="today_info_icon">
            <i class="fas fa-coins"></i>
        </span>
    </div>

    <div class="today_info flex_space_between item">
        <div class="today_info_txt">
            <h2>오늘의 총 예약수</h2>
            <p class="income">1,326</p>
        </div>
        <span class="today_info_icon">
            <i class="fas fa-wallet"></i>
        </span>
    </div>

    <div class="today_info flex_space_between item">
        <div class="today_info_txt">
            <h2>오늘의 비행일정</h2>
            <p class="income">32</p>
        </div>
        <span class="today_info_icon">
            <i class="fas fa-tags"></i>
        </span>
    </div>

    <div class="today_info flex_space_between item">
        <div class="today_info_txt">
            <h2>오늘의 총 방문자</h2>
            <p class="income">30,942</p>
        </div>
        <span class="today_info_icon">
            <i class="fas fa-exchange-alt"></i>
        </span>
    </div>

    <section class="popular_flight item">
        <h2>인기 비행노선</h2>
        <ul>
            <li>
                <a href="#">
                    <div class="popular_flight_img">
                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
                    </div>
                    <div class="popular_flight_info">
                        <p >김포 -  김해</p>
                        <div class="flex_space_between">
                            <span>국내선</span><span>233,000</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="popular_flight_img">
                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
                    </div>
                    <div class="popular_flight_info">
                        <p >김포 -  김해</p>
                        <div class="flex_space_between">
                            <span>국내선</span><span>233,000</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="popular_flight_img">
                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
                    </div>
                    <div class="popular_flight_info">
                        <p >김포 -  김해</p>
                        <div class="flex_space_between">
                            <span>국내선</span><span>233,000</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="popular_flight_img">
                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
                    </div>
                    <div class="popular_flight_info">
                        <p >김포 -  김해</p>
                        <div class="flex_space_between">
                            <span>국내선</span><span>233,000</span>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div class="popular_flight_img">
                        <img src="${pageContext.request.contextPath}/resources/images/img_admin_popular_flight.png" alt="인천공항로고">
                    </div>
                    <div class="popular_flight_info">
                        <p >김포 -  김해</p>
                        <div class="flex_space_between">
                            <span>국내선</span><span>233,000</span>
                        </div>
                    </div>
                </a>
            </li>
        </ul>
    </section>
    <section class="graph_income item">
        <h2>기간 매출 그래프</h2>
        js예정
    </section>
    <section class="graph_reservation item">
        <h2>예약 분석</h2>
        js예정
    </section>
    <section class="rate_reservation item">
        <h2>대륙별 점유율</h2>
        <ul>
            <li>
                <div class="flex_space_between">
                    <p>아시아</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
            <li>
                <div class="flex_space_between">
                    <p>아메리카</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
            <li>
                <div class="flex_space_between">
                    <p>유럽</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
            <li>
                <div class="flex_space_between">
                    <p>아프리카</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
            <li>
                <div class="flex_space_between">
                    <p>오세아니아</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
            <li>
                <div class="flex_space_between">
                    <p>그 외 지역</p>
                    <span>60%</span>
                </div>
                <div class="progress">
                    <div class="progress_bar" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                </div>
            </li>
        </ul>
    </section>
    <section class="state_flight item">
        <h2>항공편 상황</h2>
        js예정
    </section>

    <section class="recent_reservation item">
        <h2>최근 예약현황</h2>
        <table class="table">
            <tr>
                <th>예약번호</th>
                <th>예약자</th>
                <th>출발지</th>
                <th>도착지</th>
                <th>가격</th>
            </tr>
            <tr>
                <td>R10233</td>
                <td>김개똥</td>
                <td>인천</td>
                <td>베이징</td>
                <td>233,900</td>
            </tr>
            <tr>
                <td>R10233</td>
                <td>김개똥</td>
                <td>인천</td>
                <td>베이징</td>
                <td>233,900</td>
            </tr>
            <tr>
                <td>R10233</td>
                <td>김개똥</td>
                <td>인천</td>
                <td>베이징</td>
                <td>233,900</td>
            </tr>
            <tr>
                <td>R10233</td>
                <td>김개똥</td>
                <td>인천</td>
                <td>베이징</td>
                <td>233,900</td>
            </tr>
            <tr>
                <td>R10233</td>
                <td>김개똥</td>
                <td>인천</td>
                <td>베이징</td>
                <td>233,900</td>
            </tr>
        </table>
    </section>
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="include/footer.jsp" %>
<!-- footer E --> 
