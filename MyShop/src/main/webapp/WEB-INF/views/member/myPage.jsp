<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
	function lastCheck() {
		var check = confirm("정말로 탈퇴하시겠습니까? 탈퇴한 정보는 복구할 수 없습니다.");
		if (check == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="col-md-3"></div>
		<div class="col-md-6 table-responsive">
			<form action="${pageContext.request.contextPath }/member/delete"
				method="post" onsubmit="return lastCheck()">
				<table class="table table-hover">
					<thead>
						<tr style="text-align: center">
							<th scope="col" colspan="2"><h3>
									<b>내 정보</b>
								</h3></th>
						</tr>
					</thead>
					<tr>
						<td class="align-middle">아이디</td>
						<td class="align-middle">${m.member_id }</td>
					</tr>
					<tr>
						<td class="align-middle">비밀번호</td>
						<td class="align-middle"><button type="button"
								class="btn btn-outline-dark">비밀번호 변경</button></td>
					</tr>
					<tr>
						<td class="align-middle">닉네임</td>
						<td class="align-middle">${m.member_nickname }</td>
					</tr>
					<tr>
						<td class="align-middle">전화번호</td>
						<td class="align-middle"><c:set var="phoneValue"
								value="${m.member_phone }" /> ${fn:substring(phoneValue, 0, 3)}-${fn:substring(phoneValue, 3, 7)}-${fn:substring(phoneValue, 7, 11)}
						</td>
					</tr>
					<tr>
						<td class="align-middle">주소</td>
						<td class="align-middle">(${m.member_zipcode})<br>
							${m.member_address1} ${m.member_address2}
							<button type="button" class="btn btn-outline-dark">주소 변경</button>
						</td>
					</tr>
					<tr>
						<td class="align-middle">생일</td>
						<td class="align-middle"><c:set var="birtyValue"
								value="${m.member_birty }" />
								${fn:substring(birtyValue, 5, 7)}월
							${fn:substring(birtyValue, 8, 10)}일</td>
					</tr>
				</table>
				<div style="text-align: right">
					<button type="submit" id="delBtn" class="btn btn-danger">회원탈퇴</button>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>