<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <title>미래항공 관리자페이지</title>
</head>
<body>
<!-- header S -->  
<header class="header">
    <h1 class="logo"><a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="FUTURE AIR"></a></h1>
    <nav class="gnb">
        <ul>
            <span class="gnb_txt">GENERAL</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin">홈
                    <span class="icon"><i class="fas fa-home"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">FLIGHT</span>
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin/flight/flightList">비행일정
                    <span class="icon"><i class="fas fa-plane"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/reservationList">예약현황
                    <span class="icon"><i class="fas fa-clipboard-list"></i></span>
                </a>
            </li>
            
            <span class="gnb_txt">CUSTOMER</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerGrade">회원등급
                    <span class="icon"><i class="fas fa-arrow-circle-up"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/sendMail">메일발송
                    <span class="icon"><i class="fas fa-envelope"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">BOARD</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/postList">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/boardList">게시판설정
                    <span class="icon"><i class="fas fa-cog"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- header E -->  
<!-- util S -->  
<div class="util contents">
    <div class="row">
        <div class="search_box">
            <form action="#" class="search item">
                <span class="search_icon"><i class="fas fa-search"></i></span>
                <input type="search_text" name="search" placeholder="Search for...">
            </form>
        </div>
        
        <div class="info">
            <button class="bell" onclick="location.href='${pageContext.request.contextPath}/'"></button>
            <div class="profile">
                <div class="profile_img">
                    <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="profile">
                </div>
                <p>홍길동<span>마스터관리자</span></p>
                <div class="btn_m"><span></span></div>
            </div>
        </div>
    </div>
</div>
<!-- util E -->  
<!-- content S -->   
<section class="contents">
	<div class="row">
    <!-- flight status S -->   
    <section class="content flight_status width100">
    	<div class="inner">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>비행일정</h2>
            <div class="action">
                <button class="btn_s dropdown btn_search_detail">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
                <button class="btn primary" onclick="javascript:popupOpen('flightInsertForm', 1000, 620)">비행추가</button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="${pageContext.request.contextPath}/admin/flight/flightList" class="search_detail active" method="get" id="search_detail">
        	<div class="inputbox term icon">
                <p class="inputbox_title">출발일</p>
                <div class="inputbox_input ">
                    <input type="date" id="departure_date_start" name="departure_date_start" value="${searchMap.departure_date_start}" onchange="checkDate(this)">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox icon">
                <div class="inputbox_input">
                    <input type="date" id="departure_date_end" name="departure_date_end" value="${searchMap.departure_date_end}"  onchange="checkDate(this)">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발지</p>
                <div class="inputbox_input selectbox">
                	<select name="departure_name" onchange="changeSelect(this)" id="departure_name">
                		<option value="" disabled selected>도시 혹은 공항</option>
                			<c:forEach var="continent" items="${destinationList}">
                				<optgroup label="${continent[0].continents}">
                				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.departure_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
                				</c:forEach>
                				</optgroup>
					        </c:forEach>
                	</select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착지</p>
                <div class="inputbox_input selectbox">
                    <select name="arrival_name" onchange="changeSelect(this)"  id="arrival_name">
                    	<option value="" disabled selected>도시 혹은 공항</option>
						<c:forEach var="continent" items="${destinationList}">
               				<optgroup label="${continent[0].continents}">
               				<c:forEach var="destination" items="${continent}">
						        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq searchMap.arrival_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
               				</c:forEach>
               				</optgroup>
				        </c:forEach>
                	</select>
                </div>
            </div>
            <div class="inputbox icon">
                <p class="inputbox_title">비행번호 </p>
                <div class="inputbox_input">
                    <input type="text" placeholder="OT0011" name="route_num" value="${searchMap.route_num}">
                    <span class="inputbox_icon"><i class="fas fa-plane"></i></span>
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
                    <th>비행번호</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>탑승일</th>
                    <th>출발시간</th>
                    <th>도착시간</th>
                    <th>기종</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
            	<c:if test="${empty routeList}">
            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
            	</c:if>
            	<c:forEach var="route" items="${routeList}">
            		<fmt:parseDate value="${route.DEPARTURE_DATE}" var="departure_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<fmt:parseDate value="${route.ARRIVAL_DATE}" var="arrival_date_time" pattern="yyyy-MM-dd HH:mm:ss.S"/>
            		<fmt:formatDate var="departure_date" pattern="yyyy-MM-dd" value="${departure_date_time}"/>
            		<fmt:formatDate var="arrival_date" pattern="yyyy-MM-dd" value="${arrival_date_time}"/>
            		<tr>
	                    <td><input type="checkbox" name="tableSelect" value="${route.ROUTE_NUM}"></td>
	                    <td><a href="javascript:popupOpen('flightView?route_num=${route.ROUTE_NUM}', 1000, 800)">${route.ROUTE_NUM}</a></td>
	                    <td>${route.DEPARTURE_NAME}</td>
	                    <td>${route.ARRIVAL_NAME}</td>
 	                    <td>${departure_date}</td>
	                    <td><fmt:formatDate value="${departure_date_time}" pattern="HH:mm" /></td>
	                    <td><fmt:formatDate value="${arrival_date_time}" pattern="HH:mm" /></td>
	                    <td>${route.AIRPLANE_ID }</td>
	                    <td class="more">
                            <div class="btn_m_wrap" onclick="click_more(this)">
                                <div class="btn_m">
                                    <span></span>
                                </div>
                                <ul class="select_list">
                                    <li><a href="javascript:popupOpen('flightUpdateForm?route_num=${route.ROUTE_NUM}', 1000, 620)">수정</a></li> 
                                    <li><a href="javascript:flightDelete('${route.ROUTE_NUM}')">삭제</a></li> 
                                </ul>
                            </div>
                        </td>
	                </tr>
            	</c:forEach>             
            </tbody>
        </table>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button class="btn danger" onclick="javascript:checkDelete(this)">선택삭제</button>
            <div class="navi">
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
	               <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
				</c:forEach>
	           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
           </div>
        </div>
        <!-- content footer E --> 
        </div>
    </section>
    <!-- flight status E -->   
    </div>
</section>
<!-- content E -->
<script>

//선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'flightDeleteList',
				data : {
					deleteList : deleteList
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data == 1) {
						alert('삭제에 성공하였습니다');		
						location.reload();
					} else if(data == -1) {
						alert('예약되어있는 비행기입니다. 예약을 취소한후 삭제해주세요');
					}
				}
		 }); 				 
	 }
}

function flightDelete(route_num) {
 	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'flightDelete',
				data : {
					route_num : route_num
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data == 1) {
						alert('삭제에 성공하였습니다');		
						location.reload();
					} else{
						alert('예약되어있는 비행기입니다. 예약을 취소한후 삭제해주세요');
					}
				}
		 }); 				 
	 }
}


function flightInsert() {
	const form = $('#flight_insert').serialize();
	console.log(form);
 	$.ajax({
	    type: 'POST',
	    url: 'flightInsert',
	    data: $('#flight_insert').serialize(),
	    success: function (data) {
	    	alert('비행일정이 추가되었습니다')
	    }
	}); 
}

// 상세검색
const btnSearchDetail = document.querySelector(".btn_search_detail");
btnSearchDetail.addEventListener("click", searchDetail);

// 액션 이외 선택시 액션 닫힘
document.addEventListener('click', () => {;
	var btn_m_wrap = document.getElementsByClassName('btn_m_wrap');
	for(let i=0; i < btn_m_wrap.length; i ++) {
    	if (btn_m_wrap[i].classList.contains('active')) {
        	btn_m_wrap[i].classList.remove('active');
    	}	
	}
})
</script>

<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 

