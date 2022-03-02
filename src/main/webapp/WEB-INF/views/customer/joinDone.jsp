<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- join S-->
<section class="join">
    <ul class="steps">
        <li>약관동의</li>
        <li>정보입력</li>
        <li class="active">가입완료</li>
    </ul>
    <h2><span class="name">${newId }(${newName })</span>님 환영합니다! 회원가입이 완료되었습니다.</h2>
    <div class="btn_wrap">
        <button class="btn_primary light" onclick="location.href='/future'">홈으로</button>
        <button class="btn_primary" onclick="location.href='login'">로그인</button>
    </div>
</section>
<!-- join E-->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  