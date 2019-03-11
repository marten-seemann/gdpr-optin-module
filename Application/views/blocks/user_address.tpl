[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinDeliveryAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
        [{oxscript add="$('#editShippingAddress, #newAddress').click( function() { $('#GdprOptinShipAddress input[type=checkbox]').prop('required', 'required'); return false; }); "}]
    [{else}]
        [{if $delivadr}]
            [{oxscript add="$('#showShipAddress').change( function() { $('#GdprShippingAddressOptin, #shippingAddressForm').hide($(this).is(':checked'));});"}]
            [{oxscript add="$('.dd-edit-shipping-address').click(function(){ $('#GdprShippingAddressOptin').toggle($(this).is(':not(:checked)')); document.getElementById('oegdproptin_changeDelAddress').value=1; });"}]
            [{oxscript add="$('.dd-add-delivery-address').click( function(){ $('#GdprShippingAddressOptin').toggle($(this).is(':not(:checked)')); });"}]
        [{else}]
            [{oxscript add="$('#showShipAddress').change( function() { $('#GdprShippingAddressOptin').toggle($(this).is(':not(:checked)')); });"}]
        [{/if}]
    [{/if}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinInvoiceAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
        [{oxscript add="$('#userChangeAddress').click( function() { $('#GdprInvoiceAddressOptin input[type=checkbox]').prop('required', 'required'); return false;});"}]
    [{else}]
        [{oxscript add="$('#userChangeAddress').click( function() { $('#GdprInvoiceAddressOptin').show();$('#userChangeAddress').hide();return false;});"}]
    [{/if}]
[{/if}]

[{capture assign="optinValidationJS"}]
    [{strip}]
        $("#accUserSaveTop").click(function(event){
            $("#oegdproptin_deliveryaddress_error").hide();
            $("#oegdproptin_invoiceaddress_error").hide();

            var success = true;
            if ( $('#oegdproptin_invoiceaddress').is(':visible') && $('#oegdproptin_invoiceaddress').is(':not(:checked)') )
            {
                event.preventDefault();
                $("#oegdproptin_invoiceaddress_error").show();
            }
            if ($('#oegdproptin_deliveryaddress').is(':visible') && $('#oegdproptin_deliveryaddress').is(':not(:checked)'))
            {
                event.preventDefault();
                $("#oegdproptin_deliveryaddress_error").show();
            }

            $(this).submit();
            if (!success){
                return false;
            }
        });
    [{/strip}]
[{/capture}]

[{if strpos($oViewConf->getActiveTheme(), "roxid") === false}]}]
    [{oxscript add=$optinValidationJS}]
[{/if}]

[{$smarty.block.parent}]
