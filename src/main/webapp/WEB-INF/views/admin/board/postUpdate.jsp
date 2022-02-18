<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
	<title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff">
<!-- popup S -->  
<section class="popup" id="popup">
        <h2>게시글수정</h2>
        <form onsubmit="return postUpdate();" id="updateForm">
        	<input type="hidden" id="post_index" name="post_index" value="${post.post_index}">
            <div class="inputbox no_icon width100">
                <p class="inputbox_title">제목</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="게시판 이름을 입력해주세요" name="title" id="title" value="${post.title}">
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">게시판</p>
                <div class="inputbox_input selectbox">
                    <select name="board_name" onchange="checkBoardName(this)" id="board_name">
                    	<c:forEach var="board" items="${boardList}">
							<option value="${board}" <c:if test="${board eq board_name}">selected="selected"</c:if> >${board}</option>		                  
                    	</c:forEach>
                    </select>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">소분류</p>
                <div class="inputbox_input selectbox">
                    <select name="post_type" id="post_type">
                        <option value="" selected>선택안함</option>
                        <option value="항공권예매" <c:if test="${post.post_type eq '항공권예매'}">selected="selected"</c:if> >항공권예매</option>
                        <option value="마일리지"<c:if test="${post.post_type eq '마일리지'}">selected="selected"</c:if> >마일리지</option>
                        <option value="체크인"<c:if test="${post.post_type eq '체크인'}">selected="selected"</c:if> >체크인</option>
                        <option value="수하물"<c:if test="${post.post_type eq '수하물'}">selected="selected"</c:if> >수하물</option>
                        <option value="공항"<c:if test="${post.post_type eq '공항'}">selected="selected"</c:if> >공항</option>
                        <option value="홈페이지이용"<c:if test="${post.post_type eq '홈페이지이용'}">selected="selected"</c:if> >홈페이지이용</option>
                    </select>
                </div>
            </div>
            <div class="inputbox width100">
                <p class="inputbox_title">내용</p>
                <div class="inputbox_input textbox">
                	<textarea id="contents" name="contents">${post.contents}</textarea>
                </div>
            </div>
            <div class="submit">
                <input type="submit" value="수정하기">
            </div>
        </form>
</section>
<!-- popup E -->  
</body>
<script>
	function postUpdate(){
		var title = document.getElementById('title').value
		var contents = document.getElementById('contents').value
		if(title ==''){
			alert('제목을 한글자 이상 입력해주세요');
			return false;
		}

		if(contents ==''){
			alert('내용을 한글자 이상 입력해주세요');
			return false;
		}

		 $.ajax({
				url : 'postUpdate',
				data : $("#updateForm").serialize(),
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data == 1) {
						alert('수정이 완료되었습니다')
						opener.parent.location.reload();
						window.close();
					}
				}
		 });
		return true;
	}

</script>
</html>