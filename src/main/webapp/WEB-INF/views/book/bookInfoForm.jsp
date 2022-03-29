<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- book customer info S -->
<section class="inner content">
	<form action="bookDone" method="post" class="border_input" id="bookForm">
    <h2>항공권 예약</h2>
    <div>
        <h3>여행정보</h3>
        <table class="table top_boder">
            <thead>
                <tr>
                    <th>유형</th>
                    <th>여정</th>
                    <th>출도착 날짜 및 시간</th>
                    <th>비행번호</th>
                    <th>좌석정보</th>
                </tr>
            </thead>
            <tbody>  
            	<c:forEach var="flight" items="${flightInfo }" varStatus="status">
            		<fmt:parseDate value="${flight.DEPARTURE_DATE}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	               	<fmt:formatDate var="departure_date" pattern="yyyy-MM-dd (E)" value="${departure_date_time}"/>
	               	<fmt:formatDate var="departure_time" pattern="HH:mm" value="${departure_date_time}"/>
	               	<fmt:parseDate value="${flight.ARRIVAL_DATE}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
	                <fmt:formatDate var="arrival_date" pattern="yyyy-MM-dd" value="${arrival_date_time}"/>
	               	<fmt:formatDate var="arrival_time" pattern="HH:mm" value="${arrival_date_time}"/>
	                <tr>
	                    <td>여정${status.count}</td>
	                    <td>${flight.DEPARTURE_NAME } - ${flight.ARRIVAL_NAME }</td>
	                    <td>${departure_date}  ${departure_time} - ${arrival_time}</td>
	                    <td>${flight.ROUTE_NUM}</td>
	                    <td>${flight.SEAT_CLASS}
						</td>
	                </tr>            	
	            	<input type="hidden" class="route_num" name="route_num" value="${flight.ROUTE_NUM}" disabled/>
	            	<input type="hidden" class="seat_class" name="seat_class" value="${flight.SEAT_CLASS}" disabled/>
            	</c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <h3>승객정보</h3>
            <table class="table top_boder">
                <colgroup>
                    <col width="10%">
                    <col width="18%">
                    <col width="18%">
                    <col width="18%">
                    <col width="18%">
                </colgroup>
                <thead>
                    <tr>
                        <th>유형</th>
                        <th>이름</th>
                        <th>성별</th>
                        <th>생년월일</th>
                        <!-- <th>국적</th> -->
                        <th>여권번호</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="adult" begin="1" end="${bookForm.seat_adult }" varStatus="status">
	               		<c:set var="i" value="${i+1}"></c:set>
                		<fmt:parseDate value="${customer.customer_birth}" var="customer_birth" pattern="yyyyMMdd"/>
                		<fmt:formatDate var="birth" pattern="yyyy-MM-dd" value="${customer_birth}"/>
	                	<tr>
		                    <td>성인 <input type="hidden" name="type${i}" value="성인"/></td>
		                    <td>
		                        <input name="name${i}" type="text" placeholder="이름을 입력해 주세요" <c:if test="${status.count eq 1 }">value="${customer.customer_name }" readonly</c:if>>
		                    </td>
		                    <td>
		                        <input type="radio" name="gender${i}" id="tab${i}-1" value="남자" <c:if test="${status.count eq 1 and customer.customer_gender eq '남자' }">checked </c:if>><label for="tab${i}-1">남</label>
		                        <input type="radio" name="gender${i}" id="tab${i}-2" value="여자" <c:if test="${status.count eq 1 and customer.customer_gender eq '여자' }">checked </c:if>><label for="tab${i}-2">여</label>
		                    </td>
		                    <td>
		                        <input type="date" name="birth${i}" <c:if test="${status.count eq 1 }"> value="${birth}" </c:if>>
		                    </td>
		                    <td><input type="text" name="passport${i}" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                	<c:forEach var="childAge" begin="1" end="${bookForm.seat_childAge}" >
                		<c:set var="i" value="${i+1}"></c:set>
	                	<tr>
		                    <td>소아 <input type="hidden" name="type${i}" value="소아"/></td>
		                    <td>
		                        <input name="name${i}" type="text" placeholder="이름을 입력해 주세요">
		                    </td>
		                    <td>
		                        <input type="radio" name="gender${i}" id="tab1" value="남자" ><label for="tab1">남</label>
		                        <input type="radio" name="gender${i}" id="tab2" value="여자" ><label for="tab2">여</label>
		                    </td>
		                    <td>
		                        <input type="date" name="birth${i}" >
		                    </td>
		                    <td><input type="text" name="passport${i}" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                	<c:forEach var="infantAge" begin="1" end="${bookForm.seat_infantAge }" >
                		<c:set var="i" value="${i+1}"></c:set>
	                	<tr>
		                    <td>소아 <input type="hidden" name="type${i}" value="유아"/></td>
		                    <td>
		                        <input name="name${i}" type="text" placeholder="이름을 입력해 주세요">
		                    </td>
		                    <td>
		                        <input type="radio" name="gender${i}" id="tab1" value="남자" ><label for="tab1">남</label>
		                        <input type="radio" name="gender${i}" id="tab2" value="여자" ><label for="tab2">여</label>
		                    </td>
		                    <td>
		                        <input type="date" name="birth${i}" >
		                    </td>
		                    <td><input type="text" name="passport${i}" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                </tbody>
            </table>
            <input type="hidden" name="payment" value="${bookForm.payment}" />
            <input type="hidden" name="customer_id" value="${customer.customer_id}" />
            <input type="hidden" name="passenger_count" value="${bookForm.seat_adult + bookForm.seat_childAge + bookForm.seat_infantAge}" /> 
            <input type="hidden" id= "seat_class_list" name="seat_class_list" value="" />
            <input type="hidden" id= "route_num_list" name="route_num_list" value="" /> 
        
    </div>
    <div class="flight_payment_wrap">
        <div class="flight_payment">
            <p>총 결제금액</p>
            <p class="price"><fmt:formatNumber value="${bookForm.payment}" pattern="#,###"/> 원</p>
        </div>
        <button class="btn_primary" onclick="checkForm()">다음</button>
    </div>
    </form>
</section>
<!-- book customer info E -->
<script>
	
	function checkForm() {
		const form = document.getElementById('bookForm');
		const route_num = document.getElementsByClassName('route_num');
		const seat_class =  document.getElementsByClassName('seat_class'); 
		
		const route_num_list =  document.getElementById('route_num_list'); 
		const seat_class_list =  document.getElementById('seat_class_list'); 
		
		const route_list = new Array()
		for (let i = 0; i < route_num.length; i++) {
			route_list.push(route_num[i].value)
		}
		
		const seat_list = new Array()
		for (let i = 0; i < seat_class.length; i++) {
			seat_list.push(seat_class[i].value)
		}
		
		route_num_list.value = route_list
		seat_class_list.value = seat_list
		
		
		
		form.submit()
	}
</script>
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 