<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<title>회원수정</title>
</head>
<body style="background: fff">
<!-- popup S -->  
    <section class="popup" id="popup">
            <h2>회원수정</h2>
            <form action="customerUpdate" method="get" class="update_customer" onsubmit="return customerUpdateSet();">
	            <div class="inputbox">
	                <p class="inputbox_title">아이디</p>
	                <div class="inputbox_input">
	                    <input type="text" id="customer_id" name="customer_id" readonly value="${customer.customer_id }">
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title">이름</p>
	                <div class="inputbox_input">
	                    <input type="text" id="customer_name" name="customer_name" readonly value="${customer.customer_name }">
	                </div>
	            </div>
	            <div class="inputbox">
                    <p class="inputbox_title">생년월일</p>
                    <div class="inputbox_input">
                    	<fmt:parseDate value="${customer.customer_birth }" var="birth" pattern="yyyymmdd"/>
                        <input type="date" id="customer_birth" name="customer_birth" value="<fmt:formatDate value="${birth }" pattern="yyyy-MM-dd"/>"/>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">국적</p>
                    <div class="inputbox_input selectbox">
                        <select id="customer_country" name="customer_country">
                            <option <c:if test="${customer.customer_country eq '대한민국'}">selected</c:if>>대한민국</option>
                            <option <c:if test="${customer.customer_country eq '미국'}">selected</c:if>>미국</option>
                        </select>
                    </div>
                </div> 
	            <div class="inputbox">
                    <p class="inputbox_title">성별</p>
                    <div class="inputbox_input selectbox">
                        <select id="customer_gender" name="customer_gender">
                            <option <c:if test="${customer.customer_gender eq '남자'}">selected</c:if> >남자</option>
                            <option <c:if test="${customer.customer_gender eq '여자'}">selected</c:if>>여자</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">등급</p>
                    <div class="inputbox_input selectbox">
                        <select id="customer_grade" name="customer_grade">
                            <c:forEach var="gradeValues" items="${customerGradeAll}" varStatus="status">
	                        	<c:forEach var="theGrade" items="${gradeValues.grade }">
									<option value="${theGrade }" <c:if test="${theGrade eq customer.customer_grade}">selected</c:if>>
										${theGrade }
									</option>
	                        	</c:forEach>
		                    </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
	                <p class="inputbox_title" >이메일</p>
	                <div class="inputbox_input">
	                    <input type="text" id="customer_email" name="customer_email" value="${customer.customer_email }">
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title" >전화번호</p>
	                <div class="inputbox_input">
	                    <input type="text" id="customer_phone" name="customer_phone" value="${customer.customer_phone }">
	                </div>
	            </div>
                <div class="inputbox width100">
	                <p class="inputbox_title" >주소</p>
	                <div class="inputbox_input">
	                    <input type="text" id="customer_address" name="customer_address" value="${customer.customer_address }">
	                </div>
	            </div>
                <div class="submit">
                    <input type="submit" value="수정하기">
                </div>
            </form>
    </section>
    <!-- modal E -->  
<script>
	function customerUpdateSet(){
		
		const id = document.getElementById('customer_id').value;
		const name = document.getElementById('customer_name').value;
		const country = document.getElementById('customer_country').value;
		const gender = document.getElementById('customer_gender').value;
		const grade = document.getElementById('customer_grade').value;
		const email = document.getElementById('customer_email').value;
		const phone = document.getElementById('customer_phone').value;
		const address = document.getElementById('customer_address').value;


		if( id == "" || name == "" || country == "" || gender == "" || grade == ""
			|| email == "" || phone == "" || address == ""){
			alert("빈 값을 넣을 수 없습니다."); return false;
		}

		opener.parent.location.reload();
		return true;
		
	}
</script>
</body>
</html>