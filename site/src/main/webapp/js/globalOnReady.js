/* Events to trigger on every page load */
$(function(){
	// Show the JavaScript version of product options if the user has JavaScript enabled
	$('#product-options').removeClass('hidden');
	$('.product-option-nonjs').remove();
	
	// The options used for the login/register fancybox modal
	var fancyAccountOptions = {
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
	};
	
	// Bind all links with class .account to open the login/register fancybox modal
	$('body').on('click', 'a.account', function() {
		$.fancybox.open($.extend(fancyAccountOptions, { href : $(this).attr('href') }));
		return false;
	});
	
	// Bind the JavaScript product option boxes to execute on click
	$('body').on('click', '.product-option-group li:not(.unavailable)', function() {
        HC.changeProductOption($(this));
        return false;
    });
});