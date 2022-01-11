<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
	$(document).ready(function() {
		$("#searchA").click(function() {
			searchPopup();
		});
	});

	function searchPopup() {
		var option = "width = 500, height = 500, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
		window.open("/member/infoSearch", "내 정보 찾기", option);
	}
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row" style="padding: 0 5% 0 5%; margin-top: 15%">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="loginDiv">
				<form action="${pageContext.request.contextPath }/member/login"
					method="post">
					<input id="member_id" name="member_id" type="text"
						class="form-control my-2" placeholder="아이디 입력" required> <input
						id="member_pwd" name="member_pwd" type="password"
						class="form-control my-2" placeholder="비밀번호 입력" required>
					<button type="submit" class="btn btn-dark col-12">로그인</button>
				</form>
				<div class="id_search row justify-content-between">
					<div class="col-6" style="display: inline; text-align: left">
						<a id="searchA" class="text-reset text-decoration-none"> Id &
							Password 찾기</a>
					</div>
					<div class="jLink col-3">
						<a class="text-reset text-decoration-none"
							href="${pageContext.request.contextPath}/member/join">회원가입</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
</body>
</html>