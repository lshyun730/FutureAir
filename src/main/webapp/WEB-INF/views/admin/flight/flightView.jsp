<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>비행정보</h2>
        <section>
        	<h3>기본정보</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>비행번호</th>
	                <td>${route.ROUTE_NUM}</td>
	                <th>비행기아이디</th>
 	                <td>${route.AIRPLANE_ID }</td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>비행일정</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>출발지</th>
	                <td>${route.DEPARTURE_NAME }</td>
	                <th>도착지</th>
	                <td>${route.ARRIVAL_NAME }</td>
	            </tr>
	            <tr>
	            	<fmt:parseDate value="${route.DEPARTURE_DATE}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	               	<fmt:formatDate var="departure_date" pattern="yyyy-MM-dd" value="${departure_date_time}"/>
	               	<fmt:formatDate var="departure_time" pattern="HH:mm" value="${departure_date_time}"/>
	               	<fmt:parseDate value="${route.ARRIVAL_DATE}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	                <fmt:formatDate var="arrival_date" pattern="yyyy-MM-dd" value="${arrival_date_time}"/>
	               	<fmt:formatDate var="arrival_time" pattern="HH:mm" value="${arrival_date_time}"/>
	                <th>출발날짜</th>
	                <td>${departure_date }</td>
	                <th>출도착시간 ${route.arrival_date}</th>
	                <td>${departure_time } - ${arrival_time } <c:if test="${departure_date ne arrival_date}">익일</c:if> </td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>가격정보</h3>
        	<!-- table S --> 
        	<table class="table">
        		<colgroup>
	        		<col width="13%">
	        		<col width="20%">
	        		<col width="15%">
	        		<col width="20%">
	        		<col width="13%">
	        		<col width="20%">
	        	</colgroup>
	            <tr>
	                <th>일반석</th>
	                <td>${route.NORMAL_PRICE }</td>
	                <th>프레스티지석</th>
	                <td>${route.PRESTIGE_PRICE }</td>
	                <th>일등석</th>
	                <td>${route.FIRST_PRICE }</td>
	            </tr> 
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>예약좌석</h3>
        	<!-- table S --> 
        	<table class="table">
        		<colgroup>
	        		<col width="13%">
	        		<col width="20%">
	        		<col width="15%">
	        		<col width="20%">
	        		<col width="13%">
	        		<col width="20%">
	        	</colgroup>
       			<c:set var="normal" value="0"/>
       			<c:set var="prestige" value="0"/>
       			<c:set var="first" value="0"/>
               	<c:forEach var="reservation" items="${reservationList}">
               		<c:if test="${reservation.SEAT_CLASS eq '일반' && reservation.RESERVATION_STATE eq '예약완료'}">
               			<c:set var="normal" value="${normal + 1 }" />
               		</c:if>
               		<c:if test="${reservation.SEAT_CLASS eq '프레스티지' && reservation.RESERVATION_STATE eq '예약완료'}">
               			<c:set var="prestige" value="${prestige + 1 }" />
               		</c:if>
               		<c:if test="${reservation.SEAT_CLASS eq '일등' && reservation.RESERVATION_STATE eq '예약완료'}">
               			<c:set var="first" value="${first + 1 }" />
               		</c:if>
               	</c:forEach>
               	<c:set var="seat_count" value="${route.NORMAL_NUM}"></c:set>
	            <tr>
	                <th>일반석</th>
	                <td>${normal}<c:if test="${normal eq 0}"></c:if> / ${route.NORMAL_NUM}</td>
	                <th>프레스티지석</th>
	                <td>${prestige}<c:if test="${prestige eq 0}"></c:if> / ${route.PRESTIGE_NUM}</td>
	                <th>일등석</th>
	                <td>${first}<c:if test="${first eq 0}"></c:if> / ${route.FIRST_NUM}</td>
	            </tr> 
        	</table>
        	<!-- table E --> 
        </section>
        <section class="content">
        	<h3>예약현황</h3>
        	<form class="flight_view">
        	<!-- table S --> 
	        	<table class="table reser_table">
		            <tr>
		            	<th><input type="checkbox" onclick="selectAll(this)"></th>
		                <th>예약번호</th>
		                <th>예약자</th>
		                <th>클래스</th>
		                <th>예약일</th>
		                <th>상태</th>
		                <th>액션</th>
		            </tr> 
		            <c:if test="${empty reservationList}">
	            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
	            	</c:if>
		            <c:forEach var="reservation" items="${reservationList}">
			            <tr>
			            	<td>
		                    	<input type="checkbox" name="tableSelect" value="${reservation.RESERVATION_NUM}" <c:if test="${reservation.RESERVATION_STATE eq '예약취소'}">disabled</c:if>>
		                    </td>
			            	<td><a href="">${reservation.RESERVATION_NUM}</a></td>
			            	<td>${reservation.PASSENGER_NAME}</td>
			            	<td>${reservation.SEAT_CLASS}</td>
			            	<td>${reservation.RESERVATION_DATE}</td>
			            	<td>
								<c:if test="${reservation.RESERVATION_STATE eq '예약완료'}">
				                    <button class="btn_s status">예약</button>
		                    	</c:if>
		                    	<c:if test="${reservation.RESERVATION_STATE eq '예약취소'}">
				                    <button class="btn_s status status_cancle">취소</button>
		                    	</c:if>
		                    </td>
		                    <td class="more">
	                            <div class="btn_m_wrap" onclick="click_more(this)">
	                                <div class="btn_m">
	                                    <span></span>
	                                </div>
	                                <ul class="select_list">
	                                    <li><a href="javascript:reservationDelete('${reservation.RESERVATION_NUM}', '${reservation.RESERVATION_STATE}')">예약취소</a></li> 
	                                </ul>
	                            </div>
	                        </td>
			            </tr>
			            
		            </c:forEach>
	        	</table>
	        	<!-- table E --> 
	        </form>
        	<!-- content footer S --> 
	        <div class="flex_content_footer">
	            <button class="btn danger" onclick="javascript:checkDelete(this)">선택취소</button>
	            <div class="navi">
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
	               <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
				</c:forEach>
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
	           </div>
	        </div>
	        <!-- content footer E --> 
        </section>
</section>
<!-- popup E -->  
<script>

//선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 취소하시겠습니까?")){
		 $.ajax({
				url : 'reservationCancleList',
				data : {
					deleteList : deleteList
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data==1) {
						alert('예약취소에 성공하였습니다');		
						location.reload();
					}
				}
		 }); 				 
	 }
}

//액션 이외 선택시 액션 닫힘
document.addEventListener('click', () => {;
	var btn_m_wrap = document.getElementsByClassName('btn_m_wrap');
	for(let i=0; i < btn_m_wrap.length; i ++) {
	 	if (btn_m_wrap[i].classList.contains('active')) {
	     	btn_m_wrap[i].classList.remove('active');
	 	}	
	}
})
</script>
</body>
</html>