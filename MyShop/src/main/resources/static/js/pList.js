$(function() {
		$(".likeList").hide();

		$("div[id*='img']").click(function() {
			var cNum = $(this).attr("class");
			location.href="product/" + cNum;
		});
		
		$("div[id*='img']").mouseover(function() {
			$(this).find(".likeList").show();
		});
		$("div[id*='img']").mouseout(function() {
			$(this).find(".likeList").hide();
		});

		$(".circle").click(function() {
			if ($(this).attr("id") == "cBtn") {
				$(this).children("i").removeClass("bi-cart-plus");
				$(this).children("i").addClass("bi-cart-plus-fill");
			} else {
				$(this).children("i").removeClass("bi-heart");
				$(this).children("i").addClass("bi-heart-fill");
			}
			 event.stopPropagation();
		});
	});