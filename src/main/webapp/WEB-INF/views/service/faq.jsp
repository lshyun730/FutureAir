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
		<li><a href="#">자주묻는질문</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- faq S -->
<section class="content inner faq">
    <h2>자주묻는질문</h2>
    <ul class="faq_nav title_box">
    	<c:forEach var="type" items="${postType}">
	        <li><a href="#${type}">${type}</a></li>
    	</c:forEach>
    </ul>
   	<c:forEach var="faqType" items="${faqList}">
	    <div>
	        <h3 id="${faqType[0].post_type }">${faqType[0].post_type }</h3>
	        <table class="faq_list table top_boder">
	        	<c:forEach var="post" items="${faqType}">
		            <tr>
		                <td onclick="faqToggle(this)">
		                    <p class="quest">${post.title}</p>
 		                    <div class="answer">${post.contents }</div>
		                </td>
		            </tr>
	        	
	        	</c:forEach>
	        </table>
	    </div>
   	</c:forEach>
</section>
<!-- faq E -->
<script>
	function faqToggle(element) {
		element.classList.toggle("active");
	}
</script>
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  