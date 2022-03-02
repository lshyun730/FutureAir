<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
        	<tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>등록일</th>
	            <th>조회수</th>
        	</tr>
        </thead>
        <tbody>
        	<c:forEach var="post" items="${noticeList }">
	        	<tr>
		            <td>${post.post_index }</td>
		            <td style="text-align: left;">${post.title }</td>
		            <td>${post.post_date }</td>
		            <td>${post.hits }</td>
	        	</tr>
        	</c:forEach>
        </tbody>
    </table>

    <div class="navi">
        <a href="#" class="icon first_prev"></a>
        <a href="#" class="icon prev"></a>
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
        <a href="#" class="icon next"></a>
        <a href="#" class="icon last_next"></a>
    </div>
</section>
<!-- notice E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  