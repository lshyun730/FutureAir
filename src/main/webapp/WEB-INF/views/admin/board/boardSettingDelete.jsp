<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,height=device-height,initial-scale=1,maximum-scale=1,user-scalable=no,viewport-fit=cover">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <link rel="stylesheet" href="resources/css/admin.css">
    <title>미래항공 관리자페이지</title>
</head>
<body style="background: #fff;">
    <section class="board_blank">
        <h2>글삭제</h2>
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>1</td>
                    <td>2022-01-01 인천공항 잠정휴관</td>
                    <td>관리자</td>
                </tr>
            </tbody>
        </table>
        <div class="navi">
            <a href="#"><i class="fas fa-chevron-left"></i></a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#"><i class="fas fa-chevron-right"></i></a>
        </div>
        <div class="submit">
            <input type="submit" value="추가하기">
        </div>
    </section>
</body>
</html>