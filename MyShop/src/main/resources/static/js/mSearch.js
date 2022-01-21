$(function() {
	$("#idSearchBtn").click(function() {
		var i = $("#si1").val();
		var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

		if (i != null && i != "" && regExp.test(i)) {
			$.get('/member/idSearch', {
				member_phone: i
			}, function(data) {
				if (data != null && data != "") {
					alert("회원님의 아이디는 " + data + " 입니다.");
				} else {
					alert("해당하는 아이디를 찾을 수 없습니다.");
				}
			})
		} else {
			alert("핸드폰 번호를 양식에 맞춰 입력해주세요.");
		}
	});

	$("#pwdSearchBtn").click(function() {
		var p1 = $("#sp1").val();
		var p2 = $("#sp2").val();
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var regExp2 = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

		if (p1 != null && p2 != null && p1 != "" && p2 != "" && regExp.test(p1) && regExp2.test(p2)) {
			$.post('/member/pwdSearch', {
				member_id: p1,
				member_phone: p2
			}, function(data) {
				if (data != null && data != "") {
					alert("회원님의 비밀번호는 " + data + " 입니다.");
				} else {
					alert("해당하는 정보를 찾을 수 없습니다.");
				}
			});
		} else {
			alert("아이디와 핸드폰 번호를 정확히 입력해주세요.");
		}// 이메일로 임시 번호 발급(나중에 구현)
	});
});