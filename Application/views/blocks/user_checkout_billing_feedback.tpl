[{$smarty.block.parent}]

[{if !isset($oConfig)}]
  [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{if $smarty.template!="form/user_checkout_change.tpl" || strpos($oViewConf->getActiveTheme(), "roxid") === false}]
  [{if true == $oConfig->getConfigParam('blOeGdprOptinInvoiceAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
      <div class="form-group gdproptin[{if $Errors.oegdproptin_invoiceaddress}] has-error[{/if}]" id="GdprInvoiceAddressOptin">
        <div class="col-sm-offset-8 col-sm-16">
            <div class="checkbox">
                <label for="oegdproptin_invoiceaddress">
                    [{* don't set the checkbox required here. This will be done by JavaScript when the form is shown *}]
                    <input type="checkbox" name="oegdproptin_invoiceaddress" id="oegdproptin_invoiceaddress" value="1" data-error="[{oxmultilang ident="OEGDPROPTIN_CONFIRM_STORE_INVOICE_ADDRESS" }]"> [{oxmultilang ident="OEGDPROPTIN_STORE_INVOICE_ADDRESS"}]
                    <input type="hidden" class="hidden" id="oegdproptin_changeInvAddress" name="oegdproptin_changeInvAddress" value="0">
                </label>
            </div>
        </div>
      </div>
    [{else}]
      <div class="form-group[{if $Errors.oegdproptin_invoiceaddress}] oxInValid[{/if}]" id="GdprInvoiceAddressOptin" style="display: none;">
        <div class="col-lg-9 col-lg-offset-3">
          <div class="checkbox">
            <label for="oegdproptin_invoiceaddress">
              <input type="hidden" class="hidden" id="oegdproptin_changeInvAddress" name="oegdproptin_changeInvAddress" value="0">
              <input type="checkbox" name="oegdproptin_invoiceaddress" id="oegdproptin_invoiceaddress" value="1"> <strong>[{oxmultilang ident="OEGDPROPTIN_STORE_INVOICE_ADDRESS"}]</strong>
            </label>
          </div>
        </div>
        <div class="col-lg-9 col-lg-offset-3">
          <div id="oegdproptin_invoiceaddress_error" style="display:none;" class="text-danger">[{oxmultilang ident="OEGDPROPTIN_CONFIRM_STORE_INVOICE_ADDRESS" }]</div>
          <div class="help-block"></div>
        </div>
      </div>
    [{/if}]
  [{/if}]
[{/if}]
