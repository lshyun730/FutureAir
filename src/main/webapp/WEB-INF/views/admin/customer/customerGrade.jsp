<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class=" contents grid">
    <!-- customer grade S -->
    <section class="item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>회원등급</h2>
            <div class="action">
                <button class="btn primary">등급추가</button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- table S --> 
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>회원등급</th>
                    <th>마일리지적립</th>
                    <th>마일리지 유효기간</th>
                    <th>결제할인</th>
                    <th>회원수</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td><a href="#">일반등급</a></td>
                    <td>100,000원 이상 결제시 5% 적립</td>
                    <td>10년</td>
                    <td>300,000원 이상 결제시 0% 할인</td>
                    <td>10,039</td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
            </tbody>
        </table>
        <!-- table E --> 
    </section>
    <!-- customer grade E -->   
    <!-- customer list S -->
    <section class="item fullwidth">
        <!-- content header S --> 
        <div class="flex_content_header">
            <h2>회원등급별 회원관리</h2>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="#" class="search_detail">
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
                    <th>등록일</th>
                    <th>이름</th>
                    <th>아이디</th>
                    <th>성별</th>
                    <th>나이</th>
                    <th>등급</th>
                    <th>관련내역보기</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>2021-03-01</td>
                    <td><a href="#">김개똥</a></td>
                    <td>kim01</td>
                    <td>남성</td>
                    <td>30</td>
                    <td>일반등급</td>
                    <td>
                        <button class="btn_s more"><span>예약내역</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more"><span>마일리지</span><span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>       
            </tbody>
        </table>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <div>
                <button class="btn_s more">마일리지 일괄적립</button>
                <button class="btn_s more">등급변경</button>
            </div>
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
    <!-- customer list  E -->   
    <!-- modal S -->  
    <section class="modal">
        <div class="modal_wrap">
            <h2>회원등급추가</h2>
            <form action="#" class="create_grade">
                <div class="inputbox no_icon">
                    <p class="inputbox_title">등급이름</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="일반등급">
                    </div>
                </div>
                <div class="inputbox no_icon">
                    <p class="inputbox_title">마일리지 유효기간 (년)</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="1">
                    </div>
                </div>
                <div class="inputbox no_icon term">
                    <p class="inputbox_title">마일리지적립 (~원 이상 결제시 ~% 적립)</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="100000">
                    </div>
                </div>
                <div class="inputbox no_icon ">
                    <div class="inputbox_input">
                        <input type="text" placeholder="5">
                    </div>
                </div>
                <div class="inputbox term no_icon ">
                    <p class="inputbox_title">결제할인 (~원 이상 결제시 ~% 할인)</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="100000">
                    </div>
                </div>
                <div class="inputbox no_icon ">
                    <div class="inputbox_input">
                        <input type="text" placeholder="1">
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="추가하기">
                </div>
            </form>
            <button class="close"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal E -->  
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
