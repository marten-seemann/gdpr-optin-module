[{$smarty.block.parent}]

[{if $smarty.template!="form/user_checkout_change.tpl" || strpos($oViewConf->getActiveTheme(), "roxid") === false}]
  [{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
  [{/if}]

  [{if true == $oConfig->getConfigParam('blOeGdprOptinDeliveryAddress')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
      <div class="form-group gdproptin[{if $Errors.oegdproptin_deliveryaddress}] oxInValid[{/if}]" id="GdprOptinShipAddress" class="checkbox">
        <div class="col-sm-offset-8 col-sm-16">
          <div class="checkbox">
            <label for="oegdproptin_deliveryaddress">
              [{* don't set the checkbox required here. This will be done by JavaScript when the form is shown *}]
              <input type="checkbox" name="oegdproptin_deliveryaddress" id="oegdproptin_deliveryaddress" value="1" data-error="[{oxmultilang ident="OEGDPROPTIN_CONFIRM_USER_REGISTRATION_OPTIN" }]"> [{oxmultilang ident="OEGDPROPTIN_STORE_DELIVERY_ADDRESS"}]
              <input type="hidden" class="hidden" id="oegdproptin_changeDelAddress" name="oegdproptin_changeDelAddress" value="0">
            </label>
          </div>
          <div id="oegdproptin_deliveryaddress_error" style="display:none;" class="help-block with-errors">[{oxmultilang ident="OEGDPROPTIN_CONFIRM_USER_REGISTRATION_OPTIN" }]></div>
        </div>
      </div>
    [{else}]
      <div class="form-group[{if $Errors.oegdproptin_deliveryaddress}] oxInValid[{/if}]" id="GdprOptinShipAddress" style="display: none;">
        <div class="col-lg-9 col-lg-offset-3">
          <div class="checkbox">
            <label for="oegdproptin_deliveryaddress">
              <input type="hidden" class="hidden" id="oegdproptin_changeDelAddress" name="oegdproptin_changeDelAddress" value="0">
              <input type="checkbox" name="oegdproptin_deliveryaddress" id="oegdproptin_deliveryaddress" value="1"> <strong>[{oxmultilang ident="OEGDPROPTIN_STORE_DELIVERY_ADDRESS"}]</strong>
            </label>
          </div>
        </div>
        <div class="col-lg-9 col-lg-offset-3">
          <div id="oegdproptin_deliveryaddress_error" style="display:none;" class="text-danger">[{oxmultilang ident="OEGDPROPTIN_CONFIRM_STORE_DELIVERY_ADDRESS" }]</div>
          <div class="help-block"></div>
        </div>
      </div>
    [{/if}]
  [{/if}]
[{/if}]
