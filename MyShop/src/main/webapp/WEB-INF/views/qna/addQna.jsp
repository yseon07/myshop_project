<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 질문 남기기</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
	function checkContent() {
		var c = $("#qContent").val();
		if (c != null && c.trim() != "") {
			return true;
		} else {
			alert("질문 내용을 작성해주세요.");
			return false;
		}
	}
</script>
<style>
.sStar {
	cursor: pointer
}

.iStar {
	color: black;
}

.h-div {
	background-color: black;
	color: white
}

.h-div>.row {
	margin: 0;
}

.h-div>.row>div {
	padding: 0
}
</style>
</head>
<body>
	<div class="container-fluid h-div py-1 px-2 mb-3">
		<div class="w-100 align-items-center justify-content-center">
			<div class="h-c2 col-sm-12" style="text-align: center">
				<h4>MyShop</h4>
			</div>
		</div>
	</div>
	<div class="mainDiv" style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8" style="justify-content: center">
				<form action="${pageContext.request.contextPath }/qna/add"
					method="post" onSubmit="return checkContent()">
					<table class="align-items-center w-100"
						style="border-collapse: separate; border-spacing: 0 15px">
						<tr>
							<td style="width: 20%; text-align: center">${sessionScope.nick }님의<br>질문
								내용
							</td>
							<td><textarea class="form-control" id="qContent"
									name="content" style="resize: none" cols="40" rows="5"></textarea></td>
						</tr>
						<tr style="text-align: right">
							<td class="my-2" colspan="2"><button type="submit"
									class="btn btn-dark">질문 등록</button></td>
						</tr>
					</table>
					<input type="hidden" name="p_num" value="${p_num }"> <input
						type="hidden" name="qna_type" value="0"> <input
						type="hidden" name="mem_id" value="${sessionScope.id }">
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
</body>
</html>