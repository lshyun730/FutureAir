<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- mypage S -->
<section class="inner content">
    <h2>마이페이지</h2>
    <div class="mypage_main">
        <div class="customer_info">
            <div class="profile">
                <p class="customer_name">홍길동님 <span>hong123</span></p>
            </div>
            <ul class="customer_info_list">
                <li>등급 <span>일반</span></li>
                <li>마일리지 <span>10000</span></li>
                <li class="logout"><a href="#">로그아웃</a></li>
            </ul>
        </div>
        <ul class="mypage_nav">
            <li>항공권정보
                <ul class="dep">
                    <li><a href="#">예약내역조회</a></li>
                    <li><a href="#">마일리지조회</a></li>
                </ul>
            </li>
            <li>고객센터
                <ul class="dep">
                    <li><a href="#">1:1 문의내역</a></li>
                    <li><a href="#">자주묻는질문</a></li>
                </ul>
            </li>
            <li>회원정보
                <ul class="dep">
                    <li><a href="#">회원정보수정</a></li>
                    <li><a href="#">회원탈퇴</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div>
        <div class="table_header">
            <h3>최근 예약 내역 <span>최대 5건 까지 노출됩니다</span></h3>
            <a href="#" class="all_link">전체 내역 보기</a>
        </div>
        <table class="table top_boder">
            <thead>
                <tr>
                    <th>예약번호</th>
                    <th>승객</th>
                    <th>출발일</th>
                    <th>출발지</th>
                    <th>도착지</th>
                    <th>예약일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>R00001</td>
                    <td>홍길동 외 1</td>
                    <td>2022-01-01</td>
                    <td>김해</td>
                    <td>김포</td>
                    <td>2022-03-01</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div>
        <div class="table_header">
            <h3>최근 문의 내역 <span>최대 5건 까지 노출됩니다</span></h3>
            <a href="#" class="all_link">전체 내역 보기</a>
        </div>
        <table class="table top_boder">
            <thead>
                <tr>
                    <th>문의내용</th>
                    <th>구분</th>
                    <th>작성일</th>
                    <th>답변유무</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>항공권 예약 관련 문의</td>
                    <td>문의</td>
                    <td>작성일</td>
                    <td>답변유무</td>
                </tr>
            </tbody>
        </table>
    </div>
</section>
<!-- mypage E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  