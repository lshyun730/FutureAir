<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents">
	<div class="row">
	    <!-- flight status S -->   
	    <section class="customer_info width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>회원정보</h2>
		            <div class="action">
		                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
		            </div>
		        </div>
		        <!-- content header E -->   
		        <!-- search detail S -->   
		        <form action="customerList" class="search_detail active" method="get" id="search_detail">
		            <div class="inputbox">
		                <p class="inputbox_title">이름</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_name" name="customer_name" placeholder="홍길동" value="${customer_name}">
		                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">아이디</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_id" name="customer_id" placeholder="future123" value="${customer_id}">
		                    <span class="inputbox_icon"><i class="fas fa-portrait"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">이메일</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_email" name="customer_email" placeholder="future@gmail.com" value="${customer_email}">
		                    <span class="inputbox_icon"><i class="fas fa-envelope"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">전화번호</p>
		                <div class="inputbox_input">
		                    <input type="text" id="customer_phone" name="customer_phone" placeholder="01012341234" value="${customer_phone}">
		                    <span class="inputbox_icon"><i class="fas fa-phone"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">성별</p>
		                <div class="inputbox_input">
		                    <select id="customer_gender" name="customer_gender">
		                        <option value="전체" <c:if test="${customer_gender eq '전체'}">selected</c:if> >전체</option>
		                        <option value="남자" <c:if test="${customer_gender eq '남자'}">selected</c:if>>남자</option>
		                        <option value="여자" <c:if test="${customer_gender eq '여자'}">selected</c:if>>여자</option>
		                    </select>
		                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">등급</p>
		                <div class="inputbox_input">
		                    <select id="customer_grade" name="customer_grade">
		                    	<option value="전체" <c:if test="${customer_grade eq '전체'}">selected</c:if>>전체</option>
		                        <option value="일반" <c:if test="${customer_grade eq '일반'}">selected</c:if>>일반</option>
		                        <option value="실버" <c:if test="${customer_grade eq '실버'}">selected</c:if>>실버</option>
		                        <option value="골드" <c:if test="${customer_grade eq '골드'}">selected</c:if>>골드</option>
		                        <option value="플래티늄" <c:if test="${customer_grade eq '플래티늄'}">selected</c:if>>플래티늄</option>
		                    </select>
		                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
		                </div>
		            </div>
		            <div class="inputbox submit">
		                <div class="inputbox_input">
		                    <input type="submit" value="검색" onclick="pagingFormSubmit(1)">
		                </div>
		            </div>
		            <input type="hidden" name="page" id="page">
		        </form>
		        <!-- content header E -->   
		        <!-- table S --> 
		        <table class="table">
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick='selectAll(this)'></th>
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
			            <c:if test="${empty customerListAll}">
		            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
		            	</c:if>
		           	 	<c:set var="now" value="<%=new java.util.Date()%>" />
						<c:set var="thisYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set>	
						<c:forEach var="customerList" items="${customerListAll}" varStatus="status">		
							<tr>
								<td><input type="checkbox" name="tableSelect" value="${customerList.customer_id}"></td>
								<td>
									<a href="<c:url value="customerInfo?id=${customerList.customer_id}"/>" onclick="window.open(this.href, '_blank', 'width=800,height=800');return false;">
										${customerList.customer_name }
									</a>
								</td>
								<td>${customerList.customer_id }</td>
								<td>${customerList.customer_email }</td>
								<td>${customerList.customer_phone }</td>
								<td>${customerList.customer_gender }</td>
								<td>
									<fmt:parseNumber var="birth" type="number" integerOnly="true" value="${customerList.customer_birth / 10000}" />
									<c:set var= "result" value="${thisYear - birth}"/> ${result}
								</td>
								<td>${customerList.customer_country }</td>
								<td>${customerList.customer_grade }</td>
								<td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
							</tr>			
						</c:forEach>
		            </tbody>
		        </table>
		        <!-- table E --> 
		        <!-- content footer S --> 
		        <div class="flex_content_footer">
		            <button type="submit" form="data" class="btn danger" onClick="javascript:checkDelete()">선택삭제</button>
		            <div class="navi">
			           	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
		               	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}"> class="active"</c:if>>${counter}</a>
						</c:forEach>
			           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
		           </div>
		        </div>
		        <!-- content footer E --> 
		    </div>
	    </section>
	    <!-- flight status E -->   
	</div>
</section>
<!-- content E --> 
<script>
//선택삭제
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'customerDelete',
				data : {
					deleteList : deleteList
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data==1) {
						alert('삭제에 성공하였습니다');		
						location.reload();
					}
				}
		 }); 				 
	 }
}
</script>
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
