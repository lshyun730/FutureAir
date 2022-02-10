<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function insertBoard(){
	var title = document.getElementsById("title");
	var topic_type = document.getElementsById("topic_type");
	var contents = document.getElementsById("contents");
}

</script>
<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents">
	<div class="row">
	    <!-- board setting S -->   
	    <section class="width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>게시판 설정</h2>
		            <div class="action">
		                <button class="btn primary" onclick="javascript:modalOpen()">게시판추가</button>
		            </div>
		        </div>
		        <!-- content header E -->
		        <!-- table S --> 
		        <table class="table">
		        	<colgroup>
						<col width="5%">
						<col>
						<col width="20%">
					</colgroup>
		            <thead>
		                <tr>
		                    <th><input type="checkbox" onclick="selectAll(this)"></th>
		                    <th>분류</th>
		                    <th>게시판이름</th>
		                    <th>게시판ID</th>
		                    <th>새글/총갯수</th>
		                    <th>권한(읽기/쓰기)</th>
		                    <th>게시물관리</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
		            <c:if test="${empty boardList}">
	            		<tr><td colspan="9" class="tableEmpty">검색 결과가 없습니다</td></tr>
	            	</c:if>
		            <c:forEach var="board" items="${boardList}">
		                <tr>
		                    <td><input type="checkbox" name="tableSelect" value="${board.BOARD_NAME}"></td>
		                    <td>${board.BOARD_TYPE}</td>
		                    <td><a href="#">${board.BOARD_NAME}</a></td>
		                    <td>${board.BOARD_ID}</td>
		                    <td>${board.COUNT_TODAY}/${board.COUNT_ALLDAY}</td>
		                    <td>${board.READ_RIGHT}/${board.WRITE_RIGHT}</td>
		                    <td>
		                        <button class="btn_s more">글쓰기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                        <button class="btn_s more" onclick="window.open('boardSettingDelete?topic_type=${board.TOPIC_TYPE}', '_blank', 'width=800,height=800')">글삭제<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                        <button class="btn_s more" onclick="window.open('boardSettingNotice?topic_type=${board.TOPIC_TYPE}', '_blank', 'width=800,height=800')">공지글<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                    </td>
		                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
		                </tr>
		             </c:forEach>
		            </tbody>
		        </table>
		        <!-- table E --> 
		        <!-- content footer S --> 
		        <div class="flex_content_footer">
		            <button class="btn danger" form="boardform" onclick="javascript:checkDelete()">선택삭제</button>
		            <div class="navi">
			           	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
			               <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
						</c:forEach>
			           	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
		        	</div>
	            </div>
	        </div>
	        <!-- content footer E --> 
	    </section>
	    <!-- board setting E -->  
	</div>
	    <!-- modal S -->  
	    <section class="modal" id="modal">
	        <div class="modal_wrap">
	            <h2>게시판추가</h2>
	            <form action="insertBoard" class="create_board" method="post">
	                <div class="inputbox no_icon">
	                    <p class="inputbox_title">게시판이름</p>
	                    <div class="inputbox_input">
	                        <input type="text" placeholder="게시판 이름을 입력해주세요" name="board_name">
	                    </div>
	                </div>
	                <div class="inputbox">
	                    <p class="inputbox_title">게시판종류</p>
	                    <div class="inputbox_input selectbox">
	                        <select name="board_type">
	                            <option value="운영" selected>운영</option>
	                            <option value="상담">상담</option>
	                            <option value="상품">상품</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="inputbox">
	                    <p class="inputbox_title">답글허용</p>
	                    <div class="inputbox_input selectbox">
	                        <select name="reply_type">
	                            <option value="1" selected>허용</option>
	                            <option value="0">비허용</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="inputbox">
	                    <p class="inputbox_title">쓰기권한</p>
	                    <div class="inputbox_input selectbox">
	                        <select name="write_right">
	                            <option value="관리자" selected>관리자</option>
	                            <option value="회원">회원</option>
	                            <option value="비회원">비회원</option>
	                        </select>
	                    </div>
	                </div>
	                <div class="inputbox">
	                    <p class="inputbox_title">읽기권한</p>
	                    <div class="inputbox_input selectbox">
	                        <select name="read_right">
	                            <option value="관리자" selected>관리자</option>
	                            <option value="회원">회원</option>
	                            <option value="비회원">비회원</option>
 	                        </select>
	                    </div>
	                </div>
	                <div class="submit">
	                    <input type="submit" value="추가하기">
	                </div>
	            </form>
	            <button class="close" onclick="javascript:modalClose()"><i class="fas fa-times"></i></button>
	        </div>
	        <div class="bg_black"></div>
	    </section>
	    <!-- modal E -->  
</section>
<!-- content E --> 
<script>
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deleteBoard',
				data : {
					deleteList : deleteList
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data > 0) {
						alert('삭제에 성공하였습니다');		
						location.reload();
					}
				}
		 }); 				 
	 }
}
</script>
s

<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
