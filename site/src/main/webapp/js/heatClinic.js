/* The Heat Clinic global module. This contains variables and functions
 * used by various other areas of the site */
var HC = (function($) {
	function showNotification(notification) {
		$('#notification_bar').html(notification).slideToggle('slow').delay('3500').slideToggle('slow');
	}
	
	return {
		showNotification : showNotification
	}
})($);