/* The Heat Clinic global module. This contains variables and functions
 * used by various other areas of the site */
var HC = (function($) {
    
    function showFacetMultiselect(abbr) {
        $.modal($('#facet-' + abbr), {
            maxWidth: 200,
            minWidth: 200,
            minHeight: 150
        });
    }
    
    function updateCurrentImage() {
        //grab the active product option values
        var activeOptions = $('.product-options .active');
        var optionValues = [];
        $.each(activeOptions, function() {
            optionValues.push($.parseJSON($(this).attr('data-product-option-value')));
        });
        var mediaItems = $('#product_thumbs a');
        var finalMedia;
        var finalMediaMatches = 0;
        $.each(mediaItems, function() {
            var candidateMedia = this;
            var candidateMediaMatches = 0;
            $.each(optionValues, function() {
                if ($(candidateMedia).attr('data-tags') != undefined && 
                    $(candidateMedia).attr('data-tags').toLowerCase().indexOf(this.valueName.toLowerCase()) !== -1) {
                    candidateMediaMatches++;
                }
            });
            if (candidateMediaMatches > finalMediaMatches) {
                finalMedia = candidateMedia;
                finalMediaMatches = candidateMediaMatches;
            }
        });
        
        //at this point I should have the best-matched media item; select it
        if (finalMedia != null) {
            finalMedia.click();
        }
    }

    function updatePriceDisplay(myId) {
        var spo = getSelectedProductOptions();
        var selectedProductOptions = spo.selectedProductOptions;
        var changePrice = spo.changePrice;
        if (changePrice) {
            selectedProductOptions["productId"] = myId;
            changeProductPrice(selectedProductOptions);
        }
    }

    function changeProductPrice(selectedProductOptions) {

        BLC.ajax({
            url : "/pricing/product",
            type : "GET",
            data : selectedProductOptions
        }, function(data) {

            var skuPrice = data.skuPrice;

            if (skuPrice) {
                var priceDiv = $('#price div');
                if (priceDiv.length == 0) {
                    $('.product-options.modal:visible ul').first().append('<div id="price"><div>' + skuPrice + '</div></div>');
                }
                priceDiv.text(skuPrice);
            }

            if(data.error) {
                //disable add to cart
                //display error message
            }
        });
    }
    
    function showNotification(notification, delay) {
        if (!delay) {
            delay = '3500';
        }
        $('#notification_bar').html(notification).slideToggle('slow').delay(delay).slideToggle('slow');
    }
    
    function changeProductOption($option) {
        if (!$option.is('.active')) {
            $option.siblings('.active').removeClass('active');
            $option.toggleClass('active');

            var $productOptions;

            if ($option.parents('.product-options.modal').length == 0) {
                $productOptions = $option.parents('.product-options');
            } else {
                $productOptions = $option.parents('.product-options.modal').children('.product-options');
            }

            $productOptions.find('.product-option-group li div').addClass("uncombinable");

            var selectedOption = $option.data('product-option-value');
            var $optionText = $option.parents('.product-option-group').find('span.option-value');
            $optionText.text(selectedOption.valueName);
            var productOptionData = getProductOptionData();

            for (var i = 0; i < productOptionData.length; i++) {
                var option = productOptionData[i];
                if (option.id === selectedOption.optionId) {
                    option.selectedValue = selectedOption.valueId;
                    break;
                }
            }

            var myId;
            if($option.parents('.product-options').siblings('form').find('[class^="productActions"]').attr('class') != undefined) {
                myId = $option.parents('.product-options').siblings('form').find('[class^="productActions"]').attr('class').substring('productOptions'.length);
            } else {
                myId = $option.parents('.product-options.modal').attr('id').substring('productOptions'.length);
            }
            updateSelectableProductOptions(myId, $optionText.attr('data-optiontype'), selectedOption.valueName, $productOptions);
            updateCurrentImage();
            updatePriceDisplay(myId);
        }
    }

    function getProductOptionData() {
        return $('#product-option-data').data('product-options');
    }
    
    function updateSelectableProductOptions(myId, attributeName, attributeValue, $productOptions) {

        var spo = getSelectedProductOptions();
        var selectedProductOptions = spo.selectedProductOptions;

        selectedProductOptions["productId"] = myId;

        BLC.ajax({
            url : "/selectable/product",
            type : "GET",
            data : selectedProductOptions
        }, function(data) {

            $.map(data, function(data) {
                for(var i =0;i < arguments[0].length;i++)
                {
                    $productOptions.find('.product-option-group li[data-product-option-value^="{\"optionId\":' + arguments[1] + ',\"valueId\":' + arguments[0][i] + ',"] div').removeClass("uncombinable");
                }
            });
        });
    }

    function getSelectedProductOptions() {
        var productOptions = getProductOptionData();
        var selectedProductOptions = {};
        var changePrice = true;

        for (var i = 0; i < productOptions.length; i++) {
            var productOptionType = productOptions[i].type;
            var productOptionSelectedValue = productOptions[i].selectedValue;
            if (productOptions[i].required && productOptionSelectedValue != null) {
                selectedProductOptions[productOptionType] = productOptions[i].values[productOptionSelectedValue];
            } else if (productOptions[i].required) {
                changePrice = false;
            }
        }
        return {selectedProductOptions: selectedProductOptions, changePrice: changePrice};
    }

    function updateLocaleSelection(){
        var locale = $('span#selectedLocale').text();
        $("#" + locale).addClass('selected');
    }
    
    return {
        showNotification : showNotification,
        changeProductOption : changeProductOption,
        showFacetMultiselect : showFacetMultiselect,
        getProductOptionData : getProductOptionData,
        updateLocaleSelection: updateLocaleSelection
    }
})($);
