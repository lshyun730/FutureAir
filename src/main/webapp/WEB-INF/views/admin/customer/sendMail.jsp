<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- content S -->   
<section class="contents grid">
    <!-- mail setting S -->
    <section class="item mail_setting">
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
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
                </tr>
                <tr>
                    <td>신규회원가입</td>
                    <td><label class="checkbox"><input type="checkbox"> 사용함</label></td>
                    <td>
                        <button class="btn_s more">수정하기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                        <button class="btn_s more">미리보기<span class="icon"><i class="fas fa-chevron-right"></i></span></button>
                    </td>
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
    <!-- mail setting E -->   
    <!-- mail send S -->
    <section class="item send_mail">
        <!-- content header S -->   
        <div class="flex_content_header">
            <h2>대량메일 발송</h2>
        </div>
        <!-- content header E -->  
        <!-- sand mail form S -->   
        <form action="#" class="sand_mail_form">
            <div class="inputbox">
                <p class="inputbox_title">발송자이름</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="Future Air">
                    <span class="inputbox_icon"><i class="fas fa-user"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">발송자 이메일</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="도시 혹은 공항">
                    <span class="inputbox_icon"><i class="fas fa-envelope"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">메일수신거부</p>
                <div class="inputbox_input"> 
                    <select>
                        <option value="전체" selected>포함</option>
                        <option value="도착">미포함</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox">
                <p class="inputbox_title">등급</p>
                <div class="inputbox_input">
                    <select>
                        <option value="전체" selected>일반</option>
                        <option value="도착">실버</option>
                        <option value="비행">골드</option>
                        <option value="대기">플래티늄</option>
                    </select>
                    <span class="inputbox_icon down"><i class="fas fa-chevron-down"></i></span>
                </div>
            </div>
            <div class="inputbox no_icon">
                <p class="inputbox_title">제목</p>
                <div class="inputbox_input">
                    <input type="text" placeholder="제목을 입력해주세요">
                </div>
            </div>
            <div class="textbox">
                <textarea placeholder="내용을 입력해 주세요"></textarea>
            </div>
            <div class="content_footer">
                <button class="btn">미리보기</button>
                <button class="btn primary">보내기</button>
            </div>
        </form>
        <!-- sand mail form E -->   
    </section>
    <!-- mail send E -->   
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
                    <textarea placeholder="내용을 입력해 주세요"></textarea>
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
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 
