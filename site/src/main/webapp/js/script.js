$(function(){
	$('a#add_to_cart').click(function(){
	$('#notification_bar').empty().append("The item has been added to the cart!").slideToggle('slow').delay('3500').slideToggle('slow')
	return false;
	});
});

$(".various").fancybox({
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


