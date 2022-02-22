<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <li>
                <a href="${pageContext.request.contextPath}/admin/board/postList">게시물관리
                    <span class="icon"><i class="fas fa-pen-alt"></i></span>
                </a>
            </li>
            <li class="active">
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
	    <!-- board setting S -->   
	    <section class="content width100">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>게시판 설정</h2>
		            <div class="action">
		                <button class="btn primary " onclick="javascript:modalOpen()">게시판추가</button>
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
		                    <th>게시판관리</th>
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
		                    <td><a href="">${board.BOARD_NAME}</a></td>
		                    <td>${board.BOARD_ID}</td>
		                    <td>${board.COUNT_TODAY}/${board.COUNT_ALLDAY}</td>
		                    <td>${board.READ_RIGHT}/${board.WRITE_RIGHT}</td>
		                    <td>
		                        <button class="btn_s more" onclick="location.href='postList?board_name=${board.BOARD_NAME}'">글보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                        <button class="btn_s more" onclick="popupOpen('postWriteForm?board_name=${board.BOARD_NAME}', 500, 700)">글쓰기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                        <button class="btn_s more" onclick="popupOpen('postNotice?board_name=${board.BOARD_NAME}', 800, 800)">공지글<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
		                    </td>
		                    <td class="more">
		                            <div class="btn_m_wrap" onclick="click_more(this)">
		                                <div class="btn_m">
		                                    <span></span>
		                                </div>
		                                <ul class="select_list">
		                                    <li><a href="javascript:popupOpen('boardupdateForm?board_name=${board.BOARD_NAME}', 500, 500)">수정</a></li> 
		                                    <li><a href="javascript:deleteBoard('${board.BOARD_NAME}')">삭제</a></li> 
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
		            <button class="btn danger" onclick="javascript:checkDelete(this)">선택삭제</button>
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
                <div class="inputbox width100">
                    <p class="inputbox_title">게시판이름</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="게시판 이름을 입력해주세요" name="board_name" required>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">게시판종류</p>
                    <div class="inputbox_input selectbox">
                        <select name="board_type" required>
                            <option value="운영" selected>운영</option>
                            <option value="상담">상담</option>
                            <option value="상품">상품</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">답글허용</p>
                    <div class="inputbox_input selectbox">
                        <select name="reply_type" required>
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
                        <select name="read_right" required>
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
				url : 'deleteBoardList',
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

/* 게시물 삭제 */
function deleteBoard(board_name) {
	if(confirm("정말 삭제하시겠습니까?")){
		 $.ajax({
				url : 'deleteBoard',
				data : {
					board_name : board_name
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
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
