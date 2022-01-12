<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<c:import url="../head.jsp"></c:import>
<script>
	$(document).ready(function() {
		$.ajax({
			url : '/category/list',
			type : 'get',
			data : {
				check : 'cate1'
			},
			success : function(data) {
				var html = "";
				for (i = 0; i < data.length; i++) {
					html += "<option value='" + data[i].cate_num + "'>"
							+ data[i].cate_name
							+ "</option>";
				}
	
				$("#cate1").append(html);
				$("#cate1 option:eq(0)").attr(
						"selected", "selected");
				$("#cate1").change();
			}
		});

		$("#cate1").change(function() {
			var c1 = $("#cate1").val();

			$.ajax({
				url : '/category/cate',
				type : 'get',
				data : {
					cate_num : c1
				},
				success : function(data) {
					var html = "";
					for (i = 0; i < data.length; i++) {
						html += "<option value='" + data[i].cate_num + "'>"
								+ data[i].cate_name
								+ "</option>";
					}
					$("#cate2").empty();
					$("#cate2").append("<option>--선택--</option>");
					$("#cate2").append(
							html);
				}
			});
		});
		
		$("button").click(function() {
			var name = $(this).attr("id");
			var ch = "";
			var cn = "";
			var tn = 0;
			if(name == 'addBtn1') {
				ch = "cate1";
				cn = $("#cate_name1").val();
			} else {
				ch = "cate2";
				cn = $("#cate_name2").val();
				tn = $("#cate1 option:selected").val();
			}
			
			$.ajax({
				url : '/category/add',
				type : 'post',
				data : {
					check : ch,
					cate_name: cn,
					top_cate_num: tn
				},
				success : function(data) {
					var html = "";
					for (i = 0; i < data.length; i++) {
						html += "<option value='" + data[i].cate_num + "'>"
								+ data[i].cate_name
								+ "</option>";
					}
		
					if(name == "addBtn1") {
						$("#cate1").empty();
						$("#cate1").append(html);
						$("#cate1 option:eq(0)").attr(
								"selected", "selected");
						$("#cate1").change();
					} else {
						$("#cate2").empty();
						$("#cate2").append("<option>--선택--</option>");
						$("#cate2").append(html);
					}
					
					$("#cate_name1").val("");
					$("#cate_name2").val("");
				}
			});
		})
	});
</script>
</head>
<body>
	<c:import url="../header.jsp" />
	<div class="mainDiv row align-items-center"
		style="padding: 0 5% 0 5%; margin-top: 10%">
		<div class="col-3"></div>
		<div class="col-6">
			<table class="table table-borderless text-center">
				<tr>
					<td>상위 <select id="cate1">
					</select></td>
					<td>하위 <select id="cate2">
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
</body>
</html>