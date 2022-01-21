<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<c:import url="../head.jsp"></c:import>
<script src="/resources/js/cMain.js"></script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<table class="table table-borderless text-center">
					<tr>
						<td>상위 카테고리 <select id="cate1" class="form-select">
						</select></td>
						<td>하위 카테고리 <select id="cate2" class="form-select">
								<option>--선택--</option>
						</select></td>
					</tr>
				</table>
				<table class="table table-borderless text-center">
					<tr>
						<td><input type="text" id="cate_name1" class="form-control"
							placeholder="상위 카테고리"></td>
						<td>
							<button type="button" id="addBtn1" class="btn btn-outline-dark">추가</button>
						</td>
					</tr>
					<tr>
						<td><input type="text" id="cate_name2" class="form-control"
							placeholder="하위 카테고리(상위 select를 선택)"></td>
						<td>
							<button type="button" id="addBtn2" class="btn btn-outline-dark">추가</button>
						</td>
					</tr>
				</table>

			</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>