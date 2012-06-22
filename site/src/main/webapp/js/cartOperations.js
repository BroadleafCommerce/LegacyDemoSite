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
	
	var fancyProductOptionsOptions = {
		maxWidth    : 180,
		fitToView	: false,
		width		: '100%',
		height		: '100%',
		autoSize	: true,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none',
			
	};
	
	// This will change the header "X item(s)" text to the new count and pluralization of "item"
	function updateHeaderCartItemsCount(newCount) {
		$('#headerCartItemsCount').html(newCount);
		$('#headerCartItemsCountWord').html((newCount == 1) ? ' item' : ' items');
	}
	
	function updateWithPromo(promo) {
		$('#headerCartItemCount').html();
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
		$.fancybox.open($.extend({ href : $(this).attr('href') }, fancyCartOptions));
		return false;
	});
	
	// Intercept add to cart operations and perform them via AJAX instead
	// This will trigger on any input with class "addToCart"
	$('body').on('click', 'input.addToCart', function() {
		var $button = $(this),
			$form = $button.closest('form'),
			$options = $('span.option-value'),
			$errorSpan = $button.closest('.product-options').children('span.error'),
			itemRequest = BLC.serializeObject($form),
			modalClick = $button.parents('.fancybox-inner').length > 0;
			
		if ($errorSpan.length == 0) {
			$errorSpan = $('.product-options').children('span.error');
		}
		
		if (itemRequest.hasProductOptions == "true" && !modalClick) {
			$.fancybox.open($.extend({ href : '#productOptions' + itemRequest.productId}, fancyProductOptionsOptions));
		} else {
			$options.each(function(index, element) {
				itemRequest['itemAttributes[' + $(element).attr('id') + ']'] = $(element).text();
			});
			
			BLC.ajax({url: $form.attr('action'), 
					type: "POST",
					dataType: "json",
					data: itemRequest
				}, function(data) {
					if (data.error) {
						$errorSpan.css('display', 'block');
				        $errorSpan.effect('highlight', {}, 1000);
					} else {
						$errorSpan.css('display', 'none');
						updateHeaderCartItemsCount(data.cartItemCount);
						
						if (modalClick) {
							$.fancybox.close();
						} else {
							showInCartButton(data.productId);
						}
						
						HC.showNotification(data.productName + "  has been added to the cart!");
					}
				}
			);
		}
		return false;
	});
	
	// Intercept update quantity operations and perform them via AJAX instead
	// This will trigger on any input with class "updateQuantity"
	$('body').on('click', 'input.updateQuantity', function() {
		var $form = $(this).closest('form');
		
		BLC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data) {
				var extraData = BLC.getExtraData($(data));
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
		
		BLC.ajax({url: $(link).attr('href'),
				type: "GET"
			}, function(data) {
				var extraData = BLC.getExtraData($(data));
				updateHeaderCartItemsCount(extraData.cartItemCount);
				showAddToCartButton(extraData.productId);
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
	
	$('body').on('click', 'input.cart_button', function() {
		var $form = $(this).closest('form');
		
		BLC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data) {
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
	
	
	
});