$(function(){
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
	
	function updateHeaderCartItemsCount(newCount) {
		$('#headerCartItemsCount').html(newCount);
		$('#headerCartItemsCountWord').html((newCount == 1) ? ' item' : ' items');
	}
	
	function showInCartButton(productId) {
		$('#productActions' + productId).children('.in_cart').removeClass('hidden');
		$('#productActions' + productId).children('.add_to_cart').addClass('hidden');
	}
	
	function showAddToCartButton(productId) {
		$('#productActions' + productId).children('.add_to_cart').removeClass('hidden');
		$('#productActions' + productId).children('.in_cart').addClass('hidden');
	}
	
	function showNotification(notification) {
		$('#notification_bar').html(notification).slideToggle('slow').delay('3500').slideToggle('slow');
	}
	
	$('body').delegate('a.fancycart', 'click', function() {
		$.fancybox.open($.extend(fancyCartOptions, { href : $(this).attr('href') }));
		return false;
	});
	
	$('body').delegate('.add_to_cart a', 'click', function() {
		var link = this;
		$.ajax(this.href, {
			statusCode: {
				200: function(data) {
					updateHeaderCartItemsCount(data.cartItemCount);
					showInCartButton(data.productId);
					showNotification("The item has been added to the cart!");
			    }, 
			    500: function() {
			    	// If there is an error adding to cart for any reason, the server will return
			    	// a 500 INTERNAL SERVER ERROR response code
					showNotification("Error adding :( Please try again");
			    }
			  }
		});
		return false;
	});
	
	$('body').delegate('a.remove_from_cart', 'click', function() {
		var link = this;
		$.ajax(this.href, {
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
			    	$('.fancybox-inner').html('An error happened :(');
			    }
			  }
		});
		return false;
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
});