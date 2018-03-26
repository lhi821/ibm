$( document ).ready(function() {
    
});

$(function() {

    $('#login-form-link').click(function(e) {
    	
    	$(".card").animate({marginTop: '10%',paddingBottom: '40px',height:'386px'},1000);
		$("#login-form").delay(400).fadeIn(1000);
 		$("#register-form").fadeOut(400);
		$('#register-form-link').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#register-form-link').click(function(e) {
		
		$(".card").animate({marginTop: '5%',paddingBottom: '50px',height:'610px'},1000);
		$("#register-form").delay(400).fadeIn(1000);
 		$("#login-form").fadeOut(400);
		$('#login-form-link').removeClass('active');
		$(this).addClass('active');
		
		e.preventDefault();
	});

});
