$(document).ready(function() {

    //by default, turn off module-level linking, but enable module collapsing
    $('.module-header').on('click', function() {
        $(this).next().collapse('toggle');
        return false;
    });

    $('.collapse').on('hidden', function () {
        $(this).prev().children('.collapse-icon').removeClass('icon-chevron-up').addClass('icon-chevron-down');
    });

    $('.collapse').on('shown', function () {
        $(this).prev().children('.collapse-icon').removeClass('icon-chevron-down').addClass('icon-chevron-up');
    });

});