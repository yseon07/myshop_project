<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
	$(document).ready(function() {
		$("#fileUpload").on("change", function() {
			if ($("#fileUpload")[0].files.length > 5) {
				alert("파일은 최대 5개까지만 올릴 수 있습니다.");
				$("#productBtn").attr('disabled', true);
			} else {
				$("#productBtn").attr('disabled', false);
			}
		});
	});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row" style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="col-3"></div>
		<div class="col-6">
			<form action="${pageContext.request.contextPath }/product/add"
				method="post" enctype="multipart/form-data"
				onsubmit="return fileCheck()">
				<table class="table">
					<tr>
						<td class="align-middle">제목</td>
						<td><input type="text" id="product_title" required
							class="form-control"></td>
					</tr>
					<tr>
						<td class="align-middle">가격</td>
						<td><input type="number" id="product_price" required
							class="form-control"></td>
					</tr>
					<tr>
						<td class="align-middle">재고</td>
						<td><input type="number" id="product_quantity" required
							class="form-control"></td>
					</tr>
					<tr>
						<td class="align-middle">내용</td>
						<td><textarea id="product_content" rows="10" required
								class="form-control" placeholder="1000자 이내"></textarea></td>
					</tr>
					<tr>
						<!-- 최대 5개? -->
						<td colspan="2" class="align-middle">이미지 <span style="font-size: 10px; color: gray;">(※첨부파일은
								최대 5개까지 등록이 가능합니다.)</span><br>
						<input type="file" multiple="multiple" id="fileUpload" name="files"></td>
					</tr>
					<tr>
						<td colspan="2" class="border-bottom-0"><button type="submit" id="productBtn"
								class="btn btn-dark">등록</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
</body>
</html>