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
            <li>
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
            <li class="active">
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
	    <section class="content customer_info width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>회원정보</h2>
		            <div class="action">
		                <button class="btn_s dropdown btn_search_detail">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
		            </div>
		        </div>
		        <!-- content header E -->   
		        <!-- search detail S -->   
		        <form action="customerList" class="search_detail active" method="get" id="search_detail">
		            <div class="inputbox icon">
		                <p class="inputbox_title">이름</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_name" name="customer_name" placeholder="홍길동" value="${customer_name}">
		                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
		                </div>
		            </div>
		            <div class="inputbox icon">
		                <p class="inputbox_title">아이디</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_id" name="customer_id" placeholder="future123" value="${customer_id}">
		                    <span class="inputbox_icon"><i class="fas fa-portrait"></i></span>
		                </div>
		            </div>
		            <div class="inputbox icon">
		                <p class="inputbox_title">이메일</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_email" name="customer_email" placeholder="future@gmail.com" value="${customer_email}">
		                    <span class="inputbox_icon"><i class="fas fa-envelope"></i></span>
		                </div>
		            </div>
		            <div class="inputbox icon">
		                <p class="inputbox_title">전화번호</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_phone" name="customer_phone" placeholder="010-1234-1234" value="${customer_phone}">
		                    <span class="inputbox_icon"><i class="fas fa-phone"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">성별</p>
		                <div class="inputbox_input selectbox">
		                    <select id="customer_gender" name="customer_gender">
		                        <option value="전체" <c:if test="${customer_gender eq '전체'}">selected</c:if> >전체</option>
		                        <option value="남자" <c:if test="${customer_gender eq '남자'}">selected</c:if>>남자</option>
		                        <option value="여자" <c:if test="${customer_gender eq '여자'}">selected</c:if>>여자</option>
		                    </select>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">등급</p>
		                <div class="inputbox_input selectbox">
		                    <select id="customer_grade" name="customer_grade">
		                    	<option value="전체" <c:if test="${customer_grade eq '전체'}">selected</c:if>>전체</option>
		                        <c:forEach var="customerGrade" items="${customerGradeAll}" varStatus="status">
		                        	<c:forEach var="c_g" items="${customerGrade.grade }">
										<option value="${c_g }" <c:if test="${customer_grade eq c_g}">selected</c:if>>${c_g }</option>
		                        	</c:forEach>
		                    	</c:forEach>
		                    </select>
		                </div>
		            </div>
		            <div class="inputbox submit">
		                <div class="inputbox_input">
		                    <input type="submit" value="검색" onclick="pagingFormSubmit(1)">
		                </div>
		            </div>
		            <input type="hidden" name="page" id="page">
		        </form>
		        <!-- content header E -->   
		        <!-- table S --> 
		        <table class="table">
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick='selectAll(this)'></th>
		                    <th>아이디</th>
		                    <th>이름</th>
		                    <th>이메일</th>
		                    <th>전화번호</th>
		                    <th>성별</th>
		                    <th>나이</th>
		                    <th>국적</th>
		                    <th>등급</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
			            <c:if test="${empty customerListAll}">
		            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
		            	</c:if>
		           	 	<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="thisYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>	
						<c:forEach var="customerList" items="${customerListAll}" varStatus="status">		
							<tr>
								<td><input type="checkbox" name="tableSelect" value="${customerList.customer_id}"></td>
								<td><a href="javascript:popupOpen('customerInfo?id=${customerList.customer_id}', 1000, 600)">${customerList.customer_id }</a></td>
								<td>${customerList.customer_name }</td>
								<td>${customerList.customer_email }</td>
								<td>${customerList.customer_phone }</td>
								<td>${customerList.customer_gender }</td>
								<td>
									<fmt:parseNumber var="birth" type="number" integerOnly="true" value="${customerList.customer_birth / 10000}" />
									<c:set var= "result" value="${thisYear - birth}"/> ${result}
								</td>
								<td>${customerList.customer_country }</td>
								<td>${customerList.customer_grade }</td>
								<td class="more">
		                            <div class="btn_m_wrap" onclick="click_more(this)">
		                                <div class="btn_m">
		                                    <span></span>
		                                </div>
		                                <ul class="select_list">
		                                    <li><a href="javascript:popupOpen('customerUpdate?customer_id=${customerList.customer_id}', 550, 680)">수정</a></li> 
		                                    <li><a href="javascript:actionDelete('${customerList.customer_id }')">삭제</a></li> 
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
		            <button type="submit" form="data" class="btn danger" onClick="javascript:checkDelete(this)">선택삭제</button>
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
</section>
<!-- content E --> 
<script>
//선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'customerDelete',
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

//액션창 회원 삭제
function actionDelete(customer_id){
	if(customer_id.lengh != 0){
		const deleteList = new Array();
		deleteList.push(customer_id);
		deleteAjax(deleteList);
	} else {
		alert("삭제에 실패하였습니다.");
	}
}

//상세검색
const btnSearchDetail = document.querySelector(".btn_search_detail");
btnSearchDetail.addEventListener("click", searchDetail);

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
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
