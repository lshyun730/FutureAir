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