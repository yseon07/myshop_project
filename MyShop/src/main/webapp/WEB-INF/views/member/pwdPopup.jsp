<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<c:import url="../head.jsp"></c:import>
<script>
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

			$.post('/member/pwdUpdate', {
				pPwd : p1,
				member_pwd : p2
			}, function(data) {
				if (data == 1) {
					alert("비밀번호 변경에 성공하였습니다.");
					alert("비밀번호가 변경되어 자동으로 로그아웃 됩니다.");
					opener.location.href="${pageContext.request.contextPath}/member/logout";
				} else {
					alert("비밀번호 변경에 실패하였습니다.");
				}
				window.close();
			});
		});
	});
</script>
<style>
.h-div {
	background-color: black;
	color: white
}
/* .h-div { background-color: #D9E5FF } */
.h-div>.row {
	margin: 0;
}

.h-div>.row>div {
	padding: 0
}

.h-div>.row>.h-c2 {
	text-align: center
}

.h-div>.row>.h-c3 {
	text-align: right;
	padding: 0px
}

.pwdInput {
	width: 50%;
	display: inline-block
}
</style>
</head>
<body>
	<div class="container-fluid h-div py-1 px-2 mb-3">
		<div class="row w-100 align-items-center">
			<div class="h-c2 col-sm-4">
				<h4>MyShop</h4>
			</div>
		</div>
	</div>
	<div style="text-align: center">
		<h3>
			<b>비밀번호 변경</b>
		</h3>
		<div class="mt-3 col-12">
			<div class="my-3">
				<input type="password" id="pwd" class="pwdInput form-control"
					placeholder="현재 비밀번호">
			</div>
			<div class="my-3">
				<input type="password" class="pwdInput form-control"
					name="member_pwd" id="member_pwd" placeholder="새 비밀번호">
			</div>
			<div class="my-3">
				<input type="password" class="pwdInput form-control"
					name="member_pwd2" id="member_pwd2" placeholder="새 비밀번호 확인">
				<div class="invalid-feedback">비밀번호가 다릅니다.</div>
			</div>
			<div class="my-3">
				<button type="button" class="btn btn-dark" id="pwdBtn">비밀번호
					변경</button>
				<button type="button" class="btn btn-dark" onclick="closePwd()">취소</button>
			</div>
		</div>
	</div>
</body>
</html>