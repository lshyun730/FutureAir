<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->

<!-- content S -->   
<section class="contents">
	<div class="row">
	    <!-- board manager S -->   
	    <section class="content width100">
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
		        <form action="postList" method="get" class="search_detail active" id="search_detail">
		            <div class="inputbox term icon">
		                <p class="inputbox_title">작성일</p>
		                <div class="inputbox_input">
		                    <input type="date" name="post_date_start" data-placeholder="2022-01-22" value="${searchList.post_date_start }">
		                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
		                </div>
		            </div>
		            <div class="inputbox icon">
		                <div class="inputbox_input">
		                    <input type="date" name="post_date_end" placeholder="2022-01-22" value="${searchList.post_date_end }">
		                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">게시판</p>
		                <div class="inputbox_input selectbox">
		                    <select name="board_name">
		                        <option value="전체" selected>전체</option>
		                    	<c:forEach var="board" items="${boardList}">
									<option value="${board}" <c:if test="${board eq searchList.board_name}">selected="selected"</c:if> >${board}</option>		                  
		                    	</c:forEach>
		                    </select>
		                </div>
		            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">답변상태</p>
		                <div class="inputbox_input selectbox">
		                    <select name="reply_type">
		                        <option value="전체" <c:if test="${searchList.reply_type eq '전체'}">selected="selected"</c:if> >전체</option>
		                        <option value="답변전" <c:if test="${searchList.reply_type eq '답변전'}">selected="selected"</c:if> >답변전</option>
		                        <option value="답변완료" <c:if test="${searchList.reply_type eq '답변완료'}">selected="selected"</c:if> >답변완료</option>
		                    </select>
		                </div>
		            </div>
		            <div class="inputbox icon">
		                <p class="inputbox_title">검색어</p>
		                <div class="inputbox_input">
		                    <input type="text" name="search_text" placeholder="검색어 입력" value="${searchList.search_text}">
		                    <span class="inputbox_icon"><i class="fas fa-search"></i></span>
		                </div>
		            </div>
		            
		            <div class="inputbox submit">
		                <div class="inputbox_input">
		                    <input type="submit" value="검색" onclick="pagingFormSubmit(1)">
		                </div>
		            </div>
		            <input type="hidden" name="page" id="page" />
		        </form>
		        <!-- search detail E -->   
		        <!-- table S --> 
		        <table class="table">
					<colgroup>
						<col width="5%">
						<col>
						<col width="30%">
					</colgroup>
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick="selectAll(this)"></th>
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
		            <c:if test="${empty postList}">
	            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
	            	</c:if>
		            <c:forEach var="post" items="${postList}">
		                <tr>
		                    <td><input type="checkbox" name="tableSelect" value="${post.POST_INDEX}"></td>
		                    <td>${post.BOARD_NAME}</td>
		                    <td><a href="#">${post.TITLE}</a></td>
		                    <td><a href="customerInfo">${post.WRITER}</a></td>
		                    <td>
		                    <c:if test="${post.REPLY_TYPE eq '1'}">
			                    <c:if test="${post.REPLY_INDEX eq null}"> 답변전 </c:if>
			                    <c:if test="${post.REPLY_INDEX ne null}"> 답변완료 </c:if>
			                </c:if>
			                <c:if test="${post.REPLY_TYPE eq '0'}">
			                	-
			                </c:if>
		                    </td>
		                    <td>
		                        <button class="btn_s more">답변하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                    </td>
		                    <td>${post.POST_DATE }</td>
		                    <td>${post.HITS }</td>
		                    <td class="more">
		                            <div class="btn_m_wrap" onclick="click_more(this)">
		                                <div class="btn_m">
		                                    <span></span>
		                                </div>
		                                <ul class="select_list">
		                                    <li><a href="javascript:popupOpen('postUpdate?post_index=${post.POST_INDEX}&board_name=${post.BOARD_NAME}&writer=${post.WRITER}', 500, 600)">수정</a></li> 
		                                    <li><a href="#">삭제</a></li> 
		                                </ul>
		                            </div>
		                        </td>
		                </tr>
		                </c:forEach>
		               
		            </tbody>
		        </table>
		        <!-- table E --> 
		        <!-- content footer S --> 
		        <div class="flex_content_footer">
		            <button class="btn danger" form="boardform"  onclick="javascript:checkDelete(this)">선택삭제</button>
		            <div class="navi">
		                <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})"><i class="fas fa-chevron-left"></i></a>
		                <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
						</c:forEach>
		                <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})"><i class="fas fa-chevron-right"></i></a>
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

<script>
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deletePost',
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


//액션 이외 선택시 액션 닫힘
document.addEventListener('click', () => {;
	var btn_m_wrap = document.getElementsByClassName('btn_m_wrap');
	for(let i=0; i < btn_m_wrap.length; i ++) {
	 	if (btn_m_wrap[i].classList.contains('active')) {
	     	btn_m_wrap[i].classList.remove('active');
	 	}	
	}
})
</script>
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
