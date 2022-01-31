<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- login S-->
<section class="login tab_menu">
    <h2>로그인</h2>
    <input id="tab1" type="radio" name="tab" class="tab_list" checked><label for="tab1" class="tab_label">로그인</label>
    <input id="tab2" type="radio" name="tab" class="tab_list"><label for="tab2" class="tab_label">비회원 예약조회</label>
    <div class="tab_contents">
        <div class="loginForm" id="content1">
            <form action="#" method="post">
                <input type="text" placeholder="아이디">
                <input type="password" placeholder="비밀번호">
                <input type="submit" value="로그인">
            </form>
            <ul class="login_info">
                <li><a href="#">아이디찾기</a></li>
                <li><a href="#">비밀번호찾기</a></li>
                <li><a href="#">회원가입</a></li>
            </ul>
            <ul class="sns_login">
                <li><a href="#" id="naver">네이버</a></li>
                <li><a href="#" id="kakao">카카오</a></li>
                <li><a href="#" id="google">구글</a></li>
            </ul>
        </div>
        <div class="findReserForm" id="content2">
            <form action="#" method="post" class="findReserForm">
                <input type="text" placeholder="예약번호">
                <input type="password" placeholder="예약자 이름">
                <input type="submit" value="예약조회">
            </form>
        </div>
    </div>
</section>
<!-- login E-->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  