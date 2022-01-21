<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/rAdd.js"></script>
<style>
.sStar {
	cursor: pointer;
}

.iStar {
	color: black;
}

.h-div {
	background-color: black;
	color: white;
}

.h-div>.row {
	margin: 0;
}

.h-div>.row>div {
	padding: 0;
}

.h-div>.row>.h-c2 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="container-fluid h-div py-1 px-2 mb-3">
		<div class="w-100 align-items-center justify-content-center">
			<div class="h-c2 col-sm-12" style="text-align: center">
				<h4>MyShop</h4>
			</div>
		</div>
	</div>
	<div class="mainDiv" style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<div id="writeRe" class="card border-0" style="width: 100%;">
					<form
						action="${pageContext.request.contextPath }/review/add?pNum=${pNum}"
						onsubmit="return starCheck()" method="post">
						<div class="card-body">
							<h6 class="card-subtitle mb-2 text-muted">${sessionScope.nick }님의
								후기</h6>
							<h5 class="card-title">
								<span class="sStar"> <c:forEach begin="1" end="5"
										varStatus="status">
										<i class="fas bi bi-star iStar" style="font-size: 30px"></i>
									</c:forEach>
								</span>
							</h5>
							<p class="card-text">
								<textarea style="width: 100%; resize: none" rows="3"
									placeholder="후기를 남겨주세요." id="content" name="content"></textarea>
							</p>
							<input type="hidden" id="star" name="star" value="0"> <input
								type="hidden" id="id" name="mem_id" value="${sessionScope.id }">
							<div style="text-align: right">
								<button type="submit" class="btn btn-dark">등록</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>