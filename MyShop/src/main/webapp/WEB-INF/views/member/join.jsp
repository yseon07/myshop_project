<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myShop-join</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/mJoin.js"></script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<form action="${pageContext.request.contextPath }/member/join"
					method="post" onsubmit="return allCheck()">
					<div class="joinList my-2">
						<input id="member_id" required name="member_id" type="text"
							class="form-control" placeholder="아이디 입력">
						<div class="invalid-feedback">이메일 형식이 아니거나, 중복된 아이디입니다.</div>
						<div class="valid-feedback">사용 가능한 아이디입니다.</div>
					</div>
					<div class="joinList my-2">
						<input id="member_pwd" required name="member_pwd" type="password"
							class="form-control" placeholder="비밀번호 입력">
					</div>
					<div class="joinList my-2">
						<input id="member_pwd2" required name="member_pwd2"
							type="password" class="form-control" placeholder="비밀번호 확인">
						<div class="invalid-feedback">비밀번호가 다릅니다.</div>
					</div>
					<div class="joinList my-2">
						<input id="member_nick" required name="member_nickname"
							type="text" class="form-control" placeholder="닉네임 입력">
						<div class="invalid-feedback">사용할 수 없는 닉네임입니다.</div>
						<div class="valid-feedback">사용 가능한 닉네임입니다.</div>
					</div>
					<div class="joinList my-2">
						<input id="member_phone" required name="member_phone" type="text"
							class="form-control" placeholder="핸드폰 번호 입력(-제외)">
						<div class="invalid-feedback">휴대폰 번호를 정확히 입력해주세요(-제외)</div>
					</div>
					<div class="row">
						<div class="col-6">
							<input type="text" readonly class="form-control"
								id="member_zipcode" name="member_zipcode" placeholder="우편번호">
						</div>
						<div class="col-6">
							<button type="button" id="a_search" class="btn border">주소
								검색</button>
						</div>
					</div>
					<div>
						<input type="text" readonly class="form-control my-2"
							id="member_address1" name="member_address1" placeholder="도로명 주소">
						<input type="text" class="form-control my-2" id="member_address2"
							name="member_address2" placeholder="상세 주소">
					</div>
					<div class="row align-items-center">
						<div class="col-sm-3">
							<select class="form-select my-3" id="birty1" name="birty1">
								<option>월</option>
								<c:forEach varStatus="status" begin="1" end="12">
									<option value="${status.count}">${status.count}월</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-sm-3">
							<select class="form-select my-3" id="birty2" name="birty2">
								<option>일</option>
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
	</div>
</body>
</html>