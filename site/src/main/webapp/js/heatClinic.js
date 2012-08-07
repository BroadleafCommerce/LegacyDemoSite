/* The Heat Clinic global module. This contains variables and functions
 * used by various other areas of the site */
var HC = (function($) {
	
	function updateCurrentImage() {
		//grab the active product option values
		var activeOptions = $('.product-options .active');
		var optionValues = [];
		$.each(activeOptions, function() {
			optionValues.push($(this).attr('data-product-option'));
		});
		
		var mediaItems = $('#product_thumbs a');
		var finalMedia;
		var finalMediaMatches = 0;
		$.each(mediaItems, function() {
			var candidateMedia = this;
			var candidateMediaMatches = 0;
			$.each(optionValues, function() {
				if ($(candidateMedia).attr('data-tags') != undefined && $(candidateMedia).attr('data-tags').toLowerCase().indexOf(this.toLowerCase()) !== -1) {
					candidateMediaMatches++;
				}
			});
			if (candidateMediaMatches > finalMediaMatches) {
				finalMedia = candidateMedia;
				finalMediaMatches = candidateMediaMatches;
			}
		});
		
		//at this point I should have the best-matched media item; select it
		if (finalMedia != null) {
			finalMedia.click();
		}
	}
	
	function showNotification(notification, delay) {
		if (!delay) {
			delay = '3500';
		}
		$('#notification_bar').html(notification).slideToggle('slow').delay(delay).slideToggle('slow');
	}
	
	function changeProductOption($option) {
	    if (!$option.is('.active')) {
	        $option.siblings('.active').removeClass('active');
	        $option.toggleClass('active');
	        var selectedOption = $option.data('product-option');
	        var $optionText = $option.parents('.product-option-group').find('span.option-value');
	        $optionText.text(selectedOption);
	        updateCurrentImage();
	    }
	}
	
	return {
		showNotification : showNotification,
		changeProductOption : changeProductOption
	}
})($);