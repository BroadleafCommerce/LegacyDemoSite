/* Events to trigger on every page load */
$(function(){
	// Show the JavaScript version of product options if the user has JavaScript enabled
	$('.product-options').removeClass('hidden');
	$('.product-option-nonjs').remove();

    // Bind the JavaScript product option boxes to execute on click
	$('body').on('click', '.product-option-group li:not(.unavailable)', function() {
        HC.changeProductOption($(this));
        return false;
    });

	if (Modernizr.touch) {
		$('.jqzoom').jqzoom({zoomType: 'reverse', title: false, lens: false, imageOpacity: 1});
	} else {
		$('.jqzoom').jqzoom({zoomType: 'innerzoom', title: false});
	}
	
	
	// Trim all product descriptions in the small layout
	$('.product_container .content').dotdotdot();

});
