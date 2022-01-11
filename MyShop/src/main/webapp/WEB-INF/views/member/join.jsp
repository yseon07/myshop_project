<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myShop-join</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<c:import url="../head.jsp"></c:import>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
				oncomplete : function(data) {
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

	$(document)
			.ready(
					function() {
						$("#member_id")
								.change(
										function() {
											var value = $(this).val();
											var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
											if (!regExp.test(value)) {
												$("#member_id").addClass(
														"is-invalid");
												$("#member_id").removeClass(
														"is-valid");
												cId = false;
											} else {
												$("#member_id").removeClass(
														"is-invalid");

												$
														.ajax({
															url : '/member/idCheck',
															type : 'post',
															data : {
																member_id : value
															},
															success : function(
																	data) {
																if (data == 1) {
																	$(
																			"#member_id")
																			.addClass(
																					"is-valid");
																	$(
																			"#member_id")
																			.removeClass(
																					"is-invalid");
																	cId = true;
																} else {
																	$(
																			"#member_id")
																			.addClass(
																					"is-invalid");
																	$(
																			"#member_id")
																			.removeClass(
																					"is-valid");
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

						$("#member_phone")
								.change(
										function() {
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
										url : '/member/nickCheck',
										type : 'post',
										data : {
											nickname : nickName
										},
										success : function(data) {
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
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
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
					<input id="member_pwd2" required name="member_pwd2" type="password"
						class="form-control" placeholder="비밀번호 확인">
					<div class="invalid-feedback">비밀번호가 다릅니다.</div>
				</div>
				<div class="joinList my-2">
					<input id="member_nick" required name="member_nickname" type="text"
						class="form-control" placeholder="닉네임 입력">
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
</body>
</html>