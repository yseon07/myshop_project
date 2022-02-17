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
<style>
td {
	vertical-align: middle;
	text-align: center;
}
</style>
<script>
function checkNContent() {
	var t = $("#title").val();
	var c = $("#cont").val();
	
	if(t != null && t.trim() != "" && c != null && c.trim() != "") {
		return true;
	} else {
		alert("제목과 내용을 작성해주세요.");
		return false;
	}
}
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<form action="${pageContext.request.contextPath }/notice/write"
					method="post" onSubmit="return checkNContent()">
					<table class="table">
						<tr>
							<td class="border-0">제목</td>
							<td class="border-0"><input type="text" id="title" name="notice_title" class="form-control" placeholder="공지 제목"></td>
						</tr>
						<tr>
							<td class="border-0">내용</td>
							<td class="border-0"><textarea id="cont" name="notice_content" class="form-control" rows="10" cols="30" placeholder="공지 내용을 입력해주세요."></textarea></td>
						</tr>
						<tr>
							<td class="border-0" colspan="2" style="text-align: right"><button
									type="submit" class="btn btn-dark">작성</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</body>
</html>