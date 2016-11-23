<div class="row">
  <div class="col-xs-offset-2 col-xs-8 col-md-offset-4 col-md-4">
<h1> SpotLightProducts </h1>
</div>
</div>

<body>

<div class="row">
	
	<div class="col-xs-offset-2 col-xs-8 col-md-offset-4 col-md-4">
		<div role="alert" class="alert" ng-class="{hideElement: hideElement, 'alert-success showElement': showSuccessAlert, 'alert-danger showElement': showDangerAlert}">
  				<button type="button" class="close" aria-label="Close" ng-click="hideAlert()"><span aria-hidden="true">&times;</span></button>
  				{{alertMessage}}
			</div>
		<div class = "panel panel-default">


			<div class="row">
				<div class="col-xs-offset-1 col-xs-8 col-md-offset-1 col-md-10">


 					<form name="forgotPasswordForm" class="css-form" novalidate>
 						<h4> Forget Password </h4>
    						<div class="form-group" ng-class="{ 'has-error' : forgotPasswordForm.email.$invalid && !forgotPasswordForm.email.$pristine }">
      							<label for="InputEmail" class = "control-label">Enter Your Email address</label>
      							<input name="email" type="email" class="form-control" id="InputEmail" placeholder="Email" ng-model="forgotPassword.email" required>
      							<p ng-show="forgotPasswordForm.email.$invalid && !forgotPasswordForm.email.$pristine" class="help-block">Enter a valid email.</p>
    						</div>
    						<div class="form-group">
      							<button type="submit" class="btn btn-primary" ng-disabled="forgotPasswordForm.$invalid" ng-click="sendUserPassword()"><i class="fa fa-sign-in"></i>  Submit</button>
    						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<br>

</body>
