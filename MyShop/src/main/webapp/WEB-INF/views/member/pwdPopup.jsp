<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/mPopup.js"></script>
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
		<div class="w-100 align-items-center">
			<div class="row">
				<div class="h-c2 col-sm-4">
					<h4>MyShop</h4>
				</div>
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