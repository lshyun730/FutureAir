<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- join S-->
<section class="join">
    <ul class="steps">
        <li>약관동의</li>
        <li class="active">정보입력</li>
        <li>가입완료</li>
    </ul>
    <h2>미래항공 회원가입을 위한 고객님의 소중한 정보를 입력해 주세요.</h2>
    <form class="join_form">
        <table>
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <tr>
                <th>이름</th>
                <td><input type="text"></td>
            </tr>
            <tr>
                <th>아이디</th>
                <td class="flex">
                    <input type="text">
                    <input type="button" value="중복확인" class="btn_primary white">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password">
                    <input type="password">
                    <p class="desc">8~16자리의 영문 대/소문자, 숫자, 특수문자 중 2개 이상을 조합해서 비밀번호를 설정해 주세요</p>
                </td>
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td class="flex">
                    <input type="number">
                    <input type="button" value="인증하기" class="btn_primary white">
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td><input type="date"></td>
            </tr>
        </table>
        <div class="btn_primary submit">
            <input type="submit" value="가입">
        </div>
    </form>
</section>
<!-- join E-->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  