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
            <li class="active">
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
	    <!-- mail setting S -->
	    <section class="mail_setting width50">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>자동메일 설정</h2>
		        </div>
		        <!-- content header E -->   
		        <!-- table S --> 
		        <table class="table">
		            <thead>
		                <tr>
		                    <th>메일항목</th>
		                    <th>상태</th>
		                    <th>액션</th>
		                </tr>
		            </thead>
		            <tbody>
		            	<c:forEach var="mail" items="${mailList}">
			                <tr>
			                    <td>${mail.mail_type} </td>
			                    <td>
			                    	<label class="checkbox"><input type="checkbox" <c:if test="${mail.mail_check eq '1' }"> checked="checked"</c:if> onchange="location.href='mailCheckChange?mail_num=${mail.mail_num}&mail_check=${mail.mail_check }'"> 사용함</label>
			                    </td>
			                    <td>
			                        <button class="btn_s more" onclick="popupOpen('mailUpdateForm?mail_num=${mail.mail_num}', 1000, 800)">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
			                        <button class="btn_s more" onclick="popupOpen('mailView?mail_num=${mail.mail_num}', 1000, 600)">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
			                    </td>
			                </tr>
		            	</c:forEach>
		            </tbody>
		        </table>
		        <!-- table E --> 
	        </div>
	    </section>
	    <!-- mail setting E -->   
	    <!-- mail send S -->
	    <section class="send_mail width50">
	    	<div class="inner">
		        <!-- content header S -->   
		        <div class="flex_content_header">
		            <h2>대량메일 발송</h2>
		        </div>
		        <!-- content header E -->  
		        <!-- sand mail form S -->   
		        <form class="sand_mail_form" onsubmit="return sendMail()" id="send_mail_form">
			            <div class="inputbox">
			                <p class="inputbox_title">보내는사람</p>
			                <div class="inputbox_input">
			                    <input type="text" name="form_name" value="미래항공" readonly="readonly">
			                </div>
			            </div>
			            <div class="inputbox">
			                <p class="inputbox_title">등급</p>
			                <div class="inputbox_input selectbox">
			                    <select name="grade">
			                        <option value="전체" selected>전체</option>
			                    	<c:forEach var="grade" items="${gradeList}">
			                        <option value="${grade.grade}">${grade.grade}</option>
			                    	</c:forEach>
			                    </select>
			                </div>
			            </div>
		            <div class="inputbox">
		                <p class="inputbox_title">제목</p>
		                <div class="inputbox_input">
		                    <input type="text" placeholder="제목을 입력해주세요" name="title">
		                </div>
		            </div>
		            <div class="textbox" >
		                <textarea placeholder="내용을 입력해 주세요" name="body" id="editor_body"></textarea>
		            </div>
		            <div class="content_footer">
		                <button class="btn">미리보기</button>
		                <button class="btn primary">보내기</button>
		            </div>
		        </form>
		        <!-- sand mail form E -->   
	        </div>
	    </section>
	    <!-- mail send E -->
	</div>   
    <!-- modal view S -->  
    <section class="modal view">
        <div class="modal_wrap">
            <h2>미리보기</h2>
            <button class="close"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal view E -->  
    <!-- modal rewrite S -->  
    <section class="modal rewrite">
        <div class="modal_wrap">
            <h2>수정하기</h2>
            <form action="#">
                <div class="inputbox no_icon">
                    <p class="inputbox_title">제목</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="${user} 님 회원가입을 축하드립니다.">
                    </div>
                </div>
                <div class="textbox">
                	<div>
                    	<textarea placeholder="내용을 입력해 주세요"></textarea>
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="수정하기">
                </div>
            </form>
            <button class="close"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal rewrite E -->  
</section>
<!-- content E --> 
<script>

CKEDITOR.replace( 'editor_body' ); 

function sendMail() {
	const date = CKEDITOR.instances.editor_body.getData();
	const body = document.querySelector('textarea[name="body"]'); 
	body.value = date;
  	$.ajax({
	    type: 'POST',
	    url: 'sendMail',
	    data: $('#send_mail_form').serialize(),
	    success: function (data) {
	    	alert('메일을 전송하였습니다')
	    }
	});  
}
</script>
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
