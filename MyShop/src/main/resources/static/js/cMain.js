$(document).ready(function() {
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
		if (name == 'addBtn1') {
			ch = "cate1";
			cn = $("#cate_name1").val();
		} else {
			ch = "cate2";
			cn = $("#cate_name2").val();
			tn = $("#cate1 option:selected").val();
		}

		$.ajax({
			url: '/category/add',
			type: 'post',
			data: {
				check: ch,
				cate_name: cn,
				top_cate_num: tn
			},
			success: function(data) {
				var html = "";
				for (i = 0; i < data.length; i++) {
					html += "<option value='" + data[i].cate_num + "'>"
						+ data[i].cate_name
						+ "</option>";
				}

				if (name == "addBtn1") {
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