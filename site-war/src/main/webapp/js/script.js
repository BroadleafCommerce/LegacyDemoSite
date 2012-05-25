/* Author:

*/

$(function(){
	$('a#add_to_cart').click(function(){
	$('#notification_bar').empty().append("The item has been added to the cart!").slideToggle('slow').delay('3500').slideToggle('slow')
	return false;
	});
});


