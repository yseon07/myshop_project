<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myShop-orderList</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<!-- <script src="/resources/js/m.js"></script> -->
<style>
td {
	vertical-align: middle;
	text-align: center;
}
</style>
<script>
$(function() {
	$(".reviewWrite").click(function() {
		var pNum = $(this).attr("data-pNum");		
		var option = "width = 700, height = 400, top = 100, left = 200, scrollbars = no, location = no, toolbars = no, status = no";
		window.open("/review/add?pNum=" + pNum, "비밀번호 변경", option);
	});
})
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table border">
					<tr style="text-align: center">
						<th></th>
						<th></th>
						<th>주문 수량</th>
						<th>총 가격</th>
						<th>주문 날짜</th>
						<th></th>
					</tr>
					<c:forEach items="${list }" var="o">
						<tr>
							<td style="width: 25%"><c:choose>
									<c:when test="${not empty o.product.files }">
										<img id="imgs${o.product.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=${o.product.num}&fname=${o.product.files[0]}">
									</c:when>
									<c:otherwise>
										<img id="imgs${o.product.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
									</c:otherwise>
								</c:choose></td>
							<td><a class="text-reset"
								href="${pageContext.request.contextPath }/product/${o.product.num}">${o.product.product_title }</a></td>
							<td>${o.quantity }</td>
							<td><fmt:formatNumber value="${o.price }" pattern="#,###" />원
							</td>
							<td><fmt:formatDate var="day" value="${o.order_date}"
									pattern="YYYY.MM.DD h시 m분" /> ${day }</td>
							<td>
								<button type="button" class="btn btn-dark reviewWrite" data-pNum="${o.product.num }">리뷰
									작성</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>