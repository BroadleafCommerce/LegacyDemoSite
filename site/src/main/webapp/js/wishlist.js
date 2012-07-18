$(function(){
	var fancyProductOptionsOptions = {
		maxWidth    : 180,
		fitToView	: false,
		width		: '100%',
		height		: '100%',
		autoSize	: true,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	};
	
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
	
	$('body').on('click', 'input#select_all_wishlist_items', function() {
		var $checked = $(this).is(':checked');
		$('#wishlist_items tbody').find(':checkbox').attr('checked', $checked);
	});
	
	// Intercept add to cart operations and perform them via AJAX instead
	// This will trigger on any input with class "addToCart"
	$('body').on('click', 'input.addToWishlist', function() {
		var $button = $(this);
		var $form = $button.closest('form');
		var $options = $('span.option-value');
		var $errorSpan = $button.closest('.product-options').children('span.error');
		var itemRequest = BLC.serializeObject($form);
		var modalClick = $button.parents('.fancybox-inner').length > 0;
		
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
				}, function(data, extraData) {
					if (data.error) {
						$errorSpan.css('display', 'block');
				        $errorSpan.effect('highlight', {}, 1000);
					} else {
						$errorSpan.css('display', 'none'); 

						HC.showNotification(data.productName + "  has been added to your wishlist!");
					}
				}
			);
		}
		return false;
	});
	
	// Intercept update quantity operations and perform them via AJAX instead
	// This will trigger on any input with class "updateQuantityWishlist"
	$('body').on('click', 'input.updateQuantityWishlist', function() {
		var $form = $(this).closest('form');
		
		BLC.ajax({url: $form.attr('action'),
				type: "POST", 
				data: $form.serialize() 
			}, function(data, extraData) {
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});
	
	// Intercept remove from cart operations and perform them via AJAX instead
	// This will trigger on any link with class "remove_from_cart"
	$('body').on('click', 'a.remove_from_wishlist', function() {
		var link = this;
		
		BLC.ajax({url: $(link).attr('href'),
				type: "GET"
			}, function(data, extraData) {
				updateHeaderCartItemsCount(extraData.cartItemCount);
				showAddToCartButton(extraData.productId);
				
				$('.fancybox-inner').html(data);
			}
		);
		return false;
	});

});