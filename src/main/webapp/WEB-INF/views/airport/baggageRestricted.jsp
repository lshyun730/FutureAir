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
		<li>공항</li>
		<li>수하물</li>
		<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageRestricted">운송 제한 물품</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- baggage resticted S -->   
<section class="content inner">
	<h2>운송 제한 물품</h2>
	<div class="title_box">
		<p>기내 안전을 위해 아리 물품은 반입이 제한되거나 엄격히 금지되어 있습니다.<br/>
		항공 여행 전에 아래 내용을 반드시 확인하여 주시기 바랍니다.</p>
	</div>

	<div>
		<h3>항공 운송 금지 물품</h3>
		<ul class="restricted_list">
			<li>
				<p class="title">리튬 배터리 장착 전자기기</p>
				<span>에어휠, 솔로휠, 호버보드, 미니 세그웨이, 전기자전거(전동스쿠터), 전동 킥보드 등(장애인, 노약자용 전동휠체어 제외)</span>
			</li>
			<li>
				<p class="title">인화성 산화성 물질</p>
				<span>수류탄, 다이너마이트, 폭죽, 표백제, 수은, 산화제, 독극물, 도수 70%이상 알코올성 음료, 소화기, 최루가스 등</span>
			</li>
			<li>
				<p class="title">인화성 고압가스가 들어있는 용기</p>
				<span>부탄가스, 개인용 산소통 등 <br/>
				  개인용 산소통 : 사전예약을 통해 당사에서 제공하는 산소통을 이용하세요.</span>
			</li>
		</ul>
		<div>
			<h3>액체류 반입 기준</h3>
			<ul class="desc_list">
				<li>국제선 전 노선 출발/환승 승객</li>
				<li>각 용기의 용략이 100ml 이하로 1인당 1개의 1L 용량의 투명 비닐 지퍼팩에 넣어 휴대반입이 가능합니다.</li>
				<li>당뇨병 환자용 및 의약품은 항공일정에 필요한 용량에 한하여 기내에 휴대할 수 있습니다.</li>
			</ul>
		</div>
	</div> 
</section>
<!-- baggage resticted E -->   
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 