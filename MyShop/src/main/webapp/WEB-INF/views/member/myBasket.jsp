<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myshop-myBasket</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/mBasket.js"></script>
<style>
td {
	vertical-align: middle;
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 7%">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive" style="text-align: center">
				<c:choose>
					<c:when test="${not empty list }">
						<br>
						<form method="post"
							action="${pageContext.request.contextPath }/order">
							<table class="table">
								<caption>
									<b>장바구니</b>
									<hr style="margin: 3px; height: 3px ; background-color: black">
								</caption>
								<c:forEach items="${list }" var="o" varStatus="status1">
									<tr>
										<td style="width: 25%"><c:choose>
												<c:when test="${not empty o.product.files }">
													<img id="imgs${o.p_num }" width="70" height="70"
														src="${pageContext.request.contextPath }/img?num=${o.p_num}&fname=${o.product.files[0]}">
												</c:when>
												<c:otherwise>
													<img id="imgs${o.p_num }" width="70" height="70"
														src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
												</c:otherwise>
											</c:choose></td>
										<td><a class="text-reset"
											href="${pageContext.request.contextPath }/product/${o.p_num}">${o.product.product_title }</a></td>

										<td style="width: 20%; padding-left: 0px"><span
											id="priceText${status1.index }"
											data-defaultPrice="${o.product.product_price }">${o.product.product_price }</span>원</td>
										<td><input type="number" onkeyPress="checkNum()"
											class="form-control quan" id="${status1.index }"
											style="text-align: center; width: 70px; display: inline-block"
											value="1"></td>
										<td style="width: 5%; font-size: 30px"><a
											class="text-reset"
											href="${pageContext.request.contextPath }/del/basket?pNum=${o.p_num}"><i
												class="bi bi-x"></i></a></td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="5"><button type="submit"
											class="btn btn-dark w-100">구매</button></td>
								</tr>
							</table>
						</form>
					</c:when>
					<c:otherwise>
						<h5>장바구니에 담은 물품이 없습니다.</h5>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>