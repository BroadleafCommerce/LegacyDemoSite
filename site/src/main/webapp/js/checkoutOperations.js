/* Operations that deal with checkout */
$(function(){
	// The options used for the login/register fancybox modal
	var fancyAccountOptions = {
		maxWidth	: 700,
		maxHeight	: 560,	
		fitToView	: false,
		width		: '100%',
		height		: '100%',
		autoSize	: true,
		closeClick	: false,
		topRatio	: 0,
		openEffect	: 'none',
		closeEffect	: 'none',
		type        : 'ajax'
	};

    $('body').on('click', 'input#shippingMethod_602', function() {
        console.log('validate!');
        $("#shipping_address").validate();
    });

    $('body').on('click', 'a#multiship', function() {
		$.fancybox.open($.extend(fancyAccountOptions, { href : $(this).attr('href') }));
		return false;
    });
});
