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
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li class="active">
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
<section class=" contents">
	<div class="row">
	    <!-- customer grade S -->
	    <section class="content width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>회원등급</h2>
		            <div class="action">
		                <button class="btn danger" form="gradeTable" onclick='javascript:gradeDeleter(this);'>선택삭제</button>
		                <button class="btn primary" onclick='modalOpen();'>등급추가</button>
		            </div>
		        </div>
		        <!-- content header E -->   
		        <!-- table S --> 
		        <table class="table">
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick='selectAll(this)'></th>
		                    <th>회원등급</th>
		                    <th>마일리지 유효기간</th>
		                    <th>마일리지적립</th>
		                    <th>결제할인</th>
		                    <th>회원수</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="customerGrade" items="${customerGradeAll }" varStatus="status">		
							<tr>
								<td><input type="checkbox" name="tableSelect" value="${customerGrade.grade}"></td>
								<td>${customerGrade.grade }</td>
								<td>${customerGrade.mileage_exp }년</td>
								<td>${customerGrade.mileage_scope }원 이상 결제 시 ${customerGrade.mileage_ratio }% 적립</td>
								<td>
									<c:choose>
										<c:when test="${customerGrade.pay_ratio == 0}" >-</c:when>
										<c:otherwise>${customerGrade.pay_scope }원 이상 결제 시 ${customerGrade.pay_ratio }% 적립</c:otherwise>
									</c:choose>
								</td>
								<td>${customerGrade.the_count }</td>
								<td class="more">
		                            <div class="btn_m_wrap" onclick="click_more(this)">
		                                <div class="btn_m">
		                                    <span></span>
		                                </div>
		                                <ul class="select_list">
		                                    <li><a href="javascript:popupOpen('customerGradeUpdate?grade=${customerGrade.grade}', 550, 600)">수정</a></li> 
		                                    <li><a href="javascript:gradeDeletePoint('${customerGrade.grade}')">삭제</a></li> 
		                                </ul>
		                            </div>
		                        </td>
							</tr>			
						</c:forEach>
		            </tbody>
		        </table>
		        <!-- table E --> 
	        </div>
	    </section>
	    <!-- customer grade E -->   
	</div>
	<div class="row">
	    <!-- customer list S -->
	    <section class="content width100">
	    	<div class="inner">
		        <!-- content header S --> 
		        <div class="flex_content_header">
		            <h2>회원등급별 회원관리</h2>
		        </div>
		        <!-- content header E -->   
		        <!-- search detail S -->   
		        <form action="customerGrade" id="search_detail" class="search_detail active" method="get" onsubmit="return search()">
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
		            <div class="inputbox submit">
		                <div class="inputbox_input">
		                    <input type="submit" value="검색" onclick='pagingFormSubmit(1);'>
		                </div>
		            </div>
		            <input type="hidden" name="page" id="page">
		        </form>
		        <!-- search detail E -->   
		        <!-- table S --> 
		        <table class="table">
		            <thead>
		                <tr>
		                    <th><input type="checkbox" name="customer_checkbox_all" onclick='selectAll(this)'></th>
		                    <th>등록일</th>
		                    <th>이름</th>
		                    <th>아이디</th>
		                    <th>성별</th>
		                    <th>나이</th>
		                    <th>등급</th>
		                    <th>관련내역보기</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
		                <c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="thisYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>	
						<c:forEach var="customerList" items="${customerListAll }" varStatus="status">		
							<tr>
								<td><input type="checkbox" name="tableSelect" value="${customerList.customer_id}"></td>
								<td>${customerList.customer_joindate }</td>
								<td>
									<a href="javascript:popupOpen('customerInfo?id=${customerList.customer_id}', 1000, 1000)">
										${customerList.customer_name }
									</a>
								</td>
								<td>${customerList.customer_id }</td>
								<td>${customerList.customer_gender }</td>
								<td>
									<fmt:parseNumber var="birth" type="number" integerOnly="true" value="${customerList.customer_birth / 10000}" />
									<c:set var= "result" value="${thisYear - birth}"/> ${result}
								</td>
								<td>${customerList.customer_grade }</td>
								<td>
									<button class="btn_s more" onclick="javascript:popupOpen('customerReservation?id=${customerList.customer_id}')">
										<span>예약내역</span><span class="icon"><i class="fas fa-chevron-right"></i></span>
									</button>
		                        	<button class="btn_s more" onclick="javascript:popupOpen('customerMileage?id=${customerList.customer_id}')">
		                        		<span>마일리지</span><span class="icon"><i class="fas fa-chevron-right"></i></span>
		                        	</button>
								</td>
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
		            <div>
		                <button class="btn_s more" onclick="popupOpen('mileageListInsertForm', 550, 300)">마일리지 일괄적립</button>
		                <button class="btn_s more" onclick="popupOpen('GradeListUpdateForm', 300, 300)">등급변경</button>
		            </div>
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
	        <div class="bg_black"></div>
	    </section>
	    <!-- customer list  E -->   
	</div>
	    <!-- modal 등급추가 S -->  
	    <section class="modal" id="modal">
	        <div class="modal_wrap">
	            <h2>회원등급추가</h2>
	            <form id="gradeAdd" class="create_grade" onsubmit='return gradeAddAjax();'>
	                <div class="inputbox no_icon">
	                    <p class="inputbox_title">등급이름</p>
	                    <div class="inputbox_input">
	                        <input type="text" id="grade" name="grade" placeholder="일반등급" oninput='checkGrade();'>
	                    </div>
	                </div>
	                <div class="inputbox no_icon">
	                    <p class="inputbox_title">마일리지 유효기간 (년)</p>
	                    <div class="inputbox_input">
	                        <input type="number" id="mileage_exp" name="mileage_exp" placeholder="1">
	                    </div>
	                </div>
	                <div class="inputbox no_icon term">
	                    <p class="inputbox_title">마일리지적립 (~원 이상 결제시 ~% 적립)</p>
	                    <div class="inputbox_input">
	                        <input type="number" id="mileage_scope" name="mileage_scope" placeholder="100000">
	                    </div>
	                </div>
	                <div class="inputbox no_icon ">
	                    <div class="inputbox_input">
	                        <input type="number" id="mileage_ratio" name="mileage_ratio" placeholder="5">
	                    </div>
	                </div>
	                <div class="inputbox term no_icon ">
	                    <p class="inputbox_title">결제할인 (~원 이상 결제시 ~% 할인)</p>
	                    <div class="inputbox_input">
	                        <input type="number" id="pay_scope" name="pay_scope" placeholder="100000">
	                    </div>
	                </div>
	                <div class="inputbox no_icon ">
	                    <div class="inputbox_input">
	                        <input type="number" id="pay_ratio" name="pay_ratio" placeholder="1">
	                    </div>
	                </div>
					<div class="inputbox no_icon">
	                    <p class="inputbox_title">승급 조건</p>
	                    <div class="inputbox_input">
	                        <input type="number" id="promo_terms" name="promo_terms" placeholder="10,000,000">
	                    </div>
	                </div>
	                <div class="submit">
	                    <input type="submit" id="gradeAddButton" value="추가하기">
	                </div>
	            </form>
	            <button class="close" onclick="modalClose();"><i class="fas fa-times"></i></button>
	        </div>
	        <div class="bg_black"></div>
	    </section>
	    <!-- modal 등급추가 E -->  
</section>
<!-- content E --> 
<script>
//액션 이외 선택시 액션 닫힘
document.addEventListener('click', () => {;
	var btn_m_wrap = document.getElementsByClassName('btn_m_wrap');
	for(let i=0; i < btn_m_wrap.length; i ++) {
	 	if (btn_m_wrap[i].classList.contains('active')) {
	     	btn_m_wrap[i].classList.remove('active');
	 	}	
	}
})



// 등급이름 중복체킹을 위한 전역변수
const gradeChecker = false;

// 등급 추가하기
function gradeAddAjax(){
	
	const grade			= document.getElementById("grade");
	const mileage_exp	= document.getElementById("mileage_exp");
	const mileage_scope	= document.getElementById("mileage_scope");
	const mileage_ratio	= document.getElementById("mileage_ratio");
	const pay_scope		= document.getElementById("pay_scope");
	const pay_ratio		= document.getElementById("pay_ratio");
	const promo_terms 	= document.getElementById("promo_terms");

	if (gradeCheker == false){
		alert("등급명이 중복입니다.");	return false;
	}
	
	if (grade.value == "" || mileage_exp.value == "" || mileage_scope.value == "" || mileage_ratio.value == ""
		|| pay_scope.value == "" || pay_ratio.value == "" || promo_terms.value == "") {
		alert("값을 빠짐없이 입력해주시길 바랍니다."); 						return false;
	}
	
	if(isNaN(mileage_exp.value) == true || isNaN(mileage_scope.value) == true || isNaN(mileage_ratio.value) == true
			|| isNaN(pay_scope.value) == true || isNaN(pay_ratio.value) == true){
		alert("등급 명칭을 제외한 나머지는 숫자로 입력해 주시길 바랍니다."); 		return false;
	}
	
	 $.ajax({
			url : 'gradeAddAjax',
			data : $("#gradeAdd").serialize(),
			traditional : true, 
			type : 'post',
			success : function(data) {
				if(data == 1) {
					alert('등급 추가가 완료되었습니다.');
					location.reload();
				}
			}
	 }); 				 
}	

//등급 명칭 중복 검사하기
function checkGrade(){
	const inputGrade = $("#grade").val();
	$.ajax({
		data 	: { grade : inputGrade },
		url		: "checkGradeName",
		type	: "post",
		dataType : "text",
		success	: function(data) {
				if (data != '0'){
					gradeCheker = false;
				} else {
					gradeCheker = true;
				}
		}
	})
}

//선택삭제
function deleteAjax(deleteList) {
	
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'customerDelete',
				data : { deleteList : deleteList },
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


// 등급 삭제(선택 삭제 부분)
function gradeDeleter(deleteBox) {
	 const content 		= deleteBox.closest('.content'); 
	 const checkboxes 	= content.querySelectorAll('input[name="tableSelect"]');
	 const deleteList 	= new Array();

	 checkboxes.forEach(checkbox => {
		 if(checkbox.checked) deleteList.push(checkbox.value);
	 })
	
	 if(checkboxes.length == deleteList.length){
		 alert("삭제를 위해서는 최소한 한 개 이상의 등급이 남아있어야 합니다.");
	 } else if(deleteList.length == 0) {
		alert("선택된 항목이 없습니다");
	 } else {
		gradeDeletePoint(deleteList);
	 }
}
// 액션창 등급 삭제
function gradeDeletePoint(deleteGrade) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'gradeDelete',
				data : {deleteList : deleteGrade},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data == 1000) {
						alert('삭제를 위해서는 최소한 한 개 이상의 등급은 남아있어야 합니다.');
					} else if(data != 0){
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
