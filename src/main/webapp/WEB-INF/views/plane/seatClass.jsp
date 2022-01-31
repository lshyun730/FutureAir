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
		<li>클래스별 서비스</li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- seat class S --> 
<section class="seat_class inner content">
    <div>
        <h2>클래스별 서비스</h2>
        <p>비교할 수 없이 쾌적하고 다양한 즐거움이 가득한 미래항공의 클래스별 서비스를 알아보세요</p>
    </div>

    <div class="title_box_img">
        <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass.png" alt="좌석클래스이미지">
    </div>
    
    <div class="tab_menu">
        <input id="tab1" type="radio" name="tab" class="tab_list" checked><label for="tab1" class="tab_label">일등석</label>
        <input id="tab2" type="radio" name="tab" class="tab_list"><label for="tab2" class="tab_label">프레스티지석</label>
        <input id="tab3" type="radio" name="tab" class="tab_list"><label for="tab3" class="tab_label">이코노미석</label>
        <div class="tab_contents">
            <div id="content1">
                <ul class="class_service_list">
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_first1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">첫 획에서부터 시작되는 여행</p>
                            <p>여행 첫 시작에서부터 당신은 특별한 경험을 하실 수 있습니다. <br> 
                                탑승 수속에서 항공기 탑승까지 1:1 바틀러 서비스 및 차별화된 의전 서비스, 일등석 전용 라운지, 전용 체크인 서비스를 통해, 당신과 함께 동행하는 퓨처 에어를 경험하실 수 있습니다. </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_first2.png" alt="좌석이미지">
                        </div>
                        <div class="desc">
                            <p class="title">180도로 펼쳐지는 하늘 위 호텔</p>
                            <p>편안한 숙면을 위한 5성급 호텔이 하늘 위에서 이루어집니다. <br>
                                고급 양면 이불과 여섯 가지 종류로 이루어진 베개, 독립적으로 제공되는 공간. 자유로운 무선 인터넷(WI-FI) 사용. 이 모든 것이 당신의 비행을 위해 제공됩니다. <br>
                                또한 프랑스 딥디크 어매니티와 수면 시 편안함을 제공할 편의복이 제공됩니다. 180도로 펼쳐지는 하늘 위의 호텔에서 여행을 즐길 수 있습니다.</p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_first3.png" alt="와인이미지">
                        </div>
                        <div class="desc">
                            <p class="title">특급 와인과 샴페인</p>
                            <p>당신의 편안한 여행을 위한 특급 와인과 샴페인, 기내식이 하늘 위 호텔에서 연중 무휴로 제공됩니다. 일등석 고객만을 위한 식음료들이 상시 제공됩니다. <br>
                                고도 위에서 최상의 맛을 전해드리기 위해 매해 소뮬리에들의 시음을 통해 선정된 샤토 라피트 로쉴드 와인과 데땅져 샴페인 등을 포함한 다양한 식음료들이 제공되고 있습니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="content2">
                <ul class="class_service_list">
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_prestige1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">당신의 가치를 증명해주는 선택</p>
                            <p>당신의 여행, 당신의 비즈니스를 위한 모든 선택이 이곳에서 이루어집니다. <br>
                                탑승 수속에서 항공기 탑승까지. 프레스티지 바틀러 서비스를 통한 전담 인원 배치 및 차별화된 의전 서비스., 비즈니스 고객을 위한 전용 체크인 라운지를 통해, 당신과 함께 동행하는 퓨처 에어를 경험하실 수 있습니다.</p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_prestige2.png" alt="비행기이미지">
                        </div>
                        <div class="desc">
                            <p class="title">흐트러짐 없는 편안함</p>
                            <p>편안한 여행을 위한 모든 것들이 프레스티지 석에서 이루어집니다. <br>
                                고급 이불과 인체 공학적으로 만들어진 좌석이 당신의 비행을 편안히 제공합니다. <br>
                                또한 미래항공 자체 어매니티인 퓨처리스트 어매니티와 편안함을 제공할 실내화 및 안대가 제공됩니다. </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_prestige3.png" alt="와인이미지">
                        </div>
                        <div class="desc">
                            <p class="title">기내식과 와인 페어링</p>
                            <p>당신의 여정을 위한 기내식이 제공됩니다. <br>
                                또한 비즈니스석 고객만을 위해, 기내식과 페어링을 할 수 있는 와인이 1병 제공됩니다.(레드와인 및 화이트와인) <br>
                                프레스티지 석 고객들을 위해, 매해 소뮬리에들이 상공에서 시음 을 통해 선정된 와인으로, 당신의 여정과 함께합니다.</p>
                        </div>
                    </li>
                </ul>
            </div>
            <div id="content3">
                <ul class="class_service_list">
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_economy1.png" alt="라운지이미지">
                        </div>
                        <div class="desc">
                            <p class="title">무엇을 망설이시나요? </p>
                            <p>당신의 여정은 당신과 함께 할 전문가로부터 시작됩니다. <br>
                                합리적 가격과 가격을 뛰어넘는 서비스가 체크인 4시간 전부터 당신을 기다리고 있습니다. </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_economy2.png" alt="좌석이미지">
                        </div>
                        <div class="desc">
                            <p class="title">특별하지 않을 이유 없는 좌석</p>
                            <p>힘든 여정이 아닌, 즐겁고 합리적인 여행을 시작합니다. <br>
                                선택에 따라 엑스트라 레그 좌석이 제공되며, 구름 위를 살펴볼 수 있는 좌석이 구비되어 있습니다. <br>
                                또한 좌석에 장착된 전원 공급 장치로 노트북과 스마트폰 등 전자제품을 이용할 수 있습니다.  </p>
                        </div>
                    </li>
                    <li>
                        <div class="img">
                            <img src="${pageContext.request.contextPath}/resources/images/sub/img_seatClass_economy3.png" alt="와인이미지">
                        </div>
                        <div class="desc">
                            <p class="title">당신의 입맞에 맞춘 기내식 제공</p>
                            <p>출발 전 웰컴 드링크를 즐기며 여행을 시작하세요. <br>
                                고객의 취향에 따라 와인이나 샴페인, 소프트 드링크를 드립니다. <br>
                                또한 여행의 또 다른 즐거움, 미래항공에  탑승하시는 고객을 위해 정성스럽게 준비한 기내식을 서비스해 드립니다.</p>
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