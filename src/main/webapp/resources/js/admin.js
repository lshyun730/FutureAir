
// 로그인 폼 체크
function loginFormCheck() {
    const admin_id = document.querySelector('#admin_id');
    const admin_pw = document.querySelector('#admin_pw');
    const error_msg = document.querySelector('.error_msg');
                
    if (admin_id.value < 1) {
        error_msg.innerHTML = '아이디를 입력해 주세요';
        return false;
    }

    if (admin_pw.value < 1) {
        error_msg.innerHTML = '비밀번호를 입력해 주세요';
        return false;
    }
}

/* 체크박스 전체 선택 & 전체 선택 취소 */
function selectAll(selectAll)  {
	const table = selectAll.closest('.table'); 
  	const checkboxes = table.querySelectorAll('input[name="tableSelect"]');
  	checkboxes.forEach(checkbox => checkbox.checked = selectAll.checked)
}

/* 체크박스 선택 삭제 */
function checkDelete(deleteBox) {
	 const content = deleteBox.closest('.content'); 
	 const checkboxes = content.querySelectorAll('input[name="tableSelect"]');
	 const deleteList = new Array();
	 
	 checkboxes.forEach(checkbox => {
		 if(checkbox.checked) deleteList.push(checkbox.value);
	 })
	 
	 if(deleteList.length == 0) {
		 alert("선택된 항목이 없습니다")
	 } else{
		deleteAjax(deleteList);
	 }		
}


/* 출발일 기간 확인 */
function checkDate(dateBox) {
	const departure_date_start = document.getElementById("departure_date_start");
	const departure_date_end = document.getElementById("departure_date_end");
	
	if(departure_date_start.value == '' || departure_date_end.value == '') return;
	
	if(departure_date_start.value > departure_date_end.value) {
		alert("날짜 범위를 확인해 주세요");		
		departure_date_end.value = departure_date_start.value;
	}
}


/* 출발 시간 날짜 유효성 체크 */
function InsertDateChange(selectBox) {
	const departure_date  = document.getElementById("departure_date");
	const departure_time  = document.getElementById("departure_time");
	const arrival_date  = document.getElementById("arrival_date");
	const arrival_time  = document.getElementById("arrival_time");

	// 오늘시간 ex. 2022-01-01 형태
	const today = new Date();
	const year = today.getFullYear();
	const month = ('0' + (today.getMonth() + 1)).slice(-2);
	const day = ('0' + today.getDate()).slice(-2);
	const dateString = year + '-' + month  + '-' + day;

	if(departure_date.value != '') {
		if(dateString > departure_date.value) {
			alert("오늘 날짜 부터 가능합니다")
			departure_date.value = dateString;
			return
		}
	}
	if(departure_date.value != ''  && arrival_date.value != '') {
		console.log(departure_date.value, arrival_date.value )
		if(departure_date.value > arrival_date.value){
			alert("날짜 범위를 확인해 주세요");
			arrival_date.value = departure_date.value
		} else if(departure_time.value != ''  && arrival_time.value != '') {
			if(departure_date.value == arrival_date.value && departure_time.value >= arrival_time.value) {
				alert("시간 범위를 확인해 주세요");		
				arrival_time.value = departure_time.value;
			}
		}
	} 
}

// 예약취소 확인
function reservationDelete(reservation_num, reservation_state) {
	if(reservation_state == '예약취소') {
		alert('이미 취소 된 예약입니다');
		return;
	}
	
 	if(confirm("정말 취소하시겠습니까?")){
		 $.ajax({
				url : 'reservationCancle',
				data : {
					reservation_num : reservation_num
				},
				traditional : true, 
				type : 'post',
				success : function(data) {
					if(data==1) {
						alert('예약취소에 성공하였습니다');				
						location.reload();
					}
				}
		 }); 				 
	 }
}



// 상세검색 열고닫기 
function searchDetail() {
	const clickedClass = "search_detail active";
	const search_detail = document.querySelector(".search_detail");
    if (search_detail.className === clickedClass) {
    	search_detail.className = "search_detail";
    } else {
    	search_detail.className =  clickedClass;
    } 
}


// ... 버튼
function click_more(element){
    const btn_m_wrap = document.getElementsByClassName('btn_m_wrap');
    for(let i=0; i < btn_m_wrap.length; i ++) {
        event.stopPropagation()
        if (btn_m_wrap[i] == element) {
            element.classList.toggle('active');
        }else if (btn_m_wrap[i].classList.contains('active')) {
            btn_m_wrap[i].classList.remove('active');
        }
    }
}






