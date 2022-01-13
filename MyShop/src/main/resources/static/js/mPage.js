function lastCheck() {
	var check = confirm("정말로 탈퇴하시겠습니까? 탈퇴한 정보는 복구할 수 없습니다.");
	if (check == true) {
		return true;
	} else {
		return false;
	}
}

function pwdPopup() {
	var option = "width = 500, height = 500, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
	window.open("/member/pwdPopup", "비밀번호 변경", option);
}

$(document).ready(
	function() {
		$("#addressInput").hide();
		$("#editSave").hide();

		$("#editBtn").click(function() {
			$("#addressInput").show();
			$("#editSave").show();
			$("#editBtn").hide();
			$("#addressText").hide();

			new daum.Postcode({
				oncomplete: function(data) {
					$("#member_zipcode").val(data.zonecode);
					$("#member_address1").val(data.address);
					$("#member_address2").val("");
				}
			}).open();
		});

		$("#editSave").click(
			function() {
				var zip = $("#member_zipcode").val();
				var a1 = $("#member_address1").val();
				var a2 = $("#member_address2").val();
				$.ajax({
					url: "/member/update",
					data: {
						member_zipcode: zip,
						member_address1: a1,
						member_address2: a2
					},
					method: "post",
					success: function(data) {
						$("#addressInput").hide();
						$("#editSave").hide();
						$("#addressText").show();

						$("#addressText").empty();
						$("#addressText").html(
							"(" + data.member_zipcode + ")<br>"
							+ data.member_address1
							+ " "
							+ data.member_address2 + "<button id='editBtn' type='button' class='btn btn-outline-dark mx-1'>주소 변경</button>");
					}
				})
			});
	});