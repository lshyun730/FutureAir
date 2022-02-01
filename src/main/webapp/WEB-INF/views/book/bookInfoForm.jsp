<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<!-- breadcrumbs S --> 
<div class="breadcrumbs inner">
	<ul>
		<li><i class="fas fa-home"></i></li>
		<li>예매</li>
		<li>항공권 예약</li>
		<li><a href="#">항공권 예약</a></li>
	</ul>
</div>
<!-- breadcrumbs E --> 
<!-- book customer info S -->
<section class="inner content">
    <h2>항공권 예약</h2>
    <div>
        <h3>여행정보</h3>
        <table class="table top_boder">
            <thead>
                <tr>
                    <th>유형</th>
                    <th>여정</th>
                    <th>출도착 날짜 및 시간</th>
                    <th>비행번호</th>
                    <th>좌석정보</th>
                </tr>
            </thead>
            <tbody> 
                <tr>
                    <td>가는편</td>
                    <td>PUS 부산 - SEL 서울</td>
                    <td>2022-02-01 (화)  07:30 - 08:25</td>
                    <td>FA0001</td>
                    <td>이코노미석</td>
                </tr>
                <tr>
                    <td>오는편</td>
                    <td>PUS 부산 - SEL 서울</td>
                    <td>2022-02-01 (화)  07:30 - 08:25</td>
                    <td>FA0001</td>
                    <td>이코노미석</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div>
        <h3>승객정보</h3>
        <form action="#" class="border_input">
            <table class="table top_boder">
                <colgroup>
                    <col width="10%">
                    <col width="18%">
                    <col width="18%">
                    <col width="18%">
                    <col width="18%">
                    <col width="18%">
                </colgroup>
                <thead>
                    <tr>
                        <th>유형</th>
                        <th>이름</th>
                        <th>성별</th>
                        <th>생년월일</th>
                        <th>국적</th>
                        <th>여권번호</th>
                    </tr>
                </thead>
                <tbody>
                    <td>성인</td>
                    <td>
                        <input type="text" placeholder="이름을 입력해 주세요">
                    </td>
                    <td>
                        <input type="radio" name="gender" id="tab1"><label for="tab1">남</label>
                        <input type="radio" name="gender" id="tab2"><label for="tab2">여</label>
                    </td>
                    <td>
                        <input type="date">
                    </td>
                    <td>
                        <select name="" id="">
                            <option value="국적" disabled>국적</option>
                            <option value="대한민국">대한민국</option>
                        </select>
                    </td>
                    <td><input type="text" placeholder="여권번호"></td>
                </tbody>
            </table>
        </form>
    </div>
    <div>
        <h3>연락처정보</h3>
        <form action="#" class="border_input">
            <table class="table top_boder">
                    <tr>
                        <th>휴대전화</th>
                        <td><input type="text"/></td>
                        <th>이메일</th>                        
                        <td><input type="text" /></td>
                    </tr>
            </table>
        </form>
    </div>
    <div class="flight_payment_wrap">
        <div class="flight_payment">
            <p>총 결제금액</p>
            <p class="price">67,200원</p>
        </div>
        <button class="btn_primary" onclick="location='${pageContext.request.contextPath}/book/bookDone'">다음</button>
    </div>
</section>
<!-- book customer info E -->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E --> 