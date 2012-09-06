$(document).ready(function() {

    //highlight active section in left nav
    $('.module > li > a').each(function() {

        var href = $(this).attr('href');
        var hash = href.substring(href.indexOf('#'));
        var currentHash = decodeURI(location.hash);

        if (hash == currentHash) {
            $(this).addClass('active');
        }
    });
	
});