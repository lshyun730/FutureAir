<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Script S -->
<script type="text/javascript">
	function search(){
		var name 	= document.getElementById("customer_name");
		var id 		= document.getElementById("customer_id");
		var email 	= document.getElementById("customer_email");
		var phone 	= document.getElementById("customer_phone");
		var gender 	= document.getElementById("customer_gender");
		var grade 	= document.getElementById("customer_grade");

		if(name.value == "" && id.value == "" && email.value == "" && phone.value == ""){
			alert("최소한 하나 이상의 값을 입력해주시길 바랍니다."); return false;
		}
		return true;
	}

	function fullCheck(fullChecker){
		var fullCheck 	= document.getElementsByName("customer_checkbox");
		fullCheck.forEach((checkbox) => {checkbox.checked = fullChecker.checked;});
	}

	function checkDelete(){
		var checkbox 	= document.getElementsByName("customer_checkbox");
		var question	= false;
		
		for (var i = 0; i < checkbox.length; i++){
			if(checkbox[i].checked == true){ 
				question = true;
			}
		}
		if (question == false){ alert("하나 이상을 체크해주시길 바랍니다."); return false; }
		if (!confirm("정말 삭제하시겠습니까? 삭제 시 마일리지 및 예약 항목도 함께 삭제됩니다.")){ 
			return false;
		}
		return true;
		
	}

</script>
<!-- Script E -->

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- flight status S -->   
    <section class="customer_info item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>회원정보</h2>
            <div class="action">
                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="customerFind" class="search_detail" method="get" onsubmit="return search();">
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
            <div class="inputbox">
                <p class="inputbox_title">이메일</p>
                <div class="inputbox_input">
                    <input type="text" id="customer_email" name="customer_email" placeholder="future@gmail.com">
                    <span class="inputbox_icon"><i class="fas fa-envelope"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">전화번호</p>
                <div class="inputbox_input">
                    <input type="text" id="customer_phone" name="customer_phone" placeholder="01012341234">
                    <span class="inputbox_icon"><i class="fas fa-phone"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">성별</p>
                <div class="inputbox_input">
                    <select id="customer_gender" name="customer_gender">
                        <option value="전체" selected>전체</option>
                        <option value="남자">남자</option>
                        <option value="여자">여자</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">등급</p>
                <div class="inputbox_input">
                    <select id="customer_grade" name="customer_grade">
                        <option value="일반" selected>일반</option>
                        <option value="실버">실버</option>
                        <option value="골드">골드</option>
                        <option value="플래티늄">플래티늄</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox submit">
                <div class="inputbox_input">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- content header E -->   
        <!-- table S --> 
        <form action="customerDelete" method="post" id="data" class="data">
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox" name="customer_checkbox_all" onclick='fullCheck(this);'></th>
                    <th>이름</th>
                    <th>아이디</th>
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
           	 	<c:set var="now" value="<%=new java.util.Date()%>" />
				<c:set var="thisYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>	
				<c:forEach var="customerList" items="${customerListAll }" varStatus="status">		
					<tr>
						<td><input type="checkbox" name="customer_checkbox" value="${customerList.customer_id}"></td>
						<td>
							<a href="<c:url value="customerInfo?id=${customerList.customer_id }"/>" onclick="window.open(this.href, '_blank', 'width=800,height=800');return false;">
							${customerList.customer_name }
							</a>
						</td>
						<td>${customerList.customer_id }</td>
						<td>${customerList.customer_email }</td>
						<td>${customerList.customer_phone }</td>
						<td>${customerList.customer_gender }</td>
						<td>
							<fmt:parseNumber var="birth" type="number" integerOnly="true" value="${customerList.customer_birth / 10000}" />
							<c:set var= "result" value="${thisYear - birth}"/> ${result}
						</td>
						<td>${customerList.customer_country }</td>
						<td>${customerList.customer_grade }</td>
						<td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
					</tr>			
				</c:forEach>
            </tbody>
        </table>
        </form>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button type="submit" form="data" class="btn danger" onClick="return checkDelete();">선택삭제</button>
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
    <!-- flight status E -->   
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
