
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


/* 상세검색 submit */
function pagingFormSubmit(currentPage) {
	const form = document.getElementById("search_detail");
	const page = document.getElementById("page");
	
	page.value = currentPage;
	form.submit();
}

/* 체크박스 전체 선택 & 전체 선택 취소 */
function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('tableSelect');
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	}

/* 체크박스 선택 삭제 */
function checkDelete() {
	 const checkboxes = document.getElementsByName('tableSelect'); 
	 const deleteList = new Array();
	 checkboxes.forEach((checkbox) => {
		 if(checkbox.checked) {
			deleteList.push(checkbox.value);
		 }
	 })
	 if(deleteList.length == 0) {
		 alert("선택된 항목이 없습니다")
	 } else{
		 if(confirm("정말 삭제하시겠습니까?")){
	 		 $.ajax({
					url : 'deleteRoute',
					data : {
						deleteList : deleteList
					},
					traditional : true, 
					type : 'post',
					success : function(data) {
						if(data==1) {
							alert('삭제에 성공하였습니다');		
							location.reload();
						}
					}
			 }); 				 
		 }
	 }		
}

/* 출발지 도착지 중복 확인 */
function changeSelect(selectBox) {
	const departure_name = document.getElementById("departure_name");
	const arrivel_name = document.getElementById("arrival_name");	
	
	const departure_name_value = departure_name.options[departure_name.selectedIndex].value;
	const arrival_name_value = arrival_name.options[arrival_name.selectedIndex].value;
	
	if(departure_name_value == arrival_name_value) {
		alert("같은 지역을 선택할 수 없습니다");			
		selectBox.options[0].selected = true;
	}
}

/* 출발일 기간 확인 */
function checkDate(dateBox) {
	const departure_date_start = document.getElementById("departure_date_start");
	const departure_date_end = document.getElementById("departure_date_end");
	
	if(departure_date_start.value > departure_date_end.value) {
		alert("날짜 범위를 확인해 주세요");		
		departure_date_end.value = departure_date_start.value;
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

const btnSearchDetail = document.querySelector(".btn_search_detail");
btnSearchDetail.addEventListener("click", searchDetail);










