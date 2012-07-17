/* Operations that deal with checkout */
$(function(){
	// The options used for the login/register fancybox modal
	var fancyCheckoutOptions = {
		maxWidth	: 720,
		maxHeight	: 560,	
		fitToView	: true,
		width		: '100%',
		autoSize	: true,
		closeClick	: false,
		topRatio	: 0,
		openEffect	: 'none',
		closeEffect	: 'none',
		type        : 'ajax',
		scrolling   : 'no'
	};

    function copyShippingForm() {
        $('.cloneable').each(function() {
            $("#billing_info input[name='" + $(this).attr('name') + "']").val($(this).val());
            $("#billing_info select[name='" + $(this).attr('name') + "']").val($(this).val());
        })
    }

    $('body').on('click', 'input#paymentMethod_cc, input#paymentMethod_paypal', function() {
        $('#paymentOptions dd').css({display:"none"});
        $(this).closest('dt').next().css({display:"block"});
    });

    $('body').on('click', 'input#use_shipping_address', function() {
        if ($(this).is(':checked')) {
            copyShippingForm();
        } else {
            $(this).closest('form').find(".clearable").val("");
        }
    });

    $('body').on('click', 'a#multiship', function() {
		$.fancybox.open($.extend(fancyCheckoutOptions, { href : $(this).attr('href') }));
		return false;
    });
    
    $('body').on('click', '#multiship-products a.cancel', function() {
		$.fancybox.close();
		return false;
    });
    
    /*
    $('body').on('click', '#multiship-products input.save', function() {
		var $form = $(this).closest('form');
		
		BLC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data) {
				var extraData = BLC.getExtraData($(data));
				$('.fancybox-inner').html(data);
			}
		);
		return false;
    });
    */
    
    $('body').on('click', 'a.add-address-link', function() {
		BLC.ajax({url: $(this).attr('href')}, function(data) {
			$('#multiship-products').hide();
			$('.fancybox-inner').append(data);
		});
		return false;
    });
    
    $('body').on('click', '#multiship-add-address a.cancel', function() {
		$('#multiship-products').show();
		$('#multiship-add-address').remove();
		return false;
    });
    
	// Intercept save operations and perform them via AJAX instead
	$('body').on('click', '#multiship-add-address input.save', function() {
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
