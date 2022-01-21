var cId = false;
var cPwd = false;
var cNick = false;
var cTel = false;
var cAddr = false;
var cBirty = false;

$(document).ready(function() {
	$("#a_search").click(function() {
		cAddr = false;
		new daum.Postcode({
			oncomplete: function(data) {
				$("#member_zipcode").val(data.zonecode);
				$("#member_address1").val(data.address);
				$("#member_address2").val("");
				cAddr = true;
			}
		}).open();
	});
});

function allCheck() {
	if (cId && cPwd && cNick && cTel && cAddr && cBirty) {
		return true;
	} else {
		if (!cAddr) {
			alert("주소를 입력해주세요.");
		} else if (!cBirty) {
			alert("생일을 선택해주세요.");
		} else {
			alert(cId);
			alert(cPwd);
			alert(cNick);
			alert(cTel);
			alert("양식에 맞게 입력해주세요.")
		}
		return false;
	}
}

$(function() {
	$("#member_id").change(function() {
		var value = $(this).val();
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if (!regExp.test(value)) {
			$("#member_id").addClass("is-invalid");
			$("#member_id").removeClass("is-valid");
			cId = false;
		} else {
			$("#member_id").removeClass("is-invalid");
			$.ajax({
				url: '/member/idCheck',
				type: 'post',
				data: {
					member_id: value
				},
				success: function(data) {
					if (data == 1) {
						$("#member_id").addClass("is-valid");
						$("#member_id").removeClass("is-invalid");
						cId = true;
					} else {
						$("#member_id").addClass("is-invalid");
						$("#member_id").removeClass("is-valid");
						cId = false;
					}
				}
			});
		}
	});

	$("#member_pwd, #member_pwd2").change(function() {
		var p1 = $("#member_pwd").val();
		var p2 = $("#member_pwd2").val();

		if (p1 != p2) {
			$("#member_pwd").addClass("is-invalid");
			$("#member_pwd2").addClass("is-invalid");
			$("#member_pwd2").focus();
			cPwd = false;
		} else {
			$("#member_pwd").removeClass("is-invalid");
			$("#member_pwd2").removeClass("is-invalid");
			cPwd = true;
		}
	});

	$("#member_phone").change(function() {
		var value = $(this).val();
		var regExp = /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/;

		if (!regExp.test(value)) {
			$("#member_phone").addClass(
				"is-invalid");
			cTel = false;
		} else {
			$("#member_phone").removeClass(
				"is-invalid");
			cTel = true;
		}
	});

	$("#member_nick").change(
		function() {
			var nickName = $(this).val();

			$.ajax({
				url: '/member/nickCheck',
				type: 'post',
				data: {
					nickname: nickName
				},
				success: function(data) {
					if (data == 0) {
						$("#member_nick").addClass(
							"is-valid");
						$("#member_nick").removeClass(
							"is-invalid");
						cNick = true;
					} else {
						$("#member_nick").addClass(
							"is-invalid");
						$("#member_nick").removeClass(
							"is-valid");
						cTel = false;
					}
				}
			});
		});

	$("select").change(function() {
		var b1 = $("#birty1 option:selected").val();
		var b2 = $("#birty2 option:selected").val();
		if (b1 >= 1 && b2 >= 1) {
			cBirty = true;
		} else {
			cBirty = false;
		}
	});
});