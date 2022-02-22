<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!-- header S -->    
<%@include file ="../include/header.jsp" %>
<!-- header E -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

	const regPw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
	let idChecker = 'ak@fjlsf1Q#2wg#11';
	let validateId = false;

	function phoneAction(){
		let phoneHyphen = document.getElementById('customer_phone').value
							.replace(/[^0-9]/g, "")
							.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		document.getElementById('customer_phone').value = phoneHyphen;
	}

	function validateIdCheck(){
		$.ajax({
			url : 'validateIdAjax',
			data : { "id" : $("#customer_id").val()},
			traditional : true, 
			type : 'get',
			success : function(data) {
				if(data > 0) {
					alert("사용하실 수 없는 아이디입니다.");
				} else {
					alert("사용하실 수 있는 아이디입니다.");
					idChecker = $("#customer_id").val();
					validateId = true;
				}
			}
	 	}); 		
	}

	function joinAction(){
				
		const name = document.getElementById('customer_name').value;
		const id = document.getElementById('customer_id').value;
		const pw1 = document.getElementById('customer_pw').value;
		const pw2 = document.getElementById('customer_pw2').value;
		const phone = document.getElementById('customer_phone').value;
		const birth = document.getElementById('customer_birth').value;
		const gender = document.getElementsByName('gender');
		const email = document.getElementById('customer_email').value;
		const country = document.getElementById('customer_country').value;
		const address = document.getElementById('customer_address').value;
		
		if(name == "" || id == "" || pw1 == "" || pw2 == "" || phone == ""
			|| email == "" || birth == "" || country == "" || address == ""){
			alert("값을 모두 입력해야 합니다."); return false;
		}
		if(validateId == false){
			alert("ID 중복검사를 실시하십시오."); return false;
		}
		if(id !== idChecker){
			alert("ID값이 변경되었습니다. 다시 중복검사를 실시하십시오."); return false;
		}
		if(pw1 != pw2){
			alert("패스워드가 일치하지 않습니다."); return false;
		}
		if(!regPw.test(pw1)){
			alert("비밀번호는 영 대/소문자, 특수문자, 숫자가 모두 포함되어야 하며, 8~16자리 이내여야 합니다."); return false;
		}
		return true;
	}
	


</script>

<!-- join S-->
<section class="join">
    <ul class="steps">
        <li>약관동의</li>
        <li class="active">정보입력</li>
        <li>가입완료</li>
    </ul>
    <h2>미래항공 회원가입을 위한 고객님의 소중한 정보를 입력해 주세요.</h2>
    <form action="joinForm" method="post" class="join_form" onsubmit="return joinAction();">
        <table>
            <colgroup>
                <col width="20%">
                <col width="80%">
            </colgroup>
            <tr>
                <th>이름</th>
                <td><input type="text" id="customer_name" name="customer_name"></td>
            </tr>
            <tr>
                <th>아이디</th>
                <td class="flex">
                    <input type="text" id="customer_id" name="customer_id">
                    <input type="button" value="중복확인" class="btn_primary white" onClick="javascript:validateIdCheck();">
                </td>
            </tr>
            <tr>
                <th>비밀번호</th>
                <td>
                    <input type="password" id="customer_pw" name="customer_pw">
                    <input type="password" id="customer_pw2">
                    <p class="desc">8~16자리의 영문 대/소문자, 숫자, 특수문자를 모두 조합해서 비밀번호를 설정해 주세요</p>
                </td>
            </tr>
            <tr>
                <th>휴대폰번호</th>
                <td class="flex">
                    <input type="text" id="customer_phone" maxlength="13" name="customer_phone" oninput="phoneAction();">
                    <!-- <input type="button" value="인증하기" class="btn_primary white"> -->
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td><input type="date" id="customer_birth" name="customer_birth"></td>
            </tr>
            <tr>
            <th>성별</th>
                <td>
                	<input type="radio" name="customer_gender" value="남자" checked>남성
                	<input type="radio" name="customer_gender" value="여자">여성
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td><input type="text" id="customer_email" name="customer_email"></td>
            </tr>
            <tr>
                <th>국적</th>
                <td><input type="text" id="customer_country" name="customer_country"></td>
            </tr>
            <tr>
                <th>주소</th>
                <td><input type="text" id="customer_address" name="customer_address"></td>
            </tr>
        </table>
        <div class="btn_primary submit">
            <input type="submit" value="가입">
        </div>
    </form>
</section>
<!-- join E-->
<!-- footer S -->
<%@include file ="../include/footer.jsp" %>
<!-- footer E -->  