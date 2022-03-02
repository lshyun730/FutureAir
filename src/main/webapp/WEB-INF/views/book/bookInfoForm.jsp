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
	                    <td>여정${status.count }</td>
	                    <td>${flight.DEPARTURE_NAME } - ${flight.ARRIVAL_NAME }</td>
	                    <td>${departure_date}  ${departure_time} - ${arrival_time}</td>
	                    <td>${flight.ROUTE_NUM}</td>
	                    <td>${bookForm.seat_class1}
						</td>
	                </tr>            	
            	</c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <h3>승객정보</h3>
        <form action="#" class="border_input">
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
		                    <td>성인</td>
		                    <td>
		                        <input type="text" placeholder="이름을 입력해 주세요" <c:if test="${status.count eq 1 }">value="${customer.customer_name }" readonly</c:if>>
		                    </td>
		                    <td>
		                        <input type="radio" name="gender${i}" id="tab${i}-1" value="남자" <c:if test="${customer.customer_gender eq '남자' }">checked </c:if>><label for="tab${i}-1">남</label>
		                        <input type="radio" name="gender${i}" id="tab${i}-2" value="여자" <c:if test="${customer.customer_gender eq '여자' }">checked </c:if>><label for="tab${i}-2">여</label>
		                    </td>
		                    <td>
		                        <input type="date" value="${birth}">
		                    </td>
		                    <!-- <td>
		                        <select name="" id="">
		                            <option value="국적" disabled>국적</option>
		                            <option value="대한민국">대한민국</option>
		                        </select>
		                    </td> -->
		                    <td><input type="text" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                	<c:forEach var="childAge" begin="1" end="${bookForm.seat_childAge}" >
	                	<tr>
		                    <td>소아</td>
		                    <td>
		                        <input type="text" placeholder="이름을 입력해 주세요">
		                    </td>
		                    <td>
		                        <input type="radio" name="gender" id="tab1"><label for="tab1">남</label>
		                        <input type="radio" name="gender" id="tab2"><label for="tab2">여</label>
		                    </td>
		                    <td>
		                        <input type="date">
		                    </td>
		                    <td>
		                        <select name="" id="">
		                            <option value="국적" disabled>국적</option>
		                            <option value="대한민국">대한민국</option>
		                        </select>
		                    </td>
		                    <td><input type="text" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                	<c:forEach var="infantAge" begin="1" end="${bookForm.seat_infantAge }" >
	                	<tr>
		                    <td>유아</td>
		                    <td>
		                        <input type="text" placeholder="이름을 입력해 주세요">
		                    </td>
		                    <td>
		                        <input type="radio" name="gender" id="tab1"><label for="tab1">남</label>
		                        <input type="radio" name="gender" id="tab2"><label for="tab2">여</label>
		                    </td>
		                    <td>
		                        <input type="date">
		                    </td>
		                    <td>
		                        <select name="" id="">
		                            <option value="국적" disabled>국적</option>
		                            <option value="대한민국">대한민국</option>
		                        </select>
		                    </td>
		                    <td><input type="text" placeholder="여권번호"></td>
	                    </tr>                		
                	</c:forEach>
                </tbody>
            </table>
        </form>
    </div>
<!--     <div>
        <h3>연락처정보</h3>
        <form action="#" class="border_input">
            <table class="table top_boder">
                    <tr>
                        <th>휴대전화</th>
                        <td><input type="text"/></td>
                        <th>이메일</th>                        
                        <td><input type="text" /></td>
                    </tr>
            </table>
        </form>
    </div> -->
    <div class="flight_payment_wrap">
        <div class="flight_payment">
            <p>총 결제금액</p>
            <p class="price">67,200원</p>
        </div>
        <button class="btn_primary" onclick="location='${pageContext.request.contextPath}/book/bookDone'">다음</button>
    </div>
</section>
<!-- book customer info E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 