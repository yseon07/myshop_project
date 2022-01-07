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

	<div class="mainDiv row align-items-center">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<form action="${pageContext.request.contextPath }/member/login"
				method="post">
				<div>
					<input id="member_id" name="member_id" type="text"
						class="form-control my-2" placeholder="아이디 입력">
				</div>
				<div>
					<input id="member_pwd" name="member_pwd" type="text"
						class="form-control my-2" placeholder="비밀번호 입력">
				</div>
				<div>
					<input id="member_nick" name="member_nick" type="text"
						class="form-control my-2" placeholder="닉네임 입력">
				</div>
				<div>
					<input id="member_phone" name="member_phone" type="text"
						class="form-control my-2" placeholder="핸드폰 번호 입력">
				</div>


				<!-- 우편번호 api 가져오기 -->
				<!-- ------------------- -->

				<div class="row align-items-center">
					<div class="col-sm-4">
						<select class="form-select my-2" id="birty1" name="birty1">
							<c:forEach varStatus="status" begin="1" end="12">
								<option value="${status.count}">${status.count}월</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-4">
						<select class="form-select my-2" id="birty2" name="birty2">
							<c:forEach varStatus="status" begin="1" end="31">
								<option value="${status.count}">${status.count}일</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<button type="submit" class="btn btn-dark w-100">회원가입</button>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>