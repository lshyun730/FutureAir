<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- breadcrumbs S --> 
<div class="breadcrumbs inner">
	<ul>
		<li><i class="fas fa-home"></i></li>
		<li>서비스</li>
		<li>고객지원</li>
		<li><a href="#">공지사항</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- notice S --> 
<section class="inner content notice">
    <h2>공지사항</h2>
    <div class="title_box">
        <form action="#" method="get" class="searchForm">
            <input type="text" placeholder="검색어 입력">
            <input type="submit" value="검색">
        </form>
    </div>
    <table class="table top_boder">
        <thead>
            <th>번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>조회수</th>
        </thead>
        <tbody>
            <td>201</td>
            <td>사회적 거리두기 강화 관련 국내선 항공권 환불 수수료 면제 안내</td>
            <td>2022-03-01</td>
            <td>101</td>
        </tbody>
    </table>

    <div class="navi">
        <a href="#" class="icon"><img src="${pageContext.request.contextPath}/resources/images/common/ico_first_prev.png" alt="첫페이지이동"></a>
        <a href="#" class="icon"><img src="${pageContext.request.contextPath}/resources/images/common/ico_prev.png" alt="이전페이지이동"></a>
        <a href="#" class="active">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">6</a>
        <a href="#">7</a>
        <a href="#">8</a>
        <a href="#">9</a>
        <a href="#">10</a>
        <a href="#" class="icon"><img src="${pageContext.request.contextPath}/resources/images/common/ico_next.png" alt="다음페이지이동"></a>
        <a href="#" class="icon"><img src="${pageContext.request.contextPath}/resources/images/common/ico_last_next.png" alt="끝페이지이동"></a>
    </div>
</section>
<!-- notice E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  