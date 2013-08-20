/**
 * Operations that deal with account credit .
 *
 * @author Jerry Ocanas (jocanas)
 */

$(function(){

    /* Apply pressed on apply credit */
    $('body').on('click', '#credit_section input.apply', function() {
        var $form = $(this).closest('form');

        BLC.ajax({url: $form.attr('action'),
                type: "POST",
                data: $form.serialize(),
                cache: false
            }, function(data) {
                $('#credit_area').html(data);
            }
        );
        return false;
    });

});