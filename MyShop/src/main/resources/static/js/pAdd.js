$(function() {
	$.ajax({
		url: '/category/list',
		type: 'get',
		data: {
			check: 'cate1'
		},
		success: function(data) {
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
			url: '/category/cate',
			type: 'get',
			data: {
				cate_num: c1
			},
			success: function(data) {
				var html2 = "";
				for (i = 0; i < data.length; i++) {
					html2 += "<option value='" + data[i].cate_num + "'>"
						+ data[i].cate_name
						+ "</option>";
				}
				$("#cate2").empty();
				$("#cate2").append("<option>--선택--</option>");
				$("#cate2").append(html2);
			}
		});
	});

	$("#fileUpload").on("change", function() {
		if ($("#fileUpload")[0].files.length > 5) {
			alert("파일은 최대 5개까지만 올릴 수 있습니다.");
			$("#productBtn").attr('disabled', true);
		} else {
			$("#productBtn").attr('disabled', false);
		}
	});

	$("#pForm").submit(function() {		
		if ($("#product_price").val() < 0) {
			alert("가격을 제대로 입력해주세요.");
			$("#product_price").val("");
			$("#product_price").focus();
			return false;
		} else if ($("#product_quantity").val() < 0) {
			alert("재고 값을 제대로 입력해주세요.");
			$("#product_quantity").val("");
			$("#product_quantity").focus();
			return false;
		} else if($("#cate2 option").index($("#cate2 option:selected")) <= 0) {
			alert("카테고리를 선택해주세요.");
			return false;
		}
	});
});