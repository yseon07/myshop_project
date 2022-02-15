<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="/resources/js/pList.js"></script>
<script>
	$(function() {
		$(".circle").click(
				function() {
					var id = '${sessionScope.id}';
					if (id != null && id != "") {
						var num = $(this).attr('data-num');
						var ob = $(this).children("i");

						if ($(this).attr("id") == "cBtn") {
							if ($(this).children("i").hasClass(
									"bi-cart-plus-fill")) {
								alert("이미 장바구니에 들어 있습니다.");
							} else {
								var an = confirm("장바구니에 넣으시겠습니까?");
								if (an) {
									$.ajax({
										url : "/addBasket?b_num=" + num,
										method : 'get',
										success : function(data) {
										}
									});
									$(this).children("i").removeClass(
											"bi-cart-plus");
									$(this).children("i").addClass(
											"bi-cart-plus-fill");
									alert("장바구니에 등록되었습니다.");
								}
							}
						} else {
							$.ajax({
								url : "/like/" + num,
								data : {
									p_num : num,
									mem_id : id
								},
								method : 'post',
								success : function(data) {
									if (data == 1) {
										ob.removeClass("bi-heart");
										ob.addClass("bi-heart-fill");
									} else {
										ob.removeClass("bi-heart-fill");
										ob.addClass("bi-heart");
									}
								}
							});
						}
					} else {
						var an = confirm("로그인이 필요한 기능입니다. 로그인 하시겠습니까?");
						if (an == true) {
							location.href = "/member/login";
						}
					}
					event.stopPropagation();
				});
	});
</script>
</head>
<body>
	<div class="mainDiv align-items-center justify-content-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8 justify-content-center text-center">
				<c:choose>
					<c:when test="${not empty list }">
						<ul id="ul1">
							<c:forEach var="p" items="${list }">
								<%-- <c:set var="i" value="0" />
							<c:set var="j" value="5" /> --%>
								<li class="mx-2 my-2">
									<div id="imgMain" class="${p.num }">
										<c:choose>
											<c:when test="${not empty p.files }">
												<img id="imgs${p.num }" width="200" height="200"
													src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${p.files[0]}">
											</c:when>
											<c:otherwise>
												<img id="imgs${p.num }" width="200" height="200"
													src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
											</c:otherwise>
										</c:choose>
										<div class="likeList">
											<div id="cBtn" class="circle" data-num="${p.num }">
												<i class="bi bi-cart-plus"></i>
											</div>
											<div id="lBtn" class="circle" data-num="${p.num }">
												<c:if test="${p.likeCheck == 0 }">
													<i class="bi bi-heart"></i>
												</c:if>
												<c:if test="${p.likeCheck == 1 }">
													<i class="bi bi-heart-fill"></i>
												</c:if>
											</div>
										</div>
									</div>
									<div>
										<c:if test="${p.discount == 0 }">
											<b><fmt:formatNumber value="${p.product_price }"
													pattern="#,###" /></b>원
										</c:if>
										<c:if test="${p.discount != 0 }">
											<b><fmt:formatNumber
													value="${fn:split(p.product_price - p.product_price * p.discount/100, '.')[0]}"
													pattern="#,###" /></b>원
										</c:if>
										<br> ${p.product_title }<br>
										<%-- 리뷰 ${p.reviewCount}개 --%>
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
		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>