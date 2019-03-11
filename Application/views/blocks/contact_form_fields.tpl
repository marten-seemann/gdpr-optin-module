[{$smarty.block.parent}]

[{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
    <div class="gdproptin form-group [{if $oView->isOptInError()}]has-error[{/if}]">
        <div class="col-sm-18 col-sm-offset-6">
            [{if $oView->isOptInValidationRequired()}]
                <div class="checkbox">
                    <label for="c_oegdproptin">
                        <input type="hidden" name="c_oegdproptin" value="0">
                        <input type="checkbox" name="c_oegdproptin" id="c_oegdproptin" value="1" data-error="[{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_ERROR_MESSAGE" }]" required>
                        [{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_MESSAGE_STATISTICAL" }]
                    </label>
                    [{if $oView->isOptInError()}]
                        <div class="help-block with-errors">[{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_ERROR_MESSAGE" }]</div>
                    [{/if}]
                </div>
            [{else}]
                [{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_MESSAGE_DELETION"}]
            [{/if}]
        </div>
    </div>
[{else}]
    <div class="form-group">
        <div class="col-lg-offset-2 col-lg-10">
            [{if $oView->isOptInValidationRequired()}]
                <label for="c_oegdproptin">
                    <input type="hidden" name="c_oegdproptin" value="0">
                    <input type="checkbox"
                        name="c_oegdproptin"
                        id="c_oegdproptin"
                        value="1">
                    <strong>[{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_MESSAGE_STATISTICAL" }]</strong>
                </label>
                [{if $oView->isOptInError()}]
                    <div class="text-danger">[{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_ERROR_MESSAGE" }]</div>
                [{/if}]
            [{else}]
                [{oxmultilang ident="OEGDPROPTIN_CONTACT_FORM_MESSAGE_DELETION"}]
            [{/if}]
        </div>
    </div>
[{/if}]
