[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{$smarty.block.parent}]

[{if $oxcmp_user}]
    [{assign var="delivadr" value=$oxcmp_user->getSelectedAddress()}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinDeliveryAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
        [{oxscript add="
            var cbShip = $('#GdprOptinShipAddress input[type=checkbox]');
            cbShip.parents('form').one('submit', function(ev) {
                if(cbShip.is(':visible')) {
                    cbShip.prop('required', 'required');
                    ev.preventDefault();
                }
            });
        "}]
    [{else}]
        [{if $delivadr}]
            [{oxscript add="$('#showShipAddress').change( function() { $('#GdprOptinShipAddress, #shippingAddressForm').hide($(this).is(':checked'));});"}]
            [{oxscript add="$( '.dd-edit-shipping-address' ).click(function(){ $('#GdprOptinShipAddress').toggle($(this).is(':not(:checked)')); document.getElementById('oegdproptin_changeDelAddress').value=1; });"}]
            [{oxscript add="$( '.dd-add-delivery-address' ).click( function(){ $('#GdprOptinShipAddress').toggle($(this).is(':not(:checked)')); });"}]
        [{else}]
            [{oxscript add="$('#showShipAddress').change( function() { $('#GdprOptinShipAddress').toggle($(this).is(':not(:checked)')); });"}]
        [{/if}]
    [{/if}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinInvoiceAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
        [{oxscript add="
            var cbInv = $('#GdprInvoiceAddressOptin input[type=checkbox]');
            cbInv.parents('form').one('submit', function(ev) {
                if(cbInv.is(':visible')) {
                    cbInv.prop('required', 'required');
                    ev.preventDefault();
                }
            });
        "}]
    [{else}]
        [{oxscript add="$('#userChangeAddress').click( function() { $('#GdprInvoiceAddressOptin').toggle();return false;});"}]
    [{/if}]
[{/if}]

[{if !isset($oConfig)}]
  [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{capture assign="optinValidationJS"}]
    [{strip}]
        $("#userNextStepBottom, #userNextStepTop").click(function(event){
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

[{if strpos($oViewConf->getActiveTheme(), "roxid") === false}]
    [{oxscript add=$optinValidationJS}]
[{/if}]
