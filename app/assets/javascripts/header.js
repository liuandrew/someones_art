$(document).on("ready page:load", function() {
	$('header').on('click', '.compact-nav .menu-icon', function(event){
		$('.compact-nav .navbar').slideToggle();
		event.preventDefault();
	});
});

function helloWorld() {
	alert('Hello World');
}