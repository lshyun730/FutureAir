<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.ckeditor.com/4.17.2/basic/ckeditor.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/common.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <title>미래항공 관리자페이지</title>
</head>
<body>
<!-- header S -->  
<header class="header">
    <h1 class="logo"><a href="${pageContext.request.contextPath}/admin"><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="FUTURE AIR"></a></h1>
    <nav class="gnb">
        <ul>
            <span class="gnb_txt">GENERAL</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin">홈
                    <span class="icon"><i class="fas fa-home"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">FLIGHT</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/flightList">비행일정
                    <span class="icon"><i class="fas fa-plane"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/flight/reservationList">예약현황
                    <span class="icon"><i class="fas fa-clipboard-list"></i></span>
                </a>
            </li>
            
            <span class="gnb_txt">CUSTOMER</span>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerList">회원정보
                    <span class="icon"><i class="fas fa-user"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/customerGrade">회원등급
                    <span class="icon"><i class="fas fa-arrow-circle-up"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/customer/sendMail">메일발송
                    <span class="icon"><i class="fas fa-envelope"></i></span>
                </a>
            </li>
    
            <span class="gnb_txt">BOARD</span>
            <li class="active">
                <a href="${pageContext.request.contextPath}/admin/board/postList">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/boardList">게시판설정
                    <span class="icon"><i class="fas fa-cog"></i></span>
                </a>
            </li>
        </ul>
    </nav>
</header>
<!-- header E -->  
<!-- util S -->  
<div class="util contents">
    <div class="row">
        <div class="search_box">
            <form action="#" class="search item">
                <span class="search_icon"><i class="fas fa-search"></i></span>
                <input type="search_text" name="search" placeholder="Search for...">
            </form>
        </div>
        
        <div class="info">
            <button class="bell" onclick="location.href='${pageContext.request.contextPath}/'"></button>
            <div class="profile">
                <div class="profile_img">
                    <img src="${pageContext.request.contextPath}/resources/images/profile.jpg" alt="profile">
                </div>
                <p>홍길동<span>마스터관리자</span></p>
                <div class="btn_m"><span></span></div>
            </div>
        </div>
    </div>
</div>
<!-- util E --> 
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
		                <button class="btn_s dropdown btn_search_detail">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
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
		                    <td><a href="#">
								<c:if test="${fn:length(post.TITLE) > 25}">${fn:substring(post.TITLE,0,25)}...</c:if> 
	                    		<c:if test="${fn:length(post.TITLE) <= 25}">${post.TITLE} </c:if>
							</a></td>
		                    <td><a href="javascript:popupOpen('${pageContext.request.contextPath}/admin/customer/customerInfo?id=${post.WRITER}', 1000, 600)">${post.WRITER}</a></td>
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
		                    	
		                        <button <c:if test="${post.REPLY_TYPE ne '1' }"> style="opacity:0; cursor:default" disabled </c:if> class="btn_s more" onclick="popupOpen('replyWriteForm?post_index=${post.POST_INDEX}&board_name=${post.BOARD_NAME}&post_title=${post.TITLE}', 500, 600)">답변하기
		                        	<span class="icon"><i class="fas fa-chevron-right"></i></span>
		                        </button>
		                    </td>
		                    <td>${post.POST_DATE }</td>
		                    <td>${post.HITS }</td>
		                    <td class="more">
	                            <div class="btn_m_wrap" onclick="click_more(this)">
	                                <div class="btn_m">
	                                    <span></span>
	                                </div>
	                                <ul class="select_list">
	                                    <li><a href="javascript:popupOpen('postUpdateForm?post_index=${post.POST_INDEX}&board_name=${post.BOARD_NAME}&writer=${post.WRITER}', 500, 700)">수정</a></li> 
	                                    <li><a href="javascript:deletePost('${post.POST_INDEX}')">삭제</a></li> 
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
		                <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})" class="prev"></a>
		                <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
							<a href="javascript:pagingFormSubmit(${counter})" <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter}</a>
						</c:forEach>
		                <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})" class="next"></a>
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
/* 게시물 리스트 삭제 */
function deleteAjax(deleteList) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deletePostList',
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

/* 게시물 삭제 */
function deletePost(post_index) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deletePost',
				data : {
					post_index : post_index
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

//상세검색
const btnSearchDetail = document.querySelector(".btn_search_detail");
btnSearchDetail.addEventListener("click", searchDetail);


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
