<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/mPage.js"></script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="col-md-3"></div>
		<div class="col-md-6 table-responsive" style="text-align: center">
			<div style="display: inline-block">
				<form action="${pageContext.request.contextPath }/member/delete"
					method="post" onsubmit="return lastCheck()">
					<table class="myTable table table-hover" style="min-width: 480px">
						<thead>
							<tr style="text-align: center">
								<th scope="col" colspan="2"><h3>
										<b>내 정보</b>
									</h3></th>
							</tr>
						</thead>
						<tr>
							<td style="min-width: 80px" class="align-middle">아이디</td>
							<td class="align-middle">${m.member_id }</td>
						</tr>
						<tr>
							<td class="align-middle">비밀번호</td>
							<td class="align-middle"><button type="button"
									class="btn btn-outline-dark" onclick="pwdPopup()">비밀번호 변경</button></td>
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
							<td class="align-middle">
								<div id="addressText">
									(${m.member_zipcode})<br>${m.member_address1}
									${m.member_address2}
									<button id="editBtn" type="button" class="btn btn-outline-dark">주소
										변경</button>
								</div>
								<div id="addressInput">
									<div class="row">
										<div class="col-6">
											<input type="text" readonly class="form-control"
												id="member_zipcode" name="member_zipcode"
												value="${m.member_zipcode }">
										</div>
									</div>
									<div>
										<input type="text" readonly class="form-control my-2"
											id="member_address1" name="member_address1"
											value="${m.member_address1 }"> <input type="text"
											class="form-control my-2" id="member_address2"
											name="member_address2" value="${m.member_address2 }">
									</div>
								</div>
								<button id="editSave" type="button" class="btn btn-outline-dark">저장</button>
							</td>
						</tr>
						<tr>
							<td class="align-middle">생일</td>
							<td class="align-middle"><c:set var="birtyValue"
									value="${m.member_birty }" /> ${fn:substring(birtyValue, 5, 7)}월
								${fn:substring(birtyValue, 8, 10)}일</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: right; border: none">
								<button type="submit" id="delBtn" class="btn btn-danger">회원탈퇴</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
</body>
</html>