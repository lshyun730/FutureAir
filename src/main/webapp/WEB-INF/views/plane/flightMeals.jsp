<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- breadcrumbs S --> 
<div class="breadcrumbs inner">
	<ul>
		<li><i class="fas fa-home"></i></li>
		<li>기내</li>
		<li>기내 서비스</li>
		<li><a href="#">기내식</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- seat class S --> 
<section class="flight_meals seat_class inner content">
    <div>
        <h2>기내식</h2>
        <p>미래항공에  탑승하시는 고객을 위해 정성스럽게 준비한 기내식을 서비스해 드립니다.</p>
    </div>

    <div class="title_box_img">
        <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals.png" alt="기내식이미지">
    </div>
    
    <div class="tab_menu">
        <input id="tab1" type="radio" name="tab" class="tab_list" checked><label for="tab1" class="tab_label">일등석</label>
        <input id="tab2" type="radio" name="tab" class="tab_list"><label for="tab2" class="tab_label">프레스티지석</label>
        <input id="tab3" type="radio" name="tab" class="tab_list"><label for="tab3" class="tab_label">이코노미석</label>
        <div class="tab_contents">
            <div id="content1">
                <ul class="class_service_list">
                    <h3>기내식</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_first1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">명품 식사 코스 요리 서비스</p>
                            <p>당신의 요청에 따라 한식, 일식, 중식, 양식 그 모든 코스 요리가 비행기 위에서부터 시작됩니다. <br>
                                계절별 신선한 소재의 풍미를 한껏 발휘한 특선 요리를 장거리구간에서 즐기시기 바랍니다.</p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_first2.png" alt="좌석이미지">
                        </div>
                        <div class="desc">
                            <p class="title">와인 케이터링 서비스</p>
                            <p>엄격히 선정된 와일들에 맞는 안주를 즐겨보세요 <br>
                                다양한 종류의 치즈, 살라미, 햄, 브래드 등이 준비 되어있습니다. <br>
                                원하시는 구성으로 즐길 수 있는 와인 케이트링 서비스를 통해 즐거운 여행을 즐길 수 있습니다.</p>
                        </div>
                    </li>
                    <h3>음료</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_first3.png" alt="와인이미지">
                        </div>
                        <div class="desc">
                            <p class="title">와인</p>
                            <p>세계 유명 소믈리에들이 직접 선정한 기내식에 어울리는 와인들을 서비스하고 있습니다. <br>
                                최고급 샴페인을 포함한 다양한 레드, 화이트 와인, 각종 디저트 와인까지 기내식 코스별 다양한 와인을 선택하여 드실 수 있습니다. <br>
                                와인 외에도 위스키, 진, 보드카, 꼬냑 등의 다양한 주류와 칵테일이 준비되어 있습니다.</p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_first4.png" alt="와인이미지">
                        </div>
                        <div class="desc">
                            <p class="title">티</p>
                            <p>각종 티를 구성하여 품격 높은 티 서비스를 제공해 드리고 있습니다. <br>
                                녹차와 홍차 및 허브차를 즐기시면서 편안하고 여유로운 항공 여행을 즐기시기 바랍니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="content2">
                <ul class="class_service_list">
                    <h3>기내식</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_prestige1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">명품 식사 서비스</p>
                            <p>당신의 요청에 따라 한식, 일식, 중식, 양식 그 모든 코스 요리가 비행기 위에서부터 시작됩니다. <br>
                                계절별 신선한 소재의 풍미를 한껏 발휘한 특선 요리를 즐기시기 바랍니다.</p>
                        </div>
                    </li>
                    <h3>음료</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_prestige2.png" alt="비행기이미지">
                        </div>
                        <div class="desc">
                            <p class="title">와인</p>
                            <p>매해 소뮬리에들이 비행기 상공에서의 기압을 고려하여 적절한 와인을 제공합니다. <br>
                                신대륙 와인 및 미래 항공의 시그니처 와인을 즐겨보세요 </p>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="content3">
                <ul class="class_service_list">
                    <h3>기내식</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_economy1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">다양한 메뉴 서비스 </p>
                            <p>요청에 따라 한식, 일식, 중식, 양식 요리가 제공 됩니다. <br>
                                다양한 종류의 음식을 미래항공에서 즐겨보세요 </p>
                            </div>
                        </li>
                    <h3>음료</h3>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_flightMeals_economy2.png" alt="좌석이미지">
                        </div>
                        <div class="desc">
                            <p class="title">와인</p>
                            <p>풍부한 향과 부드러운 맛으로 기내에서 즐기기 적합한 프랑스, 칠레, 호주의 우수 와인을 엄선해 제공합니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
        </div> 
    </div>
</section>
<!-- seat class E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  