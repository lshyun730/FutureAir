<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<title>게시판생성</title>
</head>
<body>
<!-- popup S -->  
    <section class="popup" id="popup">
            <h2>게시판 수정</h2>
            <form class="create_board">
                <div class="inputbox no_icon width100">
                    <p class="inputbox_title">게시판이름</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="게시판 이름을 입력해주세요" name="board_name" value="${board.board_name }">
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">게시판종류</p>
                    <div class="inputbox_input selectbox">
                        <select name="board_type">
                            <option value="운영" <c:if test="${board.board_type eq '운영'}">selected="selected"</c:if>>운영</option>
                            <option value="상담" <c:if test="${board.board_type eq '상담'}">selected="selected"</c:if>>상담</option>
                            <option value="상품"<c:if test="${board.board_type eq '상품'}">selected="selected"</c:if>>상품</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">답글허용</p>
                    <div class="inputbox_input selectbox">
                        <select name="reply_type">
                            <option value="1" <c:if test="${board.reply_type eq '1'}">selected="selected"</c:if>>허용</option>
                            <option value="0" <c:if test="${board.reply_type eq '0'}">selected="selected"</c:if>>비허용</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">쓰기권한</p>
                    <div class="inputbox_input selectbox">
                        <select name="write_right">
                            <option value="관리자" <c:if test="${board.write_right eq '관리자'}">selected="selected"</c:if>>관리자</option>
                            <option value="회원"  <c:if test="${board.write_right eq '회원'}">selected="selected"</c:if>>회원</option>
                            <option value="비회원"  <c:if test="${board.write_right eq '비회원'}">selected="selected"</c:if>>비회원</option>
                        </select>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">읽기권한</p>
                    <div class="inputbox_input selectbox">
                        <select name="read_right">
                            <option value="관리자" <c:if test="${board.read_right eq '관리자'}">selected="selected"</c:if>>관리자</option>
                            <option value="회원" <c:if test="${board.read_right eq '회원'}">selected="selected"</c:if>>회원</option>
                            <option value="비회원" <c:if test="${board.read_right eq '비회원'}">selected="selected"</c:if>>비회원</option>
	                        </select>
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="수정하기" onclick="updateBoard()">
                </div>
            </form>
    </section>
    <!-- modal E -->  
<script>
/* function updateBoard() {
	$.ajax({
		url : 'updateBoard',
		data : $('#create_board').serialize(),
		dataType : "json",
		traditional : true, 
		type : 'post',
		success : function(data) {
			alert('게시판을 추가하였습니다.');	
		}
	 });
} */
</script>
</body>
</html>