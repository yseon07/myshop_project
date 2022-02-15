<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myShop-likeList</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<!-- <script src="/resources/js/m.js"></script> -->
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
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<table class="table border">
					<c:forEach items="${list }" var="l">
						<tr>
							<td style="width: 25%"><c:choose>
									<c:when test="${not empty l.p.files }">
										<img id="imgs${l.p.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=${l.p.num}&fname=${l.p.files[0]}">
									</c:when>
									<c:otherwise>
										<img id="imgs${l.p.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
									</c:otherwise>
								</c:choose></td>
							<td><a class="text-reset"
								href="${pageContext.request.contextPath }/product/${l.p.num}">${l.p.product_title }</a></td>

							<td style="width: 20%; padding-left: 0px"><span
								id="priceText${status1.index }"
								data-defaultPrice="${l.p.product_price }">${l.p.product_price }</span>원</td>

							<td style="width: 5%; font-size: 30px"><i class="bi bi-x"></i></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>