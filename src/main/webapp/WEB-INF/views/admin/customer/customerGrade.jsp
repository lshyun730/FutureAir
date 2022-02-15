<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Script S -->
<script type="text/javascript">
	// 등급이름 중복체킹을 위한 전역변수
	const gradeChecker = false;

	// 등급 추가하기
	function gradeAdd(){
		
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
		
		return true;
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
</script>
<!-- Script E -->

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class=" contents">
	<div class="row">
	    <!-- customer grade S -->
	    <section class="width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>회원등급</h2>
		            <div class="action">
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
								<td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
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
	    <section class="width100">
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
		            <div class="inputbox">
		                <p class="inputbox_title">이름</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_name" name="customer_name" placeholder="홍길동" value="${customer_name}">
		                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
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
									<a href="javascript:popupOpen('customerInfo?id=${customerList.customer_id}')">
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
								<td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
							</tr>			
						</c:forEach>
		            </tbody>
		        </table>
		        <!-- table E --> 
		        <!-- content footer S --> 
		        <div class="flex_content_footer">
		            <div>
		                <button class="btn_s more">마일리지 일괄적립</button>
		                <button class="btn_s more">등급변경</button>
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
	    </section>
	    <!-- customer list  E -->   
	</div>
	    <!-- modal S -->  
	    <section class="modal" id="modal">
	        <div class="modal_wrap">
	            <h2>회원등급추가</h2>
	            <form action="gradeAdd" method="post" class="create_grade" onsubmit='return gradeAdd();'>
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
	    <!-- modal E -->  
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
