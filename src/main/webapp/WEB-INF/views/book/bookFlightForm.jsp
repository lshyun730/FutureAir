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
<!-- book flight S -->
<section class="inner content">
    <h2>항공권 예약</h2>
    <form action="flightBook" method="post" class="bookFlightForm" id="bookFlightForm" onsubmit="bookFormCheck()">
    	<div class="row">
        	<div class="selectList">
        		<input type="radio" id="tab1" value="왕복" name="trip_type" checked><label for="tab1">왕복</label>
        		<input type="radio" id="tab2" value="편도" name="trip_type"><label for="tab2">편도</label>
        		<input type="radio" id="tab3" value="다구간" name="trip_type"><label for="tab3">다구간</label>
        	</div>
    	</div>
        <div class="row">
            <div>
                <p class="title">출발지</p>
                <select name="departure_name">
                    <option value="" disabled selected>도시 혹은 공항</option>
              			<c:forEach var="continent" items="${destinationList}">
              				<optgroup label="${continent[0].continents}">
              				<c:forEach var="destination" items="${continent}">
					        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq bookForm.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
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
					        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq bookForm.arrival_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
              				</c:forEach>
              				</optgroup>
			        	</c:forEach>
                </select>
            </div>
            <div class="flight_date">
                <p class="title">탑승일</p>
                <input type="text" name="departure_date" id="dateRange">
            </div>
        </div>
        <div class="row">
            <div>
                <p class="title">성인</p>
                <select name="seat_adult" id="seat_adult">
                	<c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_adult}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
            <div>
                <p class="title">소아</p>
                <select name="seat_childAge" id="seat_childAge">
                    <c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_childAge}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
            <div>
                <p class="title">유아</p>
                <select name="seat_infantAge" id="seat_infantAge">
                    <c:forEach var="i" begin="0" end="5">
	                    <option value="${i}" <c:if test="${i eq bookForm.seat_infantAge}">selected</c:if>>${i}</option>
                	</c:forEach>
                </select>
            </div>
        </div>
        <div class="submit">
            <input type="submit" value="검색">
        </div>
        <input type="hidden" name="pick_date_list" id="pick_date_list" value=""/>
    </form>
	
	<form action="${pageContext.request.contextPath}/book/passengerInfo" method="post" onsubmit="return bookCheck()">
		<c:forEach var="flightType" items="${flightListType}" varStatus="status">
		    <div class="trip">
		        <h3>여정 ${status.count }. <span>${flightType[0].DEPARTURE_NAME } - ${flightType[0].ARRIVAL_NAME }</span></h3>
				<c:if test="${empty flightType}">
					내역이 존재하지 않습니다
				</c:if>
				<c:if test="${not empty flightType}">
					<!-- day list S -->
			        <ul class="weekList">
			            <fmt:parseDate value="${flightType[0].DEPARTURE_DATE}" var="departure_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
			            <fmt:formatDate var="departure_date" value="${departure_date}" pattern="yyyy-MM-dd" />
			            <li class="navigation prev"><a href="#"><i class="fas fa-chevron-left"></i></a></li>
			            <c:forEach var="day" items="${weekList[status.index]}">
				            <fmt:parseDate value="${day.DEPARTURE_DATE}" var="departure_date_time" pattern="yyyy-MM-dd"/>
				            <li <c:if test="${departure_date eq day.DEPARTURE_DATE}"></c:if> >
				            	<a href="#" onclick="pickDate.call(this)"<c:if test="${departure_date eq day.DEPARTURE_DATE}"> class="dayActive day" </c:if> class="day">      
				            		<span class="pick_date">${day.DEPARTURE_DATE}</span>
					            	<fmt:formatDate value="${departure_date_time}" pattern="MM/dd (E)" />
					            	<span><fmt:formatNumber value="${day.NORMAL_PRICE}" pattern="#,###"/></span>
				            	</a>
				            </li>
			            </c:forEach>
			            <li class="navigation next"><a href="#"><i class="fas fa-chevron-right"></i></a></li>
			        </ul>
			        <!-- day list E -->
			        <!-- flight list S -->
			        <ul class="flight_list">
			        	<c:forEach var="flight" items="${flightType}" varStatus="flight_status">
			        		<fmt:parseDate value="${flight.DEPARTURE_DATE}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
		            		<fmt:parseDate value="${flight.ARRIVAL_DATE}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
				            <li>
				                <div class="flight_info">
				                    <div class="from">${flight.DEPARTURE_NAME}<span><fmt:formatDate value="${departure_date_time}" pattern="HH:mm" /></span></div>
				                    <div class="to">${flight.ARRIVAL_NAME}<span><fmt:formatDate value="${arrival_date_time}" pattern="HH:mm" /></span></div>
				                    <div class="direction"></div>
				                </div>
				                <div class="flight_time">${flight.ETA }분</div>
				                <div class="flight_contents">
					                <input type="radio" name="seat_class${status.count}" class="seat_class" id="seat${status.count}_${flight_status.count}_1" onchange="javascript:setRouteNum('${status.count}', '${flight.ROUTE_NUM }', ${flight.NORMAL_PRICE}, '일반')" value="일반"/><label for="seat${status.count}_${flight_status.count}_1">일반석 <span><fmt:formatNumber value="${flight.NORMAL_PRICE}" pattern="#,###"/> 원</span></label>
					                <input type="radio" name="seat_class${status.count }" class="seat_class" id="seat${status.count}_${flight_status.count}_2" onchange="javascript:setRouteNum('${status.count}', '${flight.ROUTE_NUM }', ${flight.PRESTIGE_PRICE}, '프레스티지')" value="프레스티지"/><label for="seat${status.count}_${flight_status.count}_2">프리스티지석 <span><fmt:formatNumber value="${flight.PRESTIGE_PRICE}" pattern="#,###"/> 원</span></label>
					                <input type="radio" name="seat_class${status.count }" class="seat_class" id="seat${status.count}_${flight_status.count}_3" onchange="javascript:setRouteNum('${status.count}', '${flight.ROUTE_NUM }', ${flight.FIRST_PRICE}, '일등')" value="일등"/><label for="seat${status.count}_${flight_status.count}_3">일등석 <span><fmt:formatNumber value="${flight.FIRST_PRICE}" pattern="#,###"/> 원</span></label>
				                </div>
				            </li>	        	
			        	</c:forEach>
		       	 	</ul>
			        <!-- flight list E -->
				</c:if>
		    </div>
		    <input type="hidden" name="route_num${status.count}" class="route_num" value=""/>
		    <input type="hidden" name="price${status.count}" class="price" value=""/>
		</c:forEach>
		<input type="hidden" name="route_num[]" id="route_num_list"/>
	    <input type="hidden" name="payment">
	    <input type="hidden" name="seat_adult" value="${bookForm.seat_adult}"/>
	    <input type="hidden" name="seat_childAge" value="${bookForm.seat_childAge}"/>
	    <input type="hidden" name="seat_infantAge" value="${bookForm.seat_infantAge}"/>
		<c:if test="${not empty bookForm}">
		    <div class="flight_payment_wrap">
		        <div class="flight_payment">
		            <p>총 결제금액</p>
		            <p class="price" id="lastPayment">0 원</p>
		        </div>
		        <button class="btn_primary">다음</button>
		    </div>
		</c:if>
	</form>
</section>
<!-- book flight E -->
<!-- footer S -->
<script>

function pickDate(element) {
	const form = document.getElementById('bookFlightForm'); // 항공권 검색폼
 	const pick_date_list = document.getElementById('pick_date_list'); // 항공권 검색폼의 hidden 선택된 날짜
	const pick_date = document.getElementsByClassName("dayActive"); // 항공권 목록에 선택된 날짜들 li 
	const day = this.closest('.trip').getElementsByClassName('day'); // 지금 클릭된 항목의 trip element
	
	for(let i=0; i < day.length; i ++) {
		day[i].classList.remove('dayActive');
	}
	
	this.classList.add('dayActive')
	
		
 	for(let i = 0; i < pick_date.length ; i++) {
 		if(i <= 0) {
 			pick_date_list.value = pick_date[i].children[0].innerHTML
 		} else {
			pick_date_list.value = pick_date_list.value + ' ~ ' + pick_date[i].children[0].innerHTML 			
 		}
	 } 
 	
	form.submit()
}

 function setRouteNum(input, route_num, price, seat_class) {
	 
	const inputRouteNum = document.querySelector('input[name=route_num' + input + ']'); 
	const inputPrice = document.querySelector('input[name=price' + input + ']');
	const inputSeatClass = document.querySelector('input[name=seat_class' + input + ']'); 
	const payment = document.querySelector('input[name=payment]'); 
	
	const paymentList = document.getElementsByClassName('price');
	const lastPayment = document.getElementById('lastPayment');
	
	inputPrice.value = price
	inputRouteNum.value = route_num
	inputSeatClass.value = seat_class
	
	let sumPayment = 0
	for (let i = 0; i < paymentList.length; i++) {
		if(paymentList[i].value != null) {
			sumPayment += parseInt(paymentList[i].value)
			payment.value = sumPayment 
		}
	}
	
	lastPayment.innerHTML = sumPayment.toLocaleString()+ ' 원'
}

 function bookCheck() {
	 
	const route_nums = document.getElementsByClassName('route_num');
	const route_num_list =  document.getElementById('route_num_list'); 
	
	const seat_classes = document.getElementsByClassName('seat_class:checked');
	const seat_class_list =  document.getElementById('seat_class_list'); 
	
	const route_list = new Array()
	for (let i = 0; i < route_nums.length; i++) {
		route_list.push(route_nums[i].value)
	}
	
	const seat_list = new Array()
	for (let i = 0; i < seat_classes.length; i++) {
		seat_list.push(seat_classes[i].value)
	}
	
	route_num_list.value = route_list
	seat_class_list.value = seat_list
}

 function changeCustomerType() {
	const seat_adult =  document.getElementById('seat_adult').value; 
	const seat_childAge =  document.getElementById('seat_childAge').value; 
	const seat_infantAge =  document.getElementById('seat_infantAge').value; 
	const customer_type =  document.getElementById('customer_type'); 
	
 	const customerTypeList = new Array()
	for (let i = 0; i < seat_adult; i++) {
		customerTypeList.push('성인')
	}
 	for (let i = 0; i < seat_childAge; i++) {
		customerTypeList.push('소아')
	}
 	for (let i = 0; i < seat_infantAge; i++) {
		customerTypeList.push('유아')
	}
 	customer_type.value = customerTypeList
	 
 }



const startDate = new Date();
/* startDate.setDate(startDate.getDate()+1); */

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
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 