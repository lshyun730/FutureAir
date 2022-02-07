<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents">
	<div class="row">
    <!-- flight status S -->   
    <section class="flight_status width100">
    	<div class="inner">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>비행일정</h2>
            <div class="action">
                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
                <button class="btn primary">비행추가</button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="${pageContext.request.contextPath}/admin/flight/flightList" class="search_detail" method="get" id="search_detail">
            <div class="inputbox">
                <p class="inputbox_title">출발지</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="도시 혹은 공항" name="departure_name" value="${searchMap.departure_name}">
                    <span class="inputbox_icon"><i class="fas fa-plane-departure"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착지</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="도시 혹은 공항" name="arrival_name" value="${searchMap.arrival_name}">
                    <span class="inputbox_icon"><i class="fas fa-plane-arrival"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">비행번호 </p>
                <div class="inputbox_input">
                    <input type="text" placeholder="OT0011" name="route_num" value="${searchMap.route_num}">
                    <span class="inputbox_icon"><i class="fas fa-plane"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">상태</p>
                <div class="inputbox_input">
                    <select name="status">
                        <option value="전체" selected>전체</option>
                        <option value="도착">도착</option>
                        <option value="비행">비행</option>
                        <option value="대기">대기</option>
                        <option value="취소">취소</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox term">
                <p class="inputbox_title">출발일</p>
                <div class="inputbox_input">
                    <input type="date" placeholder="2022-01-22" name="departure_date_start" value="${searchMap.departure_date_start}">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <div class="inputbox_input">
                    <input type="date" placeholder="2022-01-22" name="departure_date_end" value="${searchMap.departure_date_end}">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
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
                    <th><input type="checkbox"></th>
                    <th>비행번호</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>탑승일</th>
                    <th>출발시간</th>
                    <th>도착시간</th>
                    <th>기종</th>
                    <th>상태</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="route" items="${routeList}">
            		<fmt:parseDate value="${route.departure_date}" var="departure_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<fmt:parseDate value="${route.arrival_date}" var="arrival_date" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<tr>
	                    <td><input type="checkbox"></td>
	                    <td><a href="#">${route.route_num}</a></td>
	                    <td>${route.departure_name}</td>
	                    <td>${route.arrival_name}</td>
 	                    <td><fmt:formatDate value="${departure_date}" pattern="yyyy-MM-dd" /></td>
	                    <td><fmt:formatDate value="${departure_date}" pattern="HH:mm" /></td>
	                    <td><fmt:formatDate value="${arrival_date}" pattern="HH:mm" /></td>
	                    <td>보잉 787</td>
	                    <td>
	                        <button class="btn_s status status_wait">대기</button>
	                    </td>
	                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
	                </tr>
            	</c:forEach>             
            </tbody>
        </table>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button class="btn danger">선택삭제</button>
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
    <!-- flight status E -->   
    </div>
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 

<script>
	function pagingFormSubmit(currentPage) {
		
		const form = document.getElementById("search_detail");
		const page = document.getElementById("page");
		
		page.value = currentPage;
		form.submit();
	}
</script>