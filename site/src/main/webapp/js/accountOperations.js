/* Operations that deal with the customer's account */
$(function(){
	// The options used for the login/register fancybox modal
	var fancyAccountOptions = {
		maxWidth	: 700,
		maxHeight	: 560,	
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
	$('#header_content').on('click', 'a.account', function() {
		$.fancybox.open($.extend(fancyAccountOptions, { href : $(this).attr('href'), afterShow: function() {
			$('.fancybox-inner').find('form:first').find('input:first').focus();
			return true;
		}}));
		return false;
	});
	
	// Account links that are clicked within the modal replace the contents of the modal
	$('body').on('click','.fancybox-inner a.account',  function() {		
		BLC.ajax({url: $(this).attr('href'),
				type: "GET"
			}, function(responseData) {
				$('.fancybox-inner').html(responseData);			
			}
		);
		return false;
	});	
	
	// All form actions (register, login, reset password) will be submitted via AJAX
	$('body').on('click','.fancybox-inner input.register_button,.fancybox-inner input.login_button,.fancybox-inner input.reset_password_button', function() {
		var $form = $(this).closest("form");
		BLC.ajax({url: $form.attr('action'), 
				type: "POST",
				data: $form.serialize()
			}, function(responseData) {
				$('.fancybox-inner').html(responseData);
			}
		);
		return false;
	});		
});