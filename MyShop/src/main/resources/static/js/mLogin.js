$(document).ready(function() {
	$("#searchA").click(function() {
		searchPopup();
	});
});

function searchPopup() {
	var option = "width = 500, height = 500, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
	window.open("/member/infoSearch", "내 정보 찾기", option);
}