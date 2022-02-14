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
    <section class="content flight_status width100">
    	<div class="inner">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>비행일정</h2>
            <div class="action">
                <button class="btn_s dropdown btn_search_detail">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
                <button class="btn primary" onclick="javascript:modalOpen()">비행추가</button>
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
	                    <td><a href="javascript:popupOpen('flightView?route_num=${route.ROUTE_NUM}', 1000, 500)">${route.ROUTE_NUM}</a></td>
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
                                    <li><a href="#">삭제</a></li> 
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
				<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}"> class="active"</c:if>>${counter}</a>
			</c:forEach>
           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
           </div>
        </div>
        <!-- content footer E --> 
        </div>
    </section>
    <!-- flight status E -->   
    </div>
    <!-- modal S -->  
    <section class="modal" id="modal">
        <div class="modal_wrap">
            <h2>비행일정추가</h2>
            <form class="flight_insert" id="flight_insert" onsubmit="return flightInsert()">
            <div class="inputbox">
                <p class="inputbox_title">도착지</p>
                <div class="inputbox_input selectbox">
                     <select name="departure_name" onchange="changeSelect(this)" id="departure_name">
                     	<option value="" disabled selected>도시 혹은 공항</option>
                     	<c:forEach var="continent" items="${destinationList}">
               				<optgroup label="${continent[0].continents}">
               				<c:forEach var="destination" items="${continent}">
						        <option value="${destination.airport_name}" >${destination.airport_name} / ${destination.airport_id}</option>
               				</c:forEach>
               				</optgroup>
				        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발지</p>
                <div class="inputbox_input selectbox">
                    <select name="arrival_name" onchange="changeSelect(this)" id="arrival_name">
                    	<option value="" disabled selected>도시 혹은 공항</option>
                    	<c:forEach var="continent" items="${destinationList}">
               				<optgroup label="${continent[0].continents}">
               				<c:forEach var="destination" items="${continent}">
						        <option value="${destination.airport_name}" <c:if test="${destination.airport_name eq route.arrival_name}">selected="selected"</c:if> >${destination.airport_name} / ${destination.airport_id}</option>
               				</c:forEach>
               				</optgroup>
				        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발날짜</p>
                <div class="inputbox_input">
                    <input type="date" name="departure_date">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발시간</p>
                <div class="inputbox_input">
                    <input type="time" name="departure_time">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착날짜</p>
                <div class="inputbox_input">
                    <input type="date" name="arrival_date">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착시간</p>
                <div class="inputbox_input">
                    <input type="time" name="arrival_time">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">비행기ID</p>
                <div class="inputbox_input selectbox">
                    <select name="airplane_id">
                    	<c:forEach var="plane" items="${planeList}">
	                    	<option value="${plane.airplane_id}">${plane.airplane_id}</option>
                    	</c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">이코노미 가격</p>
                <div class="inputbox_input">
                    <input type="number" name="normal_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">프레스티지 가격</p>
                <div class="inputbox_input">
                    <input type="number" name="prestige_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">일등석 가격</p>
                <div class="inputbox_input">
                    <input type="number" name="first_price" value="${route.normal_price}">
                </div>
            </div>
            <div class="submit">
                <input type="submit" value="수정하기" onclick="">
            </div>
        </form>
            <button class="close" onclick="javascript:modalClose()"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal E --> 
</section>
<!-- content E -->
<script>

//선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deleteRoute',
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

function flightInsert() {
	const form = $('#flight_insert').serialize();
	console.log(form);
 	$.ajax({
	    type: 'POST',
	    url: 'flightInsert',
	    data: $('#flight_insert').serialize(),
	    success: function (data) {
	        //성공시로직
	    },
	    error: function (xhr, status, error) {
	        console.log(error,xhr,status );
	    },
	}); 
}

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

