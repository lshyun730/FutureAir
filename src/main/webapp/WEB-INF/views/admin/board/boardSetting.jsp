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
	
	window.open("boardSettingDelete");

	

	return true;

	
}

function insertBoard(){
	var title = document.getElementsById("title");
	var topic_type = document.getElementsById("topic_type");
	var contents = document.getElementsById("contents");

	
}




function checkAll(checker){
	   const boardChecker = document.getElementsByName("boardCheck");
	   boardChecker.forEach((checkbox) => {checkbox.checked = checker.checked;});
	}

function popup_open(){
	document.getElementById("modal").style.display = 'flex';
	}
	
function popup_close(){
	document.getElementById("modal").style.display = 'none'; 
	}

</script>
<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- board setting S -->   
    <section class="item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>게시판 설정</h2>
            <div class="action">
                <button class="btn primary" onclick="popup_open();">게시판추가</button>
            </div>
        </div>
        <!-- content header E -->
        <!-- table S --> 
        <form action="${pageContext.request.contextPath}/admin/board/boardSetting" method="get" id="pagingForm" onsubmit="return pagingFormSubmit(1);">
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox" onclick="checkAll(this)"></th>
                    <th>분류</th>
                    <th>게시판제목</th>
                    <th>게시판ID</th>
                    <th>새글/총갯수</th>
                    <th>권한(읽기/쓰기)</th>
                    <th>게시물관리</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
            <c:forEach var="boardList" items="${boardList }">
                <tr>
                    <td><input type="checkbox" id="boardCheck" name="boardCheck" value="${boardList.board_index }"></td>
                    <td>${boardList.topic_type }</td>
                    <td><a href="#">${boardList.title }</a></td>
                    <td>1</td>
                    <td>3/10</td>
                    <td>관리자/비회원</td>
                    <td>
                        <button class="btn_s more">글쓰기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more" onclick="window.location ='boardSettingDelete.html'">글삭제<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more" onclick="window.location ='boardSettingNotice.html'">공지글<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
             </c:forEach>    
            </tbody>
            <input type="hidden" id="page" name="page">
       		 </table>
         </form>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button class="btn danger" form="boardform" onclick="return formCheck();">선택삭제</button>
            <div class="navi">
                <a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup} )">
                   <i class="fas fa-chevron-left"></i>
                </a>
                  <c:forEach var="counter" begin="${navi.startPageGroup }" end="${navi.endPageGroup }" >
               <c:if test="${counter == navi.currentPage }"><b></b></c:if>
                  <a href="javascript:pagingFormSubmit(${counter })"
                     <c:if test="${navi.currentPage == counter}">class="active"</c:if>>${counter }</a>
               <c:if test="${counter == navi.currentPage }"><b></b></c:if>
            </c:forEach>
                <a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup} )">
                   <i class="fas fa-chevron-right"></i>
                </a>
            </div>
        </div>
        <!-- content footer E --> 
    </section>
    <!-- board setting E -->  
    <!-- modal S -->  
    <section class="modal" id="modal">
        <div class="modal_wrap">
            <h2>게시판추가</h2>
            <form action="insertBoard" method="get" class="create_board">
                <div class="inputbox no_icon">
                    <p class="inputbox_title">게시판이름</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="게시판 이름 입력" id="title" name="title">
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">글타입</p>
                    <div class="inputbox_input">
                        <select name="topic_type" id="topic_type">
                            <option value="Q&A" selected>Q&A</option>
                            <option value="공지">공지</option>
                        </select>
                        <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">글내용</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="게시판 내용 입력" id="contents" name="contents">
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="추가하기" onclick="return insertBoard();">
                </div>
            </form>
            <button class="close" onclick="popup_close();"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal E -->  
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
