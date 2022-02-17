<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <h2>등급수정</h2>
            <form action="customerGradeUpdate" method="get" class="update_customer" onsubmit="return gradeUpdateSet();">
	            <div class="inputbox">
                    <p class="inputbox_title">등급이름</p>
                    <div class="inputbox_input">
                        <input type="text" id="grade" name="grade" placeholder="일반등급" oninput='checkGrade();' value="${gradeSet.grade }" readonly>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">마일리지 유효기간 (년)</p>
                    <div class="inputbox_input">
                        <input type="number" id="mileage_exp" name="mileage_exp" placeholder="1" value="${gradeSet.mileage_exp }">
                    </div>
                </div>
                <div class="inputbox term">
                    <p class="inputbox_title">마일리지적립 (~원 이상 결제시 ~% 적립)</p>
                    <div class="inputbox_input">
                        <input type="number" id="mileage_scope" name="mileage_scope" placeholder="100000" value="${gradeSet.mileage_scope }">
                    </div>
                </div>
                <div class="inputbox ">
                    <div class="inputbox_input">
                        <input type="number" id="mileage_ratio" name="mileage_ratio" placeholder="5" value="${gradeSet.mileage_ratio }">
                    </div>
                </div>
                <div class="inputbox term">
                    <p class="inputbox_title">결제할인 (~원 이상 결제시 ~% 할인)</p>
                    <div class="inputbox_input">
                        <input type="number" id="pay_scope" name="pay_scope" placeholder="100000" value="${gradeSet.pay_scope }">
                    </div>
                </div>
                <div class="inputbox">
                    <div class="inputbox_input">
                        <input type="number" id="pay_ratio" name="pay_ratio" placeholder="1" value="${gradeSet.pay_ratio }">
                    </div>
                </div>
				<div class="inputbox">
                    <p class="inputbox_title">승급 조건</p>
                    <div class="inputbox_input">
                        <input type="number" id="promo_terms" name="promo_terms" placeholder="10,000,000" value="${gradeSet.promo_terms }">
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="수정하기">
                </div>
            </form>
    </section>
    <!-- modal E -->  
<script>
	function gradeUpdateSet(){
		const grade = document.getElementById('grade').value;
		const mileage_scope = document.getElementById('mileage_scope').value;
		const mileage_ratio = document.getElementById('mileage_ratio').value;
		const mileage_exp = document.getElementById('mileage_exp').value;
		const pay_scope = document.getElementById('pay_scope').value;
		const pay_ratio = document.getElementById('pay_ratio').value;
		const promo_terms = document.getElementById('promo_terms').value;

		if(grade == "" || mileage_scope == "" || mileage_ratio == "" || mileage_exp == ""
			|| pay_scope == "" || pay_ratio == "" || promo_terms == ""){
			alert("값을 모두 채워 주십시오."); return false;
		}
		opener.parent.location.reload();
		return true;
	}

	

</script>
</body>
</html>