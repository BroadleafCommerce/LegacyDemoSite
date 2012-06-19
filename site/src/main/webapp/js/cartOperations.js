$(function(){
	// Set up basic options for the cart fancybox
	var fancyCartOptions = {
		maxWidth	: 940,
		maxHeight	: 570,
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
	
	// This will change the header "X item(s)" text to the new count and pluralization of "item"
	function updateHeaderCartItemsCount(newCount) {
		$('#headerCartItemsCount').html(newCount);
		$('#headerCartItemsCountWord').html((newCount == 1) ? ' item' : ' items');
	}
	
	// Hides the add to cart button and shows the in cart button
	function showInCartButton(productId) {
		$('.productActions' + productId).children('.in_cart').removeClass('hidden');
		$('.productActions' + productId).children('.add_to_cart').addClass('hidden');
	}
	
	// Hides the in cart button and shows the add to cart button
	function showAddToCartButton(productId) {
		$('.productActions' + productId).children('.add_to_cart').removeClass('hidden');
		$('.productActions' + productId).children('.in_cart').addClass('hidden');
	}
	
	// Show the cart in a modal when any link with the class "fancycart" is clicked
	$('body').on('click', 'a.fancycart', function() {
		$.fancybox.open($.extend(fancyCartOptions, { href : $(this).attr('href') }));
		return false;
	});
	
	// Intercept add to cart operations and perform them via AJAX instead
	// This will trigger on any input with class "addToCart"
	$('body').on('click', 'input.addToCart', function() {
		var $form = $(this).closest('form');
		$.ajax($form.attr('action'), {
			type: "POST",
			data: $form.serialize(),
			statusCode: {
				200: function(data) {
					updateHeaderCartItemsCount(data.cartItemCount);
					showInCartButton(data.productId);
					HC.showNotification(data.productName + "  has been added to the cart!");
			    }, 
			    500: function() {
			    	// If there is an error adding to cart for any reason, the server will return
			    	// a 500 INTERNAL SERVER ERROR response code
					HC.showNotification("Error adding :(");
			    }
			}
		});
		return false;
	});
	
	// Intercept update quantity operations and perform them via AJAX instead
	// This will trigger on any input with class "updateQuantity"
	$('body').on('click', 'input.updateQuantity', function() {
		var $form = $(this).closest('form');
		$.ajax($form.attr('action'), {
			type: "POST",
			data: $form.serialize(),
			statusCode: {
				200: function(data) {
					updateHeaderCartItemsCount(data.cartItemCount);
					
					if ($form.children('input.quantityInput').val() == 0) {
						showAddToCartButton(data.productId);
					}
					
					// Update the cart to show its new state
					$.get($('#cartLink').attr('href'), function(cartData) {
						$('.fancybox-inner').html(cartData);
					});
			    }, 
			    500: function() {
			    	// If there is an error adding to cart for any reason, the server will return
			    	// a 500 INTERNAL SERVER ERROR response code
					HC.showNotification("Error changing quantity :(");
			    }
			}
		});
		return false;
	});
	
	// Intercept remove from cart operations and perform them via AJAX instead
	// This will trigger on any link with class "remove_from_cart"
	$('body').on('click', 'a.remove_from_cart', function() {
		var link = this;
		$.ajax($(link).attr('href'), {
			statusCode: {
				200: function(data) {
					updateHeaderCartItemsCount(data.cartItemCount);
					showAddToCartButton(data.productId);
					
					// Update the cart to show its new state
					$.get($('#cartLink').attr('href'), function(cartData) {
						$('.fancybox-inner').html(cartData);
					});
			    }, 
			    500: function() {
			    	$('.fancybox-inner').html('Error removing :(');
			    }
			  }
		});
		return false;
	});
});