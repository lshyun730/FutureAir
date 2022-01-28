<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
        <form action="#" class="search_detail">
            <div class="inputbox">
                <p class="inputbox_title">이름</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="홍길동">
                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">아이디</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="future123">
                    <span class="inputbox_icon"><i class="fas fa-portrait"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">이메일</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="future@gmail.com">
                    <span class="inputbox_icon"><i class="fas fa-envelope"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">전화번호</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="01012341234">
                    <span class="inputbox_icon"><i class="fas fa-phone"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">성별</p>
                <div class="inputbox_input">
                    <select>
                        <option value="전체" selected>전체</option>
                        <option value="도착">남자</option>
                        <option value="비행">여자</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">등급</p>
                <div class="inputbox_input">
                    <select>
                        <option value="전체" selected>일반</option>
                        <option value="도착">실버</option>
                        <option value="비행">골드</option>
                        <option value="대기">플래티늄</option>
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
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
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
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">홍길동</a></td>
                    <td>hong123</td>
                    <td>hong123@gmail.com</td>
                    <td>010-1234-1234</td>
                    <td>남성</td>
                    <td>32</td>
                    <td>한국</td>
                    <td>일반회원</td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
            </tbody>
        </table>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button class="btn danger">선택삭제</button>
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
