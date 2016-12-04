	<style>
	body{
	background-image: url("/resources/SpotlightImage.gif");
	background-size: 100% auto;
	}
	
	</style>
	<div class="row">
		<div class="col-xs-offset-2 col-xs-8 col-md-offset-2 col-md-8 login-header">
			<h1>SpotLightProducts</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-offset-3 col-xs-6 col-md-offset-4 col-md-4">
			<div role="alert" class="alert alert-danger" ng-class="{hideElement: !isInvalidCredentials, showElement: isInvalidCredentials}">
  				<button type="button" class="close" aria-label="Close" ng-click="hideAlert()"><span aria-hidden="true">&times;</span></button>
  				{{alertMessage}}
			</div>
			<div class="panel panel-default">


				<div class="row">
					<div class="col-xs-offset-1 col-xs-10 col-md-offset-1 col-md-10">


						<form novalidate class="css-form row" name="userForm">
							<h3>Login</h3>
							<div class="form-group" ng-class="{ 'has-error' : userForm.email.$invalid && !userForm.email.$pristine }">
								<label for="InputEmail" class="control-label">Email address</label>
								<input name="email" type="email" class="form-control login-input" id="InputEmail" placeholder="Email" ng-model="user.email" required>
								<p ng-show="userForm.email.$invalid && !userForm.email.$pristine" class="help-block">Enter a valid email.</p>
							</div>
							<div class="form-group" ng-class="{ 'has-error' : userForm.password.$invalid && !userForm.password.$pristine }">
								<div class="row">
									<label for="InputPassword" class="control-label col-md-4 col-xs-4">Password</label>
									<div class="col-md-offset-4 col-md-4 col-xs-8" style="text-align: right">
										<a href="#/ForgotPassword">Forgot Password?</a>
									</div>
								</div>
								<input name="password" type="password" class="form-control login-input" id="InputPassword" placeholder="Password" ng-model="user.password" required>
								<p ng-show="userForm.password.$invalid && !userForm.password.$pristine" class="help-block">You password is required.</p>
							</div>

							<div class="form-group col-xs-offset-4 col-xs-4 col-md-offset-2 col-md-8">
								<button type="signIn" class="btn btn-primary login-button" ng-disabled="userForm.$invalid" ng-click="signIn()">
									<!-- <i class="fa fa-sign-in login-icon"></i>  -->Sign in
								</button>
							</div>
							<div class="form-group col-xs-offset-4 col-xs-4 col-md-offset-2 col-md-8">
								<button class="btn btn-primary login-button" ng-click="registerUser()">Create a New Account</button>
							</div>
						</form>





						<br> <br>

					</div>
				</div>





			</div>
		</div>
	</div>