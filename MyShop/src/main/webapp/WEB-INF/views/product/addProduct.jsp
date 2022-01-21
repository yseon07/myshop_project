<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/pAdd.js"></script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv" style="padding: 0 5% 0 5%; margin-top: 5%">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form id="pForm"
					action="${pageContext.request.contextPath }/product/add"
					method="post" enctype="multipart/form-data"
					onsubmit="return fileCheck()">
					<table class="table">
						<tr>
							<td class="align-middle">제목</td>
							<td><input type="text" name="product_title"
								placeholder="25글자 이내" required class="form-control"></td>
						</tr>
						<tr>
							<td class="align-middle">가격</td>
							<td><input type="number" id="product_price"
								name="product_price" required class="form-control"></td>
						</tr>
						<tr>
							<td class="align-middle">재고</td>
							<td><input type="number" id="product_quantity"
								name="product_quantity" required class="form-control"></td>
						</tr>
						<tr>
							<td class="align-middle">내용</td>
							<td><textarea name="product_content" rows="10" required
									class="form-control" placeholder="1000자 이내"></textarea></td>
						</tr>
						<tr>
							<!-- 최대 5개? -->
							<td colspan="2" class="align-middle">이미지 <span
								style="font-size: 10px; color: gray;">(※첨부파일은 최대 5개까지 등록이
									가능합니다.)</span><br> <input type="file" multiple="multiple"
								id="fileUpload" name="file"></td>
						</tr>
						<tr>
							<td><select id="cate1" class="form-select" name="cate1_num">
							</select></td>
							<td><select id="cate2" class="form-select" name="cate2_num">
									<option>--선택--</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="2" class="border-bottom-0" style="text-align: right"><button
									type="submit" id="productBtn" class="btn btn-dark">등록</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>