[{$smarty.block.parent}]

[{if !isset($oConfig)}]
    [{assign var="oConfig" value=$oViewConf->getConfig()}]
[{/if}]

[{if true == $oConfig->getConfigParam('blOeGdprOptinUserRegistration')}]
    [{if strpos($oViewConf->getActiveTheme(), "roxid") !== false}]
        <div class="form-group gdproptin [{if $Errors.oegdproptin_userregistration}]has-error[{/if}]">
            <div class="col-sm-16 col-sm-offset-8 col-xs-14 col-xs-offset-10">
                <div class="checkbox">
                    <label for="oegdproptin_userregistration">
                        <input type="checkbox" name="oegdproptin_userregistration" id="oegdproptin_userregistration" value="1" required> [{oxmultilang ident="OEGDPROPTIN_USER_REGISTRATION_OPTIN"}]
                    </label>
                    [{if $Errors.oegdproptin_userregistration}]
                        [{assign var=oError value=$Errors.oegdproptin_userregistration.0}]
                        <div class="help-block with-errors">[{$oError->getOxMessage()}]</div>
                    [{/if}]
                </div>
            </div>
        </div>
    [{else}]
        <div class="col-lg-9 col-lg-offset-3">
            <div class="checkbox">
                <label for="oegdproptin_userregistration">
                    <input type="checkbox" name="oegdproptin_userregistration" id="oegdproptin_userregistration" value="1"> [{oxmultilang ident="OEGDPROPTIN_USER_REGISTRATION_OPTIN"}]
                </label>
            </div>
            [{if $Errors.oegdproptin_userregistration}]
                [{assign var=oError value=$Errors.oegdproptin_userregistration.0}]
                <div class="text-danger">[{$oError->getOxMessage()}]</div>
            [{/if}]
        </div>
    [{/if}]
[{/if}]
