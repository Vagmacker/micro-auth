<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        <div class="header-form">
            <h1>${msg("resetPass")}</h1>
            <span>${msg("msgReset")}</span>
        </div>
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <div class="form-body">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <div class="input-username">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                        </div>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="input-username">
                            <#if auth?has_content && auth.showUsername()>
                                <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus value="${auth.attemptedUsername}"/>
                            <#else>
                                <input type="text" id="username" name="username" class="${properties.kcInputClass!}" autofocus/>
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span class="reset-password"><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <div class="btn-form-submit">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
                        </div> 
                    </div>
                </div>
            </div>
        </form>
    <#elseif section = "info" >
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
