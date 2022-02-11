<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>게시글보기</h2>
        <form class="view_post">
            <div class="inputbox no_icon width100">
                <p class="inputbox_title">제목</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="게시판 이름을 입력해주세요" name="board_name">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">게시판</p>
                <div class="inputbox_input selectbox">
                    <select name="board_name">
                        <option value="1" selected>게시판이름</option>
                        <option value="0">비허용</option>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">소분류</p>
                <div class="inputbox_input selectbox">
                    <select name="post_type">
                        <option value="관리자" selected>항공권</option>
                        <option value="회원">회원</option>
                        <option value="비회원">비회원</option>
                     </select>
                </div>
            </div>
            <div class="inputbox width100">
                <p class="inputbox_title">내용</p>
                <div class="inputbox_input textbox">
                	<textarea rows="" cols=""></textarea>
                </div>
            </div>
            <div class="submit">
                <input type="submit" value="추가하기" onclick="return insertBoard()">
            </div>
        </form>
</section>
<!-- popup E -->  
</body>
</html>