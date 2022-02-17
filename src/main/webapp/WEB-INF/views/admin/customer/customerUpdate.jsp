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
            <h2>회원수정</h2>
            <form class="update_customer">
	            <div class="inputbox">
	                <p class="inputbox_title">아이디</p>
	                <div class="inputbox_input">
	                    <input type="text" name="customer_id" disabled="disabled">
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title">이름</p>
	                <div class="inputbox_input">
	                    <input type="text" name="customer_name" disabled="disabled">
	                </div>
	            </div>
	            <div class="inputbox">
                    <p class="inputbox_title">생년월일</p>
                    <div class="inputbox_input">
                        <input type="date" name="customer_birth" />
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">국적</p>
                    <div class="inputbox_input selectbox">
                        <select name="customer_country">
                            <option>대한민국</option>
                        </select>
                    </div>
                </div> 
	            <div class="inputbox">
                    <p class="inputbox_title">성별</p>
                    <div class="inputbox_input selectbox">
                        <select name="customer_gender">
                            <option>남자</option>
                            <option>여지</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">등급</p>
                    <div class="inputbox_input selectbox">
                        <select name="customer_grade">
                            <option>일반</option>
                            <option>실버</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
	                <p class="inputbox_title" >이메일</p>
	                <div class="inputbox_input">
	                    <input type="text" name="customer_email">
	                </div>
	            </div>
	            <div class="inputbox">
	                <p class="inputbox_title" >전화번호</p>
	                <div class="inputbox_input">
	                    <input type="text" name="customer_phone">
	                </div>
	            </div>
                <div class="inputbox width100">
	                <p class="inputbox_title" >주소</p>
	                <div class="inputbox_input">
	                    <input type="text" name="customer_address">
	                </div>
	            </div>
                <div class="submit">
                    <input type="submit" value="수정하기" onclick="">
                </div>
            </form>
    </section>
    <!-- modal E -->  
<script>
</script>
</body>
</html>