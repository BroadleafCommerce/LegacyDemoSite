/* Operations that deal with checkout */
$(function(){

    $('body').on('click', 'input#shippingMethod_602', function() {
        console.log('validate!');
        $("#shipping_address").validate();
    });

});
