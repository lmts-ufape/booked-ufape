{*
Copyright 2011-2020 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}
{include file='globalheader.tpl'}

{if $ShowLoginError}
	<div id="loginError" class="alert alert-danger">
		{translate key='LoginError'}
	</div>
{/if}

<div id="page-login">

    {if $EnableCaptcha}
        {validation_group class="alert alert-danger"}
        {validator id="captcha" key="CaptchaMustMatch"}
        {/validation_group}
    {/if}

    {if $Announcements|count > 0}
        <div id="announcements" class="col-sm-8 col-sm-offset-2 col-xs-12">
        {foreach from=$Announcements item=each}
            <div class="announcement">{$each->Text()|html_entity_decode|url2link|nl2br}</div>
        {/foreach}
        </div>
    {/if}

	<div class="col-md-offset-4 col-md-4 col-xs-12 ">
		<form role="form" name="login" id="login" class="form-horizontal" method="post"
			  action="{$smarty.server.SCRIPT_NAME}">
			<div id="login-box" class="col-xs-12 default-box">
				<div class="col-xs-12 login-icon">
					{html_image src="$LogoUrl?2.6" alt="$Title" id="icone-login"}
					{html_image src="$LogoLogin" alt="$Title" id="logo-login"}
					<br>
					<div id="texto">
						<p class="texto-login">Sistemas de reservas de</p>
						<p class="texto-login">espaços e equipamentos da UFAPE</p>
					</div>
				</div>
				{if $ShowUsernamePrompt}
					<div class="col-xs-12 login-username">
						<span class="negrito fonte-pequena">Usuário ou E-mail:</span><br>
						<div>						
							<input type="text" required="" class="form-control loginInput"
								   id="email" {formname key=EMAIL} />
						</div>
					</div>
				{/if}

				{if $ShowPasswordPrompt}
					<div class="col-xs-12">
					<span class="negrito fonte-pequena">Senha:</span><br>
						<div class="margin-bottom-25">						
							<input type="password" required="" id="password" {formname key=PASSWORD}
								   class="form-control loginInput"
								   value="" />
						</div>
					</div>
				{/if}

				{if $ShowUsernamePrompt &&  $ShowPasswordPrompt}
					<div class="col-xs-12 {if $ShowRegisterLink}col-sm-6{/if}">
						<div class="checkbox" id="loginCheckbox">
							<input id="rememberMe" type="checkbox" {formname key=PERSIST_LOGIN}>
							<label class="negrito fonte-pequena" for="rememberMe">{translate key=RememberMe}</label>
							{if $ShowForgotPasswordPrompt}							
								<a class="fonte-pequena" id="esqueceu-senha" href="{$ForgotPasswordUrl}" {$ForgotPasswordUrlNew} ><span>
												</span> {translate key='ForgotMyPassword'}</a>
	
							{/if}
						</div>
						
					</div>					
				{/if}
				

				{if $EnableCaptcha}
						<div class="col-xs-12">
								<div class="margin-bottom-25">
								{control type="CaptchaControl"}
								</div>
						</div>
				{else}
						<input type="hidden" {formname key=CAPTCHA} value=""/>
				{/if}

				{if $ShowUsernamePrompt &&  $ShowPasswordPrompt}
				<div class="col-xs-12">
					<button type="submit" class="btn btn-large btn-primary  btn-block entrar-btn" name="{Actions::LOGIN}"
							value="submit"><span class="entrar-btn">{translate key='LogIn'}</span></button>
					<input type="hidden" {formname key=RESUME} value="{$ResumeUrl}"/>
					<hr>
				</div>
				{/if}


				{if $ShowRegisterLink}
						<div class="col-xs-12 col-sm-12 register fonte-pequena">
						<span class="bold">
						<a id="cliqueaqui" href="{$RegisterUrl}" {$RegisterUrlNew}
								title="{translate key=Register}">Clique aqui</a>
						</span> para criar o seu cadastro
						</div>
				{/if}

				<div id="change-language" class="col-xs-12 col-sm-12">
					<button type="button" id="mudar-idioma" class="btn btn-link pull-right-sm fonte-pequena" data-toggle="collapse"
							data-target="#change-language-options"><span><i class="glyphicon glyphicon-globe"></i></span>
						{translate key=ChangeLanguage}
					</button>
					<div id="change-language-options" class="collapse">
						<select {formname key=LANGUAGE} class="form-control input-sm" id="languageDropDown">
							{object_html_options options=$Languages key='GetLanguageCode' label='GetDisplayName' selected=$SelectedLanguage}
						</select>
					</div>
				</div>

				<div class="clearfix"></div>

				{if $AllowGoogleLogin && $AllowFacebookLogin}
					{assign var=socialClass value="col-sm-12 col-md-6"}
				{else}
					{assign var=socialClass value="col-sm-12"}
				{/if}

				{if $AllowGoogleLogin}
					<div class="{$socialClass} social-login" id="socialLoginGoogle">
						<a href="https://accounts.google.com/o/oauth2/v2/auth?scope=email%20profile&state={$GoogleState}&redirect_uri=https://www.social.twinkletoessoftware.com/googleresume.php&response_type=code&client_id=531675809673-3sfvrchh6svd9bfl7m55dao8n4s6cqpc.apps.googleusercontent.com">
							<img src="img/external/btn_google_signin_dark_normal_web.png" alt="Sign in with Google"/>
						</a>
					</div>
				{/if}
				{if $AllowFacebookLogin}
					<div class="{$socialClass} social-login" id="socialLoginFacebook">
						<a href="https://www.social.twinkletoessoftware.com/fblogin.php?protocol={$Protocol}&resume={$ScriptUrlNoProtocol}/external-auth.php%3Ftype%3Dfb%26redirect%3D{$ResumeUrl}">
							<img style="max-height:42px" src="img/external/btn_facebook_login.png" alt="Sign in with Facebook"/>
						</a>
					</div>
				{/if}
			</div>
			<div id="login-footer" class="col-xs-12">				
				
			</div>


		</form>
	</div>
</div>

{setfocus key='EMAIL'}

{include file="javascript-includes.tpl"}

<script type="text/javascript">
	var url = 'index.php?{QueryStringKeys::LANGUAGE}=';
	$(document).ready(function () {
		$('#languageDropDown').change(function () {
			window.location.href = url + $(this).val();
		});

		var langCode = readCookie('{CookieKeys::LANGUAGE}');

		if (!langCode)
		{
			langCode = (navigator.language+"").replace("-", "_").toLowerCase();

			var availableLanguages = [{foreach from=$Languages item=lang}"{$lang->GetLanguageCode()}",{/foreach}];
			if (langCode !== "" && langCode != '{$SelectedLanguage|lower}') {
				if (availableLanguages.indexOf(langCode) !== -1)
				{
					window.location.href = url + langCode;
				}
			}
		}
	});
</script>
{include file='globalfooter.tpl'}