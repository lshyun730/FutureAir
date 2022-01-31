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
		<li>기내</li>
		<li>항공기 안내</li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- aircraft S --> 
<section class="aircraft inner content">
    <div>
        <h2>항공기 안내</h2>
        <p>비교할 수 없이 쾌적하고 다양한 즐거움이 가득한 미래항공의 클래스별 서비스를 알아보세요</p>
    </div>
    <div class="title_box_img">
        <img src="${pageContext.request.contextPath}/resources/images/sub/img_aircraft.png" alt="비행기이미지">
    </div>
    <div>
        <h3>보잉</h3>
        <ul class="aircraft_list">
            <li>
                <div class="img">
                    <img src="${pageContext.request.contextPath}/resources/images/sub/img_aircraft_boeing1.png" alt="보잉비행기이미지">
                </div>
                <div class="desc">
                    <p class="title">보잉 787</p>
                    <p class="text">혁신 기술을 사용한 탄소섬유로 제공되는 쾌적한 환경</p>
                    <ul class="info">
                        <li>속도 - 912Km/h </li>
                        <li>운항 거리 - 12,592km </li>
                        <li>길이 - 62.80m</li>
                        <li>높이 - 17.00m</li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="img">
                    <img src="${pageContext.request.contextPath}/resources/images/sub/img_aircraft_boeing1.png" alt="보잉비행기이미지">
                </div>
                <div class="desc">
                    <p class="title">보잉 777</p>
                    <p class="text">첨단 엔진 및 기체역학적 기술이 접목된 긴 항속거리 여객선</p>
                    <ul class="info">
                        <li>속도 - 901Km/h</li>
                        <li>운항 거리 - 13,033km</li>
                        <li>길이 - 63.73m</li>
                        <li>높이 - 18.76m</li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    <div>
        <h3>보잉</h3>
        <ul class="aircraft_list">
            <li>
                <div class="img">
                    <img src="${pageContext.request.contextPath}/resources/images/sub/img_aircraft_boeing1.png" alt="보잉비행기이미지">
                </div>
                <div class="desc">
                    <p class="title">에어버스 A380</p>
                    <p class="text">독립된 퍼스트 클래스, 비즈니스 클래스를 통한 격조 높은 서비스</p>
                    <ul class="info">
                        <li>속도 - 912Km/h</li>
                        <li>운항 거리 - 13,473km</li>
                        <li>길이 - 72.72m</li>
                        <li>높이 - 24.09m</li>
                    </ul>
                </div>
            </li>
            <li>
                <div class="img">
                    <img src="${pageContext.request.contextPath}/resources/images/sub/img_aircraft_boeing1.png" alt="보잉비행기이미지">
                </div>
                <div class="desc">
                    <p class="title">에어버스 A330</p>
                    <p class="text">첨단 엔진 및 기체역학적 기술이 접목된 긴 항속거리 여객선</p>
                    <ul class="info">
                        <li>속도 - 876km/h</li>
                        <li>운항 거리 - 9,445km</li>
                        <li>길이 - 63.69m</li>
                        <li>높이 - 16.83m</li>
                    </ul>
                </div>
            </li>
        </ul>
    </div>
</section>
<!-- aircraft E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  