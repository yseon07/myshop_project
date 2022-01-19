function starCheck() {
	if ($("#star").val() <= 0) {
		alert("별점을 입력해주세요.")
		return false;
	} else if ($("#content").val() == null
		|| $("#content").val().trim() == "") {
		alert($("#content").val());
		alert("내용을 입력해주세요.")
		return false;
	}
}

$(document).ready(function() {
	var list = $('.sStar i');
	list.click(function() {
		var itemIndex = $(this).index();
		$("#star").val(itemIndex + 1);
		for (i = 4; i >= 0; i--) {
			if (itemIndex >= i) {
				$('.sStar i').eq(i).removeClass("bi-star");
				$('.sStar i').eq(i).addClass("bi-star-fill");
			} else {
				$('.sStar i').eq(i).addClass("bi-star");
				$('.sStar i').eq(i).removeClass("bi-star-fill");
			}
		}
	});
});