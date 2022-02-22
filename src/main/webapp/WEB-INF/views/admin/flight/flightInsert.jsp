<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
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
	<form class="flight_insert">
        <h2>비행추가</h2>
        <section>
        	<h3>비행일정</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>출발지</th>
	                <td>
	                	<select name="departure_name" onchange="InsertLocationChange(this)" id="departure_name" required>
	                     	<option value="" disabled selected>도시 혹은 공항</option>
	                     	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" class="${destination.country}">${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	                <th>도착지</th>
	                <td>
		                <select name="arrival_name" onchange="InsertLocationChange(this)" id="arrival_name" required>
	                    	<option value="" disabled selected>도시 혹은 공항</option>
	                    	<c:forEach var="continent" items="${destinationList}">
	               				<optgroup label="${continent[0].continents}">
	               				<c:forEach var="destination" items="${continent}">
							        <option value="${destination.airport_name}" class="${destination.country}">${destination.airport_name} / ${destination.airport_id}</option>
	               				</c:forEach>
	               				</optgroup>
					        </c:forEach>
	                    </select>
                    </td>
	            </tr>
	            <tr>
	                <th>출발날짜</th>
	                <td>
						<input type="date" name="departure_date" onchange="InsertDateChange(this)" id="departure_date" required>
					</td>
	                <th>출발시간</th>
	                <td>
	                	<input type="time" name="departure_time" onchange="InsertDateChange(this)" id="departure_time" required>
	                </td>
	            </tr>
	            <tr>
	                <th>도착날짜</th>
	                <td>
						<input type="date" name="arrival_date" onchange="InsertDateChange(this)" id="arrival_date" required>
					</td>
	                <th>도착시간</th>
	                <td>
	                	<input type="time" name="arrival_time" onchange="InsertDateChange(this)" id="arrival_time" required>
	                </td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>비행기정보</h3>
        	<!-- table S --> 
        	<table class="table">
	        	<colgroup>
	        		<col width="20%">
	        		<col width="30%">
	        		<col width="20%">
	        		<col width="30%">
	        	</colgroup>
	            <tr>
	                <th>비행기</th>
 	                <td>
						<select name="airplane_id" required="required" id="airplane_id" disabled="disabled" required>
	                     	<option value="" disabled selected >비행기 선택</option>
	                    	<c:forEach var="plane" items="${planeList}">
		                    	<option value="${plane.airplane_id}" class="${plane.airplane_type}">${plane.airplane_id} / ${plane.airplane_type}</option>
	                    	</c:forEach>
	                    </select>
					</td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <section>
        	<h3>가격정보</h3>
        	<!-- table S --> 
        	<table class="table">
        		<colgroup>
	        		<col width="13%">
	        		<col width="20%">
	        		<col width="15%">
	        		<col width="20%">
	        		<col width="13%">
	        		<col width="20%">
	        	</colgroup>
	            <tr>
	                <th>일반석</th>
	                <td><input type="number" name="normal_price" required></td>
	                <th>프레스티지석</th>
	                <td><input type="number" name="prestige_price" required></td>
	                <th>일등석</th>
	                <td><input type="number" name="first_price" required></td>
	            </tr>
        	</table>
        	<!-- table E --> 
        </section>
        <div class="submit">
            <input type="submit" value="추가하기" onclick="flightInsert()">
        </div>
	</form>
</section>
<script>
/* 출발지 도착지에 따라 국내선 국제선 비행기리스트 변경 */
function InsertLocationChange(selectBox) {
	
	const airplane_box  = document.getElementById("airplane_id"); // 비행기 select box
	const departure_name = document.getElementById("departure_name"); // 출발지 select box
	const arrivel_name = document.getElementById("arrival_name"); // 도착지 select box
	const departure_country = departure_name.options[departure_name.selectedIndex].getAttribute('class') // 출발지 국가;
	const arrivel_country = arrivel_name.options[arrivel_name.selectedIndex].getAttribute('class') ; // 도착지 국가	
	const departure_name_value = departure_name.options[departure_name.selectedIndex].value; // 출발지 선택된 값
	const arrival_name_value = arrival_name.options[arrival_name.selectedIndex].value; // 도착지 선택된 값
	
	airplane_box.options[0].selected = true;
	
	if( departure_name_value != '' && arrival_name_value != '') {
		if(departure_country == '한국' && arrivel_country == '한국'){	
			console.log(airplane_box.length)
			for(let i=0 ; i < airplane_box.length ; i++) {
				if(airplane_box.options[i].getAttribute('class') == '국제선' ) {
					airplane_box.options[i].hidden = true;
				} else {
					airplane_box.options[i].hidden = false;					
				}
			}
			airplane_box.disabled = false;
		} else {
			for(let i=0 ; i < airplane_box.length ; i++) {
				if(airplane_box.options[i].getAttribute('class') == '국내선' ) {
					airplane_box.options[i].hidden = true;
				} else{
					airplane_box.options[i].hidden = false;					
				}
			}
			airplane_box.disabled = false;
		}		
	} else {
		airplane_box.disabled = true;		
	}
	
	if(departure_name_value == arrival_name_value) {
		alert("같은 지역을 선택할 수 없습니다");			
		selectBox.options[0].selected = true;
	}
}


function flightInsert() {
 	$.ajax({
	    type: 'POST',
	    url: 'flightInsert',
	    data: $('.flight_insert').serialize(),
	    success: function (data) {
	    	if(data==1) {
	    		alert('추가되었습니다');
	    		opener.location.reload();
	    		window.close();
			}
	    }
	}); 
}


</script>
<!-- popup E -->  
</body>
</html>