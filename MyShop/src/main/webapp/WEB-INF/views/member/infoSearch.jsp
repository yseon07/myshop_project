<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../head.jsp"></c:import>
<script>
	$(document).ready(function() {
		$("#idSearchBtn").click(function() {
			var i = $("#si1").val();
			$.get('/member/idSearch', {
				member_phone : i
			}, function(data) {
				alert("회원님의 아이디는 " + data + " 입니다.");
			});
		});

		$("#pwdSearchBtn").click(function() {
			var p1 = $("#sp1").val();
			var p2 = $("#sp2").val();
			$.post('/member/pwdSearch', {
				member_id : p1,
				member_phone : p2
			}, function(data) {
				alert("회원님의 비밀번호는 " + data + " 입니다.");
			}); // 이메일로 임시 번호 발급(나중에 구현)
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

.infoSearchInput {
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
	<div>
		<div class="mt-4 col-12">
			<div id="idSearchDiv" style="text-align: center">
				<input id="si1" type="text"
					class="form-control my-3 infoSearchInput"
					placeholder="핸드폰 번호(-제외) 입력"><br>
				<button type="button" id="idSearchBtn" class="btn btn-outline-dark">아이디
					찾기</button>
			</div>
			<div id="pwdSearchDiv" style="text-align: center; margin-top: 50px">
				<input id="sp1" type="text"
					class="form-control infoSearchInput my-2" placeholder="아이디 입력">
				<input type="text" id="sp2"
					class="form-control infoSearchInput my-3"
					placeholder="핸드폰 번호(-제외) 입력"><br>
				<button type="button" id="pwdSearchBtn" class="btn btn-outline-dark">비밀번호
					찾기</button>
			</div>
		</div>
	</div>
</body>
</html>