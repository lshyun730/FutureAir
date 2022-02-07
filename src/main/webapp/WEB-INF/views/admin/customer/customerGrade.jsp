<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Script S -->
<script type="text/javascript">
	//회원등급 검색 시 사용
	/*
	function search(){
		const name 		= document.getElementById("customer_name");
		const id 		= document.getElementById("customer_id");
		const grade 	= document.getElementById("customer_grade");
		return true;
	}*/

	// 체크박스 전체 체크하기
	function fullCheckGrade(fullChecker){
		const fullCheck 	= document.getElementsByName("grade_checkbox");
		fullCheck.forEach((checkbox) => {checkbox.checked = fullChecker.checked;});
	}
	function fullCheckCustomer(fullChecker){
		const fullCheck 	= document.getElementsByName("customer_checkbox");
		fullCheck.forEach((checkbox) => {checkbox.checked = fullChecker.checked;});
	}

	// 모달창 Open/Close
	function modalOpen(){ document.getElementById("modal").style.display = 'flex'; }
	function modalClose(){ document.getElementById("modal").style.display = 'none'; }

	// 등급 추가하기
	function gradeAdd(){
		const grade			= document.getElementById("grade");
		const mileage_exp	= document.getElementById("mileage_exp");
		const mileage_scope	= document.getElementById("mileage_scope");
		const mileage_ratio	= document.getElementById("mileage_ratio");
		const pay_scope		= document.getElementById("pay_scope");
		const pay_ratio		= document.getElementById("pay_ratio");
		const promo_terms 	= document.getElementById("promo_terms");

		if (grade.value == "" || mileage_exp.value == "" || mileage_scope.value == "" || mileage_ratio.value == ""
			|| pay_scope.value == "" || pay_ratio.value == "" || promo_terms.value == "") {
			alert("값을 빠짐없이 입력해주시길 바랍니다."); 	return false;
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
				if (data == '0'){
					$("#gradeAddButton").attr("disabled", false);
				} else {
					alert("방금 입력하신 등급명은 중복입니다. 등급명은 중복된 값을 사용할 수 없습니다.");
					$("#gradeAddButton").attr("disabled", true);
				}
				}
			}
		)
	}

	/*
	function checkGrade(){

		const inputGrade = document.getElementById("grade");
		const xhr = new XMLHttpRequest();
		const formData = new FormData();
		formData.append('grade', inputGrade);
		xhr.open(method, url);
		
		xhr.open('POST', 'checkGradeName' true);
		xhr.send(formData);
		xhr.onload = () => {
			if(xhr.status == '0'){
				console.log("전송성공");
			} else if(xhr.status == '1'){
				console.log("전송성공");
			} else {
				console.log("전송실패");
			}
		}
	}*/



</script>
<!-- Script E -->




<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class=" contents grid">
    <!-- customer grade S -->
    <section class="item fullwidth">
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
                    <th><input type="checkbox" name="customer_checkbox_all" onclick='fullCheckGrade(this);'></th>
                    <th>회원등급</th>
                    <th>마일리지적립</th>
                    <th>마일리지 유효기간</th>
                    <th>결제할인</th>
                    <th>회원수</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="customerGrade" items="${customerGradeAll }" varStatus="status">		
					<tr>
						<td><input type="checkbox" name="grade_checkbox" value="${customerGrade.grade}"></td>
						<td>${customerGrade.grade }</td>
						<td>${customerGrade.mileage_scope }원 이상 결제 시 ${customerGrade.mileage_ratio }% 적립</td>
						<td>${customerGrade.mileage_exp }년</td>
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
    </section>
    <!-- customer grade E -->   
    <!-- customer list S -->
    <section class="item fullwidth">
        <!-- content header S --> 
        <div class="flex_content_header">
            <h2>회원등급별 회원관리</h2>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="gradeFind" class="search_detail" method="get" onsubmit="return search()">
            <div class="inputbox">
                <p class="inputbox_title">등급</p>
                <div class="inputbox_input">
                    <select id="customer_grade" name="customer_grade">
                        <option value="전체" selected>일반</option>
                        <option value="도착">실버</option>
                        <option value="비행">골드</option>
                        <option value="대기">플래티늄</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">이름</p>
                <div class="inputbox_input">
                    <input type="text" id="customer_name" name="customer_name" placeholder="홍길동">
                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">아이디</p>
                <div class="inputbox_input">
                    <input type="text" id="customer_id" name="customer_id" placeholder="future123">
                    <span class="inputbox_icon"><i class="fas fa-portrait"></i></span>
                </div>
            </div>
            <div class="inputbox submit">
                <div class="inputbox_input">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- search detail E -->   
        <!-- table S --> 
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox" name="customer_checkbox_all" onclick='fullCheckCustomer(this);'></th>
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
						<td><input type="checkbox" name="customer_checkbox" value="${customerList.customer_id}"></td>
						<td>${customerList.customer_joindate }</td>
						<td>
							<a href="#">
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
							<button class="btn_s more"><span>예약내역</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        	<button class="btn_s more"><span>마일리지</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
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
                <a href="#"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><i class="fas fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- content footer E --> 
    </section>
    <!-- customer list  E -->   
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
                    <input type="submit" id="gradeAddButton" disabled="disabled" value="추가하기">
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
