$(function(){
	$('.add_to_cart a').click(function(){
		var link = this;
		$.ajax(this.href, {
			statusCode: {
				200: function(data) {
					$(link).html('In Cart').attr('href', $('#cartLink').attr('href')).parent().removeClass('add_to_cart').addClass('in_cart');
					$('#notification_bar').html("The item has been added to the cart!").slideToggle('slow').delay('3500').slideToggle('slow');
			    }, 
			    500: function() {
					$('#notification_bar').html("Error adding :( Please try again").slideToggle('slow').delay('3500').slideToggle('slow');
			    }
			  }
		});
		return false;
	});
});

$(".fancycart").fancybox({
	maxWidth	: 940,
	maxHeight	: 570,
	fitToView	: false,
	width		: '100%',
	height		: '100%',
	autoSize	: true,
	closeClick	: false,
	topRatio	: 0,
	openEffect	: 'none',
	closeEffect	: 'none'
});

$(".account").fancybox({
	maxWidth	: 700,
	maxHeight	: 420,
	fitToView	: false,
	width		: '100%',
	height		: '100%',
	autoSize	: false,
	closeClick	: false,
	topRatio	: 0,
	openEffect	: 'none',
	closeEffect	: 'none'
});


