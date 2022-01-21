<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/mSearch.js"></script>
<style>
.h-div {
	background-color: black;
	color: white
}
.h-div>.row {
	margin: 0;
}

.h-div>.row>div {
	padding: 0
}

.infoSearchInput {
	width: 50%;
	display: inline-block
}
</style>
</head>
<body>
	<div class="container-fluid h-div py-1 px-2 mb-3">
		<div class="w-100 align-items-center">
			<div class="h-c2 col-sm-12" style="text-align: center">
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