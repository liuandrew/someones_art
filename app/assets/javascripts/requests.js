$(document).ready(function(){
	$(".request-page-container").on("click", ".down-arrow", function() {
		$(this).parent().parent().find(".up-arrow").children().removeClass("voted");
		$(this).children().toggleClass("voted");
	});
	$(".request-page-container").on("click", ".up-arrow", function() {
		$(this).parent().parent().find(".down-arrow").children().removeClass("voted");
		$(this).children().toggleClass("voted");
	});
});

