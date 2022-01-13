function closePwd() {
	window.close();
}
$(document).ready(function() {
	$("#member_pwd, #member_pwd2").change(function() {
		var p1 = $("#member_pwd").val();
		var p2 = $("#member_pwd2").val();

		if (p1 != p2) {
			$("#member_pwd").addClass("is-invalid");
			$("#member_pwd2").addClass("is-invalid");
			$("#member_pwd2").focus();
		} else {
			$("#member_pwd").removeClass("is-invalid");
			$("#member_pwd2").removeClass("is-invalid");
		}
	});

	$("#pwdBtn").click(function() {
		var p1 = $("#pwd").val();
		var p2 = $("#member_pwd").val();
		var p3 = $("#member_pwd2").val();

		if (p2 == p3) {

			$.post('/member/pwdUpdate', {
				pPwd: p1,
				member_pwd: p2
			}, function(data) {
				if (data == 1) {
					alert("비밀번호 변경에 성공하였습니다.");
					alert("비밀번호가 변경되어 자동으로 로그아웃 됩니다.");
					opener.location.href = "/member/logout";
				} else {
					alert("비밀번호 변경에 실패하였습니다.");
				}
				window.close();
			});
		} else {
			alert("비밀번호를 다시 확인해주세요.");
		}
	});
});