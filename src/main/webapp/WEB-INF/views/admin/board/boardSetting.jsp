<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <button class="btn primary">게시판추가</button>
            </div>
        </div>
        <!-- content header E -->
        <!-- table S --> 
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
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
                    <td><input type="checkbox"></td>
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
        </table>
        <!-- table E --> 
        <!-- content footer S --> 
        <div class="flex_content_footer">
            <button class="btn danger">선택삭제</button>
            <div class="navi">
                <a href="#"><i class="fas fa-chevron-left"></i></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><i class="fas fa-chevron-right"></i></a>
            </div>
        </div>
        <!-- content footer E --> 
    </section>
    <!-- board setting E -->  
    <!-- modal S -->  
    <section class="modal">
        <div class="modal_wrap">
            <h2>게시판추가</h2>
            <form action="#" class="create_board">
                <div class="inputbox no_icon">
                    <p class="inputbox_title">게시판이름</p>
                    <div class="inputbox_input">
                        <input type="text" placeholder="2022-01-22">
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">글쓰기권한</p>
                    <div class="inputbox_input">
                        <select name="status">
                            <option value="전체" selected>관리자</option>
                            <option value="답변전">회원</option>
                            <option value="답변완료">비회원</option>
                        </select>
                        <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                    </div>
                </div>
                <div class="inputbox">
                    <p class="inputbox_title">글보기권한</p>
                    <div class="inputbox_input">
                        <select name="status">
                            <option value="전체" selected>관리자</option>
                            <option value="답변전">회원</option>
                            <option value="답변완료">비회원</option>
                        </select>
                        <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                    </div>
                </div>
                <div class="submit">
                    <input type="submit" value="추가하기">
                </div>
            </form>
            <button class="close"><i class="fas fa-times"></i></button>
        </div>
        <div class="bg_black"></div>
    </section>
    <!-- modal E -->  
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
