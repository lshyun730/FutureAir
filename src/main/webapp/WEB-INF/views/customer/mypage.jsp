<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- mypage S -->
<section class="inner content">
    <h2>마이페이지</h2>
    <div class="mypage_main">
        <div class="customer_info">
            <div class="profile">
                <p class="customer_name">${customer.customer_name }님 <span>${customer.customer_id }</span></p>
            </div>
            <ul class="customer_info_list">
                <li>등급 <span>${customer.customer_grade }</span></li>
                <li>마일리지 <span>${mileage}</span></li>
                <li class="logout"><a href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
            </ul>
        </div>
        <ul class="mypage_nav">
            <li>항공권정보
                <ul class="dep">
                    <li><a href="#">예약내역조회</a></li>
                    <li><a href="#">마일리지조회</a></li>
                </ul>
            </li>
            <li>고객센터
                <ul class="dep">
                    <li><a href="#">1:1 문의내역</a></li>
                    <li><a href="#">자주묻는질문</a></li>
                </ul>
            </li>
            <li>회원정보
                <ul class="dep">
                    <li><a href="#">회원정보수정</a></li>
                    <li><a href="#">회원탈퇴</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div>
        <div class="table_header">
            <h3>최근 예약 내역 <span>최대 5건 까지 노출됩니다</span></h3>
            <a href="#" class="all_link">전체 내역 보기</a>
        </div>
        <table class="table top_boder">
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>승객</th>
                    <th>출발일</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>예약일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="reservation" items="${myReservationList }" end="4">
	                <tr>
	                    <td>${reservation.RESERVATION_NUM }</td>
	                    <td>${reservation.PASSENGER_NAME } <c:if test="${reservation.COUNT ne 0 }">외 ${reservation.COUNT }</c:if> </td>
	                    <td>${reservation.DEPARTURE_DATE }</td>
	                    <td>${reservation.DEPARTURE_NAME }</td>
	                    <td>${reservation.ARRIVAL_NAME }</td>
	                    <td>${reservation.RESERVATION_DATE }</td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <div class="table_header">
            <h3>최근 문의 내역 <span>최대 5건 까지 노출됩니다</span></h3>
            <a href="#" class="all_link">전체 내역 보기</a>
        </div>
        <table class="table faq_list top_boder">
            <thead>
                <tr>
                    <th>문의내용</th>
                    <th>구분</th>
                    <th>작성일</th>
                    <th>답변유무</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="qna" items="${myQnAList }" end="4">
	                <tr class="quest">
	                    <td style="text-align: left">${qna.title}</td>
	                    <td>${qna.post_type }</td>
	                    <td>${qna.post_date }</td>
	                    <td>
	                    	<c:if test="${empty qna.reply_index}">답변전</c:if>
	                    	<c:if test="${not empty qna.reply_index}">답변완료</c:if>
	                    </td>
	                </tr>
            	</c:forEach>
            </tbody>
        </table>
    </div>
</section>
<!-- mypage E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  