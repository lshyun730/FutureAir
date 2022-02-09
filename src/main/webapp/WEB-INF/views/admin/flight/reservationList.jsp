<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents">
	<div class="row">
    <!-- reservation status S -->
    <section class="reservation_status width100">
    	<div class="inner">
	        <!-- content header S -->   
	        <div class="flex_content_header">
	            <h2>예약현황</h2>
	            <div class="action">
	                <button class="btn_s dropdown btn_search_detail">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
	            </div>
	        </div>
	        <!-- content header E -->   
	        <!-- search detail S -->
	        <form action="#" class="search_detail active" id="search_detail">
	            <div class="inputbox term">
	                <p class="inputbox_title">출발일</p>
	                <div class="inputbox_input">
	                    <input type="date" id="departure_date_start" name="departure_date_start" value="${searchMap.departure_date_start}" onchange="checkDate(this)">
	                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
	                </div>
	            </div>
	            <div class="inputbox">
	                <div class="inputbox_input">
	                    <input type="date" id="departure_date_end" name="departure_date_end" value="${searchMap.departure_date_end}"  onchange="checkDate(this)">
	                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
	                </div>
	            </div>
	            <div class="inputbox term">
	                <p class="inputbox_title">예약일</p>
	                <div class="inputbox_input">
	                    <input type="date" id="reservation_date_start" name="reservation_date_start" value="${searchMap.reservation_date_start}">
	                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
	                </div>
	            </div>
	            <div class="inputbox">
	                <div class="inputbox_input">
	                    <input type="date"  id="reservation_date_end" name="reservation_date_end" value="${searchMap.reservation_date_end}">
	                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title">출발지</p>
	                <div class="inputbox_input">
	                	<select name="departure_name" onchange="changeSelect(this)" id="departure_name">
	                		<option value="" disabled selected>도시 혹은 공항</option>
	                		<optgroup label="아시아">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '아시아'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="아메리카">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '아메리카'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.departure_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="유럽">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '유럽'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.departure_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="오세아니아">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '오세아니아'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.departure_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                	</select>
	                    <span class="inputbox_icon"><i class="fas fa-plane-departure"></i></span>
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title">도착지</p>
	                <div class="inputbox_input">
	                    <select name="arrival_name" onchange="changeSelect(this)"  id="arrival_name">
	                		<option value="" disabled selected>도시 혹은 공항</option>
	                		<optgroup label="아시아">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '아시아'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.arrival_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="아메리카">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '아메리카'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.arrival_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="유럽">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '유럽'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.arrival_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                		<optgroup label="오세아니아">
	                			<c:forEach var="destination" items="${destinationList}">
	                				<c:if test="${destination.continents eq '오세아니아'}">
							        	<option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.arrival_name}">selected="selected"</c:if>>${destination.airport_name} / ${destination.airport_id}</option>
	                				</c:if>
						        </c:forEach>
	                		</optgroup>
	                	</select>
	                    <span class="inputbox_icon"><i class="fas fa-plane-arrival"></i></span>
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title">예약자 </p>
	                <div class="inputbox_input">
	                    <input type="text" placeholder="홍길동" name="customer_name">
	                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
	                </div>
	            </div>
	            <div class="inputbox submit">
	                <div class="inputbox_input">
	                    <input type="submit" value="검색" onclick="pagingFormSubmit(1)">
	                </div>
	            </div>
	            <input type="hidden" name="page" id="page" />
	        </form>
	        <!-- search detail E -->   
	        <!-- table S --> 
	        <table class="table">
	            <thead>
	                <tr>
	                    <th><input type="checkbox" onclick="selectAll(this)"></th>
	                    <th>예약번호</th>
	                    <th>승객</th>
	                    <th>출발지</th>
	                    <th>도착지</th>
	                    <th>출발일</th>
	                    <th>예약일</th>
	                    <th>타입</th>
	                    <th>결제가격</th>
	                    <th>액션</th>
	                </tr>
	            </thead>
	            <tbody>
	            <c:if test="${empty reservationList}">
            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
            	</c:if>
            	<c:forEach var="reservation" items="${reservationList}">
            		<fmt:parseDate value="${reservation.DEPARTURE_DATE}" var="departure_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<fmt:parseDate value="${reservation.RESERVATION_DATE}" var="reservation_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<tr>
	                    <td><input type="checkbox" name="tableSelect" value="${reservation.RESERVATION_NUM}"></td>
	                    <td><a href="#">${reservation.RESERVATION_NUM}</a></td>
	                    <td>${reservation.CUSTOMER_NAME}</td>
	                    <td>${reservation.DEPARTURE_NAME}</td>
	                    <td>${reservation.ARRIVAL_NAME}</td>
	                    <td><fmt:formatDate value="${departure_date}" pattern="yyyy-MM-dd" /></td>
	                    <td><fmt:formatDate value="${reservation_date}" pattern="yyyy-MM-dd" /></td>
	                    <td>${reservation.RESERVATION_TYPE}</td>
	                    <td><fmt:formatNumber value="${reservation.PAYMENT}" pattern="#,###"/> 원</td>
	                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
	                </tr>
            	</c:forEach>
	            </tbody>
	        </table>
	        <!-- table E --> 
	        <!-- content footer S --> 
	        <div class="flex_content_footer">
	            <button class="btn danger" onclick="javascript:checkDelete()">선택삭제</button>
	            <div class="navi">
	                <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"><i class="fas fa-chevron-left"></i></a>
	                <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
						<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>
					</c:forEach>
	                <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"><i class="fas fa-chevron-right"></i></a>
	            </div>
	        </div>
	        <!-- content footer E --> 
        </div>
    </section>
    <!-- reservation status E -->   
    </div>
</section>
<!-- content E --> 

<script>

// 선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deleteReservation',
				data : {
					deleteList : deleteList
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data==1) {
						alert('삭제에 성공하였습니다');		
						location.reload();
					}
				}
		 }); 				 
	 }
}
</script>
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
