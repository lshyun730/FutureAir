<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- flight status S -->   
    <section class="flight_status item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>비행일정</h2>
            <div class="action">
                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
                <button class="btn primary">비행추가</button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="#" class="search_detail">
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
            <div class="inputbox">
                <p class="inputbox_title">상태</p>
                <div class="inputbox_input">
                    <select name="status">
                        <option value="전체" selected>전체</option>
                        <option value="도착">도착</option>
                        <option value="비행">비행</option>
                        <option value="대기">대기</option>
                        <option value="취소">취소</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
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
                    <th>비행번호</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>탑승일</th>
                    <th>출발시간</th>
                    <th>도착시간</th>
                    <th>기종</th>
                    <th>상태</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">FA0132</a></td>
                    <td>부산</td>
                    <td>인천</td>
                    <td>2022-03-01</td>
                    <td>13:20</td>
                    <td>14:20</td>
                    <td>보잉 787</td>
                    <td>
                        <button class="btn_s status status_wait">대기</button>
                    </td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">FA0132</a></td>
                    <td>부산</td>
                    <td>인천</td>
                    <td>2022-03-01</td>
                    <td>13:20</td>
                    <td>14:20</td>
                    <td>보잉 787</td>
                    <td>
                        <button class="btn_s status status_cancle">취소</button>
                    </td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">FA0132</a></td>
                    <td>부산</td>
                    <td>인천</td>
                    <td>2022-03-01</td>
                    <td>13:20</td>
                    <td>14:20</td>
                    <td>보잉 787</td>
                    <td>
                        <button class="btn_s status status_flight">비행</button>
                    </td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">FA0132</a></td>
                    <td>부산</td>
                    <td>인천</td>
                    <td>2022-03-01</td>
                    <td>13:20</td>
                    <td>14:20</td>
                    <td>보잉 787</td>
                    <td>
                        <button class="btn_s status status_arrive">도착</button>
                    </td>
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
