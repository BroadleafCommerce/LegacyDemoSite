/* Events to trigger on every page load */
$(function(){
	// Show the JavaScript version of product options if the user has JavaScript enabled
	$('#product-options').removeClass('hidden');
	$('.product-option-nonjs').remove();

	// The options used for the login/register fancybox modal
	var fancyAccountOptions = {
		maxWidth	: 700,
		maxHeight	: 520,	
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
	
	// Bind all links with class .account to open the login/register fancybox modal
	$('body').on('click', '#header_content a.account', function() {
		$.fancybox.open($.extend(fancyAccountOptions, { href : $(this).attr('href') }));
		return false;
	});
	
	// Account links that are clicked within the modal replace the contents of the modal
	$('body').on('click','.fancybox-inner a.account',  function() {		
		$.get($(this).attr('href'), function(accountData) {	
			$('.fancybox-inner').html(accountData);			
		});
		return false;
	});	
	
	// Clicking register from within the registration modal will post the form.
	$('body').on('click','.fancybox-inner input.register_button,.fancybox-inner input.login_button,.fancybox-inner input.reset_password_button', function() {
		var $form = $(this).closest("form");
		$.post($form.attr("action"), $form.serialize(), function(responseData) {
	      if (!HC.redirectIfNecessary($(responseData))) {
	          $('.fancybox-inner').html(responseData);
	      }
		});
		return false;
	});		

    // Bind the JavaScript product option boxes to execute on click
	$('body').on('click', '.product-option-group li:not(.unavailable)', function() {
        HC.changeProductOption($(this));
        return false;
    });

});
