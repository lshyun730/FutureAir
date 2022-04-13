/* 상세검색 submit */
function pagingFormSubmit(currentPage) {
	const form = document.getElementById("search_detail");
	const page = document.getElementById("page");
	
	page.value = currentPage;
	form.submit();
}


// 모달창 Open/Close
function modalOpen(){ document.getElementById("modal").style.display = 'flex'; }
function modalClose(){ document.getElementById("modal").style.display = 'none'; }


// 팝업창 오픈
function popupOpen(link, width, height) {
	const popupX = (window.screen.width / 2) - (width / 2);
	const popupY= (window.screen.height /2) - (height / 2);
	window.open(link, '_blank', 'width=' + width + ',height=' + height + ',left=' + popupX + ',top=' + popupY );
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
