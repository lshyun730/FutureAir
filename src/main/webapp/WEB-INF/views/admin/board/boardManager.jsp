<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

function pagingFormSubmit(currentPage){
	var form = document.getElementById("pagingForm");
	var page = document.getElementById("page");

	page.value = currentPage;
	form.submit();
}

function formCheck(){
	var checkbox = document.getElementsByName("boardCheck");
	var num = 0;

	for (var i = 0; i < checkbox.length ; i++){
		if(checkbox[i].checked == true){
			num++;
		}
	}

	if(num < 1 ){
		alert('하나라도 체크해주세요');
		return false; 
	}

	if(!confirm('정말 삭제하시겠습니까?')){

		return false;
	}

	return true;
}



function checkAll(checker){
	   const boardChecker = document.getElementsByName("boardCheck");
	   boardChecker.forEach((checkbox) => {checkbox.checked = checker.checked;});
	}

</script>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->

<!-- content S -->   
<section class="contents">
	<div class="row">
	    <!-- board manager S -->   
	    <section class="width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>게시물관리</h2>
		            <div class="action">
		                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
		            </div>
		        </div>
		        <!-- content header E -->   
		        <!-- search detail S -->   
		        <form action="searchBoard" method="post" class="search_detail">
		            <div class="inputbox term">
		                <p class="inputbox_title">검색일</p>
		                <div class="inputbox_input">
		                    <input type="text" name="search1" placeholder="2022-01-22">
		                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <div class="inputbox_input">
		                    <input type="text" name="search2" placeholder="2022-01-22">
		                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">게시판</p>
		                <div class="inputbox_input">
		                    <select name="board_status">
		                        <option value="전체" selected>전체</option>
		                        <option value="Q&A">Q&A</option>
		                    </select>
		                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">답변상태</p>
		                <div class="inputbox_input">
		                    <select name="reply_status">
		                        <option value="전체" selected>전체</option>
		                        <option value="답변전">답변전</option>
		                        <option value="답변완료">답변완료</option>
		                    </select>
		                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">검색어</p>
		                <div class="inputbox_input">
		                    <input type="text" name="searchtext" placeholder="검색어 입력">
		                    <span class="inputbox_icon"><i class="fas fa-search"></i></span>
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
		        <form action="delete" method="get" id="boardform" name="boardform">
		        <table class="table">
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick="checkAll(this)"></th>
		                    <th>분류</th>
		                    <th>제목</th>
		                    <th>작성자</th>
		                    <th>답변상태</th>
		                    <th>답변하기</th>
		                    <th>작성일</th>
		                    <th>조회수</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
		            
		            <c:forEach var="boardlist" items="${boardList }">
		                <tr>
		                    <td><input type="checkbox" id="boardCheck" name="boardCheck" value="${boardlist.board_index }"></td>
		                    <td>${boardlist.topic_type }</td>
		                    <td><a href="#">${boardlist.title }</a></td>
		                    <td><a href="customerInfo">${boardlist.writer }</a></td>
		                    <td>
		                    <c:if test="${boardlist.topic_type eq '문의'}">
			                    <c:if test="${boardlist.reply_type == 0}"> 답변 미완료 </c:if>
			                    <c:if test="${boardlist.reply_type != 0}"> 답변 완료 </c:if>
			                </c:if>
			                <c:if test="${'문의' ne boardlist.topic_type}">
			                	-
			                </c:if>
		                    </td>
		                    <td>
		                        <button class="btn_s more">답변하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                    </td>
		                    <td>${boardlist.board_date }</td>
		                    <td>${boardlist.hits }</td>
		                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
		                </tr>
		                </c:forEach>
		               
		            </tbody>
		        </table>
		        </form>
		        <!-- table E --> 
		        <!-- content footer S --> 
		        <div class="flex_content_footer">
		            <button class="btn danger" form="boardform" onclick="return formCheck();">선택삭제</button>
		            <div class="navi">
		                <a href="#"><i class="fas fa-chevron-left"></i></a>
		                <a href="#" class="active">1</a>
		                <a href="#">2</a>
		                <a href="#">3</a>
		                <a href="#"><i class="fas fa-chevron-right"></i></a>
		            </div>
		        </div>
		        <!-- content footer E --> 
	        </div>
	    </section>
	    <!-- board manager E -->   
   	</div>
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
