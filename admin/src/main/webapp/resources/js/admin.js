$(document).ready(function() {

    var $quickSearch = $('#quick-search');
    var $quickSearchButton = $('#quick-search-button');

    //highlight active section in left nav
    $('.module > li > a').each(function(event) {

        var href = $(this).attr('href');
        var hash = href.substring(href.indexOf('#'));
        var currentHash = decodeURI(location.hash);

        if (hash == currentHash) {
            $(this).addClass('active');
        }

    });

    //by default, turn off module-level linking, but enable module collapsing
    $('#modules > ul.nav > li.nav-header > a').on('click', function() {
        var $module = $($(this).data('target'));
        $module.collapse('toggle');
        return false;
    });

    //by default, turn off linking for the currently active section
    $('#content-management, #catalog-merchandising, #customer-care, #user-administration').find('a.active').on('click', function() {
        return false;
    });

});