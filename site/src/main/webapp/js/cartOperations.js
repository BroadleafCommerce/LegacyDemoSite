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
		/*
		var $options = $('span.option-value');
		$options.each(function(index, element) {
			alert($(element).val());
		});
		return false;
		*/
		HC.ajax({url: $form.attr('action'), 
				type: "POST",
				dataType: "json",
				data: $form.serialize()
			}, function(data) {
				updateHeaderCartItemsCount(data.cartItemCount);
				showInCartButton(data.productId);
				HC.showNotification(data.productName + "  has been added to the cart!");
			}
		);
		return false;
	});
	
	// Intercept update quantity operations and perform them via AJAX instead
	// This will trigger on any input with class "updateQuantity"
	$('body').on('click', 'input.updateQuantity', function() {
		var $form = $(this).closest('form');
		
		HC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data) {
				var extraData = HC.getExtraData($(data));
				updateHeaderCartItemsCount(extraData.cartItemCount);
				
				if ($form.children('input.quantityInput').val() == 0) {
					showAddToCartButton(extraData.productId);
				}
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
	
	// Intercept remove from cart operations and perform them via AJAX instead
	// This will trigger on any link with class "remove_from_cart"
	$('body').on('click', 'a.remove_from_cart', function() {
		var link = this;
		
		HC.ajax({url: $(link).attr('href'),
				type: "GET",
			}, function(data) {
				var extraData = HC.getExtraData($(data));
				updateHeaderCartItemsCount(extraData.cartItemCount);
				showAddToCartButton(extraData.productId);
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
});