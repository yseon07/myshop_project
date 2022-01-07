<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="loginDiv">
				<form action="${pageContext.request.contextPath }/member/login"
					method="post">
					<input id="member_id" name="member_id" type="text"
						class="form-control my-2" placeholder="아이디 입력" required> <input
						id="member_pwd" name="member_pwd" type="text"
						class="form-control my-2" placeholder="비밀번호 입력" required>
					<button type="submit" class="btn btn-dark col-12">로그인</button>
				</form>
				<div class="id_search row justify-content-between">
					<div class="col-6" style="display: inline">
						<a class="text-reset text-decoration-none" href="#">아이디 찾기 & 비밀번호 찾기</a>
					</div>
					<div class="jLink col-3">
						<a class="text-reset text-decoration-none" href="#">회원가입</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>