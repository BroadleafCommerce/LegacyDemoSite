/* Operations that deal with checkout */
$(function(){
    // The options used for the login/register fancybox modal
    var fancyCheckoutOptions = {
        maxWidth    : 720,
        maxHeight   : 560,  
        fitToView   : false,
        width       : '100%',
        autoSize    : true,
        closeClick  : false,
        topRatio    : 0,
        openEffect  : 'none',
        closeEffect : 'none',
        type        : 'ajax',
        scrolling   : 'no',
        padding     : 5
    };
    
    function copyShippingForm() {
        $('.cloneable').each(function() {
            $("#billing_info input[name='" + $(this).attr('name') + "']").val($(this).val()).attr("disabled", "disabled");
            $("#billing_info select[name='" + $(this).attr('name') + "']").val($(this).val()).attr("disabled", "disabled");
        })
    }
    
    function showAddAddress() {
        var $form = $('form#multiship_address');
        BLC.ajax({url: $form.attr('action'),
                type: "POST", 
                data: $form.serialize() 
            }, function(data, extraData) {
                var showAddAddressUrl = $('a.add-address-link').attr('href');
                BLC.ajax({url: showAddAddressUrl}, function(data, extraData) {
                    $('#multiship-products').hide();
                    $('.fancybox-inner').append(data);
                });
            }
        );
        return false;
    }

    /* Toggle visibility of payment methods */
    $('body').on('click', 'input#paymentMethod_cc', function() {
        $('#paymentOptions dd').css({display:"none"});
        $(this).closest('dt').next().css({display:"block"});
        $('#billing_info_form').css({display:"block"});
    });

    $('body').on('click', 'input#paymentMethod_paypal', function() {
        $('#paymentOptions dd').css({display:"none"});
        $(this).closest('dt').next().css({display:"block"});
        $('#billing_info_form').css({display:"none"});
    });

    /* Copy Shipping Form to Billing Form Checkbox */
    $('body').on('click', 'input#use_shipping_address', function() {
        if ($(this).is(':checked')) {
            copyShippingForm();
        } else {
            $(this).closest('form').find(".clearable").val("").removeAttr("disabled");
        }
    });

    /* Submit Shipping Form when radio button is checked */
    $('body').on('click', '#select_shipping', function() {
        $('#shipping_info').submit();
    });

    /* Show or Edit multiship options link was clicked */
    $('body').on('click', 'a#multiship', function() {
        $.fancybox.open($.extend(fancyCheckoutOptions, { href : $(this).attr('href'), ajax: {cache: false}, afterShow: function() {
        }}));
        return false;
    });
    
    /* Add address from the dropdown was selected */
    $('body').on('change', 'select.multiship-address', function() {
        var $option = $(this).children(':selected');
        if ($option.val() == 'addNewAddress')  {
            showAddAddress();
        }
    });
    
    /* Add address button clicked */
    $('body').on('click', 'a.add-address-link', function() {
        return showAddAddress();
    });
    
    /* Cancel pressed on multiship */
    $('body').on('click', '#multiship-products a.cancel', function() {
        $.fancybox.close();
        return false;
    });
    
    /* Cancel pressed on add address */
    $('body').on('click', '#multiship-add-address a.cancel', function() {
        $('#multiship-products').show();
        $('#multiship-add-address').remove();
        return false;
    });
    
    /* Save pressed on add address */
    $('body').on('click', '#multiship-add-address input.save', function() {
        var $form = $(this).closest('form');
        
        BLC.ajax({url: $form.attr('action'),
                type: "POST", 
                data: $form.serialize(),
                cache: false
            }, function(data, extraData) {
                $('.fancybox-inner').html(data);
            }
        );
        return false;
    });
});
