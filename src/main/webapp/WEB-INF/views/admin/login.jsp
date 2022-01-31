<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
    <title>관리자 페이지</title>
</head>
<body>
    <div class="adminLogin">
        <form action="adminLogin" method="post" class="item" onsubmit="return loginFormCheck()">
            <h1><img src="${pageContext.request.contextPath}/resources/images/common/logo.png" alt="미래항공"></h1>
            <div class="inputbox no_icon">
                <div class="inputbox_input">
                    <input type="text" id="admin_id" name="admin_id" placeholder="관리자 아이디">
                </div>
            </div>
            <div class="inputbox no_icon">
                <div class="inputbox_input">
                    <input type="password" id="admin_pw" name="admin_pw" placeholder="비밀번호">
                </div>
            </div>
            <span class="error_msg"><c:if test="${errorMsg != null }">${errorMsg }</c:if></span>
            <div class="inputbox submit">
                <div class="inputbox_input">
                    <input type="submit" value="로그인">
                </div>
            </div>
        </form>
    </div>
</body>
</html>