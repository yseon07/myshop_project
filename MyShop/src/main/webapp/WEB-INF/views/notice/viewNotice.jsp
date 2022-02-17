<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyShop-notice</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<!-- <script src="/resources/js/m.js"></script> -->
<script>
	$(function() {
		$("#nText").height($("#nText").prop('scrollHeight'));
	});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<table class="table">
					<tr style="border-bottom: 3px solid black">
						<td>${n.notice_title }</td>
						<td style="text-align: right"><fmt:formatDate var="day"
								value="${n.write_date}" pattern="yyyy년 MM월 dd일 hh시 MM분" />${day }</td>
					</tr>
					<tr>
						<td colspan="2" class="border-0"><textarea id="nText"
								readonly class="w-100 border-0"
								style="height: 100%; overflow: hidden; resize: none">${n.notice_content }</textarea></td>
					</tr>
				</table>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>