function checkNum() {
	if ((event.keyCode < 48) || (event.keyCode > 57)) {
		event.returnValue = false;
	}
}

$(function() {
	$(".quan").change(
		function() {
			if ($(this).val() < 1) {
				alert("최소 1개 이상 구매 가능합니다.")
				$(this).val(1);
			} else {
				var f = $(this).attr("id");
				var q = $(this).val();
				var sum = Number($("#priceText" + f).attr("data-defaultPrice") * q);
				$("#priceText" + f).text(sum);
				$.ajax({
					url: "/order/count",
					method: "post",
					data: { index: f, price: sum, quantity: q },
					success: function(data) {

					}
				});
			}
		});
});