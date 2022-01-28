<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- reservation status S -->
    <section class="reservation_status item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>예약현황</h2>
            <div class="action">
                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->
        <form action="#" class="search_detail">
            <div class="inputbox term">
                <p class="inputbox_title">출발일</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox term">
                <p class="inputbox_title">예약일</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">출발지</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="도시 혹은 공항">
                    <span class="inputbox_icon"><i class="fas fa-plane-departure"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">도착지</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="도시 혹은 공항">
                    <span class="inputbox_icon"><i class="fas fa-plane-arrival"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">비행번호 </p>
                <div class="inputbox_input">
                    <input type="text" placeholder="FA1001">
                    <span class="inputbox_icon"><i class="fas fa-plane"></i></span>
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
                    <th><input type="checkbox"></th>
                    <th>예약번호</th>
                    <th>승객</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>출발일</th>
                    <th>예약일</th>
                    <th>타입</th>
                    <th>결제가격</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">R10001</a></td>
                    <td><a href="#">홍길동</a></td>
                    <td>부산</td>
                    <td>인천</td>
                    <td>2022-03-01</td>
                    <td>2022-03-01</td>
                    <td>왕복</td>
                    <td>431,000 원</td>
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
    <!-- reservation status E -->   
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
