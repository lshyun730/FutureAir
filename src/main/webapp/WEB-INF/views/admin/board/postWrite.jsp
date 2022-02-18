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
        <h2>게시글작성</h2>
        <form id="post_write">
            <div class="inputbox no_icon width100">
                <p class="inputbox_title">제목</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="제목을 입력해주세요" name="title" id="title">
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
                        <option value="항공권예매">항공권예매</option>
                        <option value="마일리지">마일리지</option>
                        <option value="체크인">체크인</option>
                        <option value="수하물">수하물</option>
                        <option value="공항">공항</option>
                        <option value="홈페이지이용">홈페이지이용</option>
                    </select>
                </div>
            </div>
            <div class="inputbox width100">
                <p class="inputbox_title">내용</p>
                <div class="inputbox_input textbox">
                	<textarea rows="" cols="" id="contents" name="contents"></textarea>
                </div>
            </div>
            <div class="submit">
                <input type="button" value="추가하기" onclick="postWrite()">
            </div>
        </form>
</section>
<!-- popup E -->  
</body>
<script type="text/javascript">
	function postWrite(){
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
			 url : 'postWrite',
				data : $('#post_write').serialize(),
				dataType : "json",
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data >= 1) {
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