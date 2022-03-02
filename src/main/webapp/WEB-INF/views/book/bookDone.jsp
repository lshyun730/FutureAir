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
		<li>예매</li>
		<li>항공권 예약</li>
		<li><a href="#">항공권 예약</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- book done S -->
<section class="book_done inner content">
    <h2>항공권 예약</h2>
    <div class="title_box">
        <p class="title">예약이 완료되었습니다</p>
        <p>예약번호 : R012344503</p>
        <p>미래항공을 이용해주셔서 감사드립니다</p>
    </div>
    <div class="btn_wrap">
        <button class="btn_primary light">홈으로</button>
        <button class="btn_primary">예약확인</button>
    </div>
</section>
<!-- book done E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 