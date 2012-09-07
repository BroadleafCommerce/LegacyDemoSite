$(document).ready(function() {

    var $quickSearch = $('#quick-search');
    var $quickSearchButton = $('#quick-search-button');

    //highlight active section in left nav
    $('.module > li > a').each(function() {

        var href = $(this).attr('href');
        var hash = href.substring(href.indexOf('#'));
        var currentHash = decodeURI(location.hash);

        if (hash == currentHash) {
            $(this).addClass('active');
        }
    });

    //bind enter key and search button click for quick search
    $quickSearch.on('keypress', function(event) {
        if (event.which == 13) {
            event.preventDefault();
            search();
        }
    });

    $quickSearchButton.on('click', function(event) {
        event.preventDefault();
        search();
    });
	
});

function updateSearchPlaceholder(section) {
    var newPlaceholderText = 'Search in ' + section;
    $('#quick-search').attr('placeholder', newPlaceholderText);
}

function search(query, section) {

}