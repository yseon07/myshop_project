<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
ul {
	list-style: none;
	margin: 0;
	padding: 0;
	text-align: center
}

li {
	margin: 0 0 0 0;
	padding: 0 0 0 0;
	border: 0;
	display: inline-block;
}

#imgMain {
	margin: 10px auto;
	position: relative;
	border: 1px solid black;
}

#imgMain img {
	vertical-align: middle;
}

.likeList {
	padding: 5px 10px;
	text-align: center;
	position: absolute;
	bottom: 0;
	right: -5px;
	opacity: 0;
}
</style>
<script>
	$(function() {
		$("div[id*='img']").click(function() {
			alert("?");
		});
		
		
		$("").mouseover(function() {
			var n = $(this).attr("id").substring(4);
			$("#like" + n).css("opacity", 0);
		});
	});
</script>
</head>
<body>
	<div class="mainDiv row align-items-center justify-content-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="col-2"></div>
		<div class="col-8 justify-content-center">

			<c:choose>
				<c:when test="${not empty list }">
					<ul>
						<c:forEach var="p" items="${list }" varStatus="status">
							<%-- <c:set var="i" value="0" />
							<c:set var="j" value="5" /> --%>
							<li class="mx-2 my-2">
								<div id="imgMain${status.index }">
									<c:choose>
										<c:when test="${not empty p.files }">
											<img id="imgs${status.index }" width="200" height="200"
												src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${p.files[0]}">
										</c:when>
										<c:otherwise>
											<img id="imgs${status.index }" width="200" height="200"
												src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
										</c:otherwise>
									</c:choose>
									<div id="like${status.index }" class="likeList">
										<button type="button" id="cBtn${status.index }" class="btn btn-light">
											<i class="bi bi-cart-plus"></i>
										</button>
										<button type="button" id="lBtn${status.index }" class="btn btn-light">
											<i class="bi bi-heart"></i>
										</button>
									</div>
									<%-- <c:forEach items="${p.files }" var="f"> 이미지 전체 출력
												<img width="200" height="200"
													src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${f}">
											</c:forEach> --%>
								</div>
								<div>
									<b>${p.product_price }</b>원<br> ${p.product_title }<br>
									리뷰 0개
								</div>
							</li>
						</c:forEach>
					</ul>
				</c:when>
				<c:otherwise>
					등록된 제품이 없습니다.
				</c:otherwise>
			</c:choose>
		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>