$(document).ready(function() {
	
	// Allow clicking on the entire table row to navigate to the entity record
	$('.listGridContainer tbody').on('click', 'tr', function() {
		window.location = $(this).data('link');
	});
	
    $('body').on('click', 'a.subCollectionListGridAdd', function(event) {
		$.get($(this).attr('href'), function(data) {
			$modal = $(data);
			
			$modal.attr('id', 'andre');
			$('body').append($modal);
			$modal.modal();
			
			$modal.on('hidden', function() {
				$modal.remove();
			});
		});
		return false;
    });
	
	
	
	
	
	
	
	
	var $modal;
	var $textInput;
	var $hiddenInput;
	var displayValProp;
	
    $('body').on('click', 'a.showModalListGrid', function(event) {
    	event.preventDefault();
    	
    	$textInput = $(this).prev();
    	$hiddenInput = $textInput.prev();
    	displayValProp = $hiddenInput.prev().val();
		
		$.get($(this).attr('href'), function(data) {
			$modal = $(data);
			
			$modal.attr('id', 'andre');
			$('body').append($modal);
			$modal.modal();
			
			$modal.on('hidden', function() {
				$modal.remove();
			});
		});
		
		return false;
    });
    
    $('body').on('click', 'div.modal tbody tr', function(event) {
		var entityId = $(this).find('td').filter(function() { 
			return $(this).data('fieldname') == 'id'; 
		}).text();
		
		var displayVal = $(this).find('td').filter(function() { 
			return $(this).data('fieldname') == displayValProp; 
		}).text();
		
		$modal.modal('hide');
		
		$textInput.val(displayVal);
		$hiddenInput.val(entityId);
    });

});

