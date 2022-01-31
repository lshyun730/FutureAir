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
		<li><a href="${pageContext.request.contextPath}/airport/baggage/baggageInfo">수하물정보</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- baggage info S -->  
<section class="baggage_info content">
	<div class="inner">
		<h2>수화물 안내</h2>
		<div class="title_box">
			<p>짐을 준비하시는 고객님의 여행이 한결 편안할 수 있도록 꼭 알아두셔야 하는 수하물 관련 정보를 안내해<br/> 
			드리고 있습니다. 아래 내용을 참고해 주세요.</p>                
		</div>
	
	
		<div>	
			<h3>수화물 종류</h3>
			<p>위탁 수하물(Checked Baggage) : 고객이 항공사에 탑승 의탁하여 수하물표를 발행한 수하물</p>                
			<p>휴대 수하물(Carry on Baggage) : 위탁 수하물이 아닌, 기내에 휴대하여 운송하는 수하물</p>                
		</div>
	
		<div>		
			<h3>수하물 준비 방법</h3>
			<ul class="desc_list">
				<li>영문으로 작성한 이름과 연락처가 기재된 이름포를 가방 외부의 잘 보이는 부분에 부착해 주십시오.</li>
				<li>항공사에서 지정한 크기와 무게에 지켜서 준비하여 주시고, 내용품이 손상되지 않도록 적절히 포장을 하십시오.</li>
			</ul>              
		</div>
	</div>	
</section>
<!-- baggage info E -->  
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 