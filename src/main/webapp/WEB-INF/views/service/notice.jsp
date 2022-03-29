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
        <form action="notice" method="get" class="searchForm" id="search_detail">
            <input type="text" name= "searchText" placeholder="검색어 입력" value="${searchText }">
            <input type="submit" value="검색">
            <input type="hidden" name="page" id="page" />
        </form>
    </div>
    <table class="table top_boder">
    	<colgroup>
    		<col width="15%"/>
    		<col width="55%"/>
    		<col width="15%"/>
    		<col width="15%"/>
    	</colgroup>
        <thead>
        	<tr>
	            <th>번호</th>
	            <th>제목</th>
	            <th>등록일</th>
	            <th>조회수</th>
        	</tr>
        </thead>
        <tbody>	
        	<c:forEach var="post" items="${fixList}">
	        	<tr class="notice_fix">
		            <td>공지</td>
		            <td style="text-align: left;"><a href="#">${post.title }</a></td>
		            <td>${post.post_date }</td>
		            <td>${post.hits }</td>
	        	</tr>
        	</c:forEach>
        	<c:if test="${empty noticeList}">
           		<tr><td colspan="9">검색 결과가 없습니다</td></tr>
           	</c:if>
        	<c:forEach var="post" items="${noticeList}">
	        	<tr>
		            <td>${post.post_index }</td>
		            <td style="text-align: left;"><a href="#">${post.title }</a></td>
		            <td>${post.post_date }</td>
		            <td>${post.hits }</td>
	        	</tr>
        	</c:forEach>
        </tbody>
    </table>
	<div class="navi">
       	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="icon first_prev"></a>
       	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})" class="icon prev"></a>
        <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
		</c:forEach>
       	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})" class="icon next"></a>
       	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="icon last_next"></a>
    </div>
</section>
<!-- notice E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  