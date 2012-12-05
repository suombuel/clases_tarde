<form method="post" name="login">
	<div id="login-box-name" style="margin-top:20px;">Email:</div>
	<div id="login-box-field" style="margin-top:20px;">
	<input name="email" class="form-login" title="Username" value="" size="30" maxlength="2048" />
	</div>
	<div id="login-box-name">Password:</div>
	<div id="login-box-field">
	<input name="password" type="password" class="form-login" title="Password" value="" size="30" maxlength="2048" />
	</div>
	<br />
	<span class="login-box-options">
	<input type="checkbox" name="1" value="1"> Remember Me 
	<a href="#" style="margin-left:30px;">Forgot password?</a></span>
	<br />
	<br />
	<img src="/assets/images/login-btn.png" width="103" 
		height="42" style="margin-left:90px;" 
		onclick="document.forms['login'].submit();return;"/>
	<input type="submit" name="submit"/>
</form>