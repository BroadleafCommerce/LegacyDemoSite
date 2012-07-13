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

    $('body').on('click', 'input#paymentMethod_cc, input#paymentMethod_paypal', function() {
        $('#paymentOptions dd').css({display:"none"});
        $(this).closest('dt').next().css({display:"block"});
    });

    $('body').on('click', 'input#shippingMethod_602', function() {
        console.log('validate!');
        $("#shipping_address").validate();
    });

    $('body').on('click', 'a#multiship', function() {
		$.fancybox.open($.extend(fancyAccountOptions, { href : $(this).attr('href') }));
		return false;
    });
    
    $('body').on('click', 'a.add-address-link', function() {
		BLC.ajax({url: $(this).attr('href')}, function(data) {
			$('#multiship-products').hide();
			$('.fancybox-inner').append(data);
		});
		return false;
    });
    
	// Intercept save operations and perform them via AJAX instead
	$('body').on('click', 'input.saveAddress', function() {
		var $form = $(this).closest('form');
		
		BLC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data) {
				var extraData = BLC.getExtraData($(data));
				//updateHeaderCartItemsCount(extraData.cartItemCount);
				//if ($form.children('input.quantityInput').val() == 0) {
					//showAddToCartButton(extraData.productId);
				//}
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
});
