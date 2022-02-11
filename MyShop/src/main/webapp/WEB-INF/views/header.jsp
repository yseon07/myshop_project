<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>my_shop</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
<style>
.h-div {
	background-color: black;
	color: white;
	font-size: 13px;
}
/* .h-div { background-color: #D9E5FF } */
.h-div>.row {
	margin: 0;
}

.h-div>.row>div {
	padding: 0;
}

.h-div>.row>.h-c2 {
	text-align: center;
}

.h-div>.row>.h-c3 {
	text-align: right;
	padding: 0px;
}

#drMenu {
	cursor: pointer;
	text-decoration: none;
}

#basketA {
	text-decoration: none;
}
</style>
<script>
	$(function() {
		$("#drMenu").click(function() {
			$("#myMem").slideToggle("fast");
		});

		$("html").click(function(e) {
			if (!$(e.target).hasClass("myMenu")) {
				$("#myMem").slideUp("fast");
			}
		});
	});
</script>
</head>
<body>
	<div class="w-100 container-fluid h-div py-1 px-2 mb-3">
		<div class="row w-100 align-items-center">
			<div class="h-c1 col-sm-4"></div>
			<div class="h-c2 col-sm-4">
				<a class="text-reset text-decoration-none" href="/"><h4>MyShop</h4></a>
			</div>
			<div class="h-c3 col-sm-4">
				<c:choose>
					<c:when test="${sessionScope.id == null }">
						<button type="button" class="btn btn-sm btn-outline-light"
							onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인</button>
						<%-- 						<button type="button" class="btn btn-sm btn-outline-light"
							onclick="location.href='${pageContext.request.contextPath}/member/join'">회원가입</button> --%>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${sessionScope.type == 0 }">
								관리자
								<button type="button" class="btn btn-sm btn-outline-light"
									onclick="location.href='${pageContext.request.contextPath }/category/admin'">카테고리</button>
								<button type="button" class="btn btn-sm btn-outline-light"
									onclick="location.href='${pageContext.request.contextPath}/product/add'">제품
									등록</button>
								<button type="button"
									class="myMenu btn btn-sm btn-outline-light"
									onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
							</c:when>
							<c:otherwise>

								<span><a id="basketA" class="text-reset"
									href="${pageContext.request.contextPath }/member/myBasket">
										<i class="bi bi-cart-check-fill"></i> 장바구니
								</a></span>
								
								|
								<a id="drMenu" class="myMenu text-reset">${sessionScope.nick }님[${sessionScope.point }P
									/ <c:choose>
										<c:when test="${sessionScope.level == 1}">
											<i class="bi bi-dice-1-fill mx-1"></i>일반 회원]▼</c:when>
										<c:when test="${sessionScope.level == 2}">
											<i class="bi bi-dice-2-fill mx-1"></i>정회원)▼</c:when>
										<c:otherwise>
											<i class="bi bi-dice-3-fill mx-1"></i>VIP)▼</c:otherwise>
									</c:choose>
								</a>
								<!-- toggle -->
								<div class="border myMenu rounded-3" id="myMem"
									style="text-align: right; position: absolute; right: 10px; top: 35px; background-color: white; display: none">
									<button type="button"
										class="myMenu btn btn-sm btn-outline-black"
										onclick="location.href='${pageContext.request.contextPath}/member/mypage'">내
										정보</button>
									<br>
									<button type="button"
										class="myMenu btn btn-sm btn-outline-black"
										onclick="location.href='${pageContext.request.contextPath}/member/logout'">로그아웃</button>
								</div>
								<!-- toggle -->
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</body>
</html>