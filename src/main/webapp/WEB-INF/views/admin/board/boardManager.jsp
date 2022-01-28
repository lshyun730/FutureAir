<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- board manager S -->   
    <section class="board_manager item fullwidth">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>게시물관리</h2>
            <div class="action">
                <button class="btn_s dropdown">상세검색<span class="icon"><i class="fas fa-chevron-down"></i></span></button>
            </div>
        </div>
        <!-- content header E -->   
        <!-- search detail S -->   
        <form action="#" class="search_detail">
            <div class="inputbox term">
                <p class="inputbox_title">출발일</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <div class="inputbox_input">
                    <input type="text" placeholder="2022-01-22">
                    <span class="inputbox_icon"><i class="far fa-calendar"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">게시판</p>
                <div class="inputbox_input">
                    <select name="status">
                        <option value="전체" selected>전체</option>
                        <option value="Q&A">Q&A</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">답변상태</p>
                <div class="inputbox_input">
                    <select name="status">
                        <option value="전체" selected>전체</option>
                        <option value="답변전">답변전</option>
                        <option value="답변완료">답변완료</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">검색어</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="검색어 입력">
                    <span class="inputbox_icon"><i class="fas fa-search"></i></span>
                </div>
            </div>
            
            <div class="inputbox submit">
                <div class="inputbox_input">
                    <input type="submit" value="검색">
                </div>
            </div>
        </form>
        <!-- search detail E -->   
        <!-- table S --> 
        <table class="table">
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>분류</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>답변상태</th>
                    <th>답변하기</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>액션</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox"></td>
                    <td>Q&A</td>
                    <td><a href="#">상품관련질문</a></td>
                    <td><a href="#">김개똥</a></td>
                    <td>답변전</td>
                    <td>
                        <button class="btn_s more">답변하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                    <td>2021-02-01</td>
                    <td>10</td>
                    <td class="btn_m_wrap"><div class="btn_m"><span></span></div></td>
                </tr>
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
    <!-- board manager E -->   
</section>
<!-- content E --> 
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
