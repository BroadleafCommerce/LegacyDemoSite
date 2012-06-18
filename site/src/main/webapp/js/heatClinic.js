/* The Heat Clinic global module. This contains variables and functions
 * used by various other areas of the site */
var HC = (function($) {
	
	function adjustPrice($option) {
	    var adjustments = 0;
	    $('.product-option-group li.active').each(function() {
	        var adjustment = $(this).data('price-adjustment');
	        if (adjustment) {
	            adjustments += adjustment;
	        }
	    });
	    var $price = $('#price');
	    var basePrice = $price.data('base-price');
	    var currentPrice = $price.data('current-price');
	    var newPrice = basePrice + adjustments;
	    $price.text('$' + newPrice);
	    if (newPrice != currentPrice) {
	        $price.effect('highlight', {}, 1000);
	        $price.data('current-price', newPrice);
	    }
	}
	
	function showNotification(notification) {
		$('#notification_bar').html(notification).slideToggle('slow').delay('3500').slideToggle('slow');
	}
	
	function changeProductOption($option) {
	    if (!$option.is('.active')) {
	        $option.siblings('.active').removeClass('active');
	        $option.toggleClass('active');
	        var selectedOption = $option.data('product-option');
	        var $optionText = $option.parents('.product-option-group').find('h3.option-name span');
	        $optionText.text(selectedOption);
	        //adjustPrice($option);
	    }
	}
	
	return {
		showNotification : showNotification,
		changeProductOption : changeProductOption
	}
})($);