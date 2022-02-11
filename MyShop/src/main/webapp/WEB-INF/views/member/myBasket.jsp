<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
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
		style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 table-responsive" style="text-align: center">
				<h5>장바구니</h5>
				<table class="table border">
					<c:forEach items="${list }" var="p">
						<tr>
							<td style="width: 25%"><c:choose>
									<c:when test="${not empty p.files }">
										<img id="imgs${p.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=${p.num}&fname=${p.files[0]}">
									</c:when>
									<c:otherwise>
										<img id="imgs${p.num }" width="70" height="70"
											src="${pageContext.request.contextPath }/img?num=0&fname=no_img.jpg">
									</c:otherwise>
								</c:choose></td>
							<td><a class="text-reset"
								href="${pageContext.request.contextPath }/product/${p.num}">${p.product_title }</a></td>

							<td style="width: 30%; padding-left: 0px">${p.product_price }원
								* <input type="number" class="form-control"
								style="text-align: center ; width: 70px ; display: inline-block" value="1">
							</td>
							<td style="width: 5% ; font-size: 30px"><i class="bi bi-x"></i></td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4"><button type="button"
								class="btn btn-dark w-100">구매</button></td>
					</tr>
				</table>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>