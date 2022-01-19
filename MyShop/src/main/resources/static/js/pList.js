$(function() {
	$(".likeList").hide();

	$("div[id*='img']").click(function() {
		var cNum = $(this).attr("class");
		location.href = "product/" + cNum;
	});

	$("div[id*='img']").mouseover(function() {
		$(this).find(".likeList").show();
	});
	$("div[id*='img']").mouseout(function() {
		$(this).find(".likeList").hide();
	});
});