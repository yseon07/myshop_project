<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productView</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row" style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="col-2"></div>
		<div class="col-8">
			<div id="p1" class="row">
				<div id="imgP" class="col-6">
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
				</div>
				<div id="productInfo" class="col-6"></div>
			</div>

		</div>
		<div class="col-2"></div>
	</div>
</body>
</html>