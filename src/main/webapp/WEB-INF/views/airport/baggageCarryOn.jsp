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
		<li>공항</li>
		<li>수하물</li>
		<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageCarryOn">휴대수하물</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- baggage carry on S --> 
<section class="content inner">
	<h2>휴대수하물</h2>
	<div class="title_box">
		<p>편안안 여행과 안전운항을 위해 기내로 가져갈 수 있는 휴대 수하물의<br>
		종류와 규격 및 개수를 안내해드립니다.</p>
	</div>

	<div>
		<h3>휴대 수하물 규격 및 허용량</h3>
		<table class="table">
			<thead>
				<tr>
					<th>좌석 등급</th>
					<th>총 개수</th>
					<th>총 무게</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>일등석</td>
					<td>3개</td>
					<td>18kg/40lb</td>
				</tr>
				<tr>
					<td>비즈니스석</td>
					<td>2개</td>
					<td>18kg/40lb</td>
				</tr>
				<tr>
					<td>이코노미석</td>
					<td>1개</td>
					<td>10kg/22lb</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<h3>기내 수하물 보관 방법</h3>
		<ul class="desc_list">
			<li>기내에 반입된 모든 수하물은 반드시 기내 선반 또는 좌석 밑에 보관해야 합니다.</li>
			<li>수화물을 올리고 내릴 때, 수하물이 떨어지지 않도록 주의하시기 바랍니다.</li>
			<li>내리기 전 두고 내리는 물건에 없는지 확인하시기 바랍니다.</li>
		</ul>
	</div>
</section>
<!-- baggage carry on E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 