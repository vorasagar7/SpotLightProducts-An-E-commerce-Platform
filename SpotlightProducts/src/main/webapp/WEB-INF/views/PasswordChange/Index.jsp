<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>

<title>SpotLightProducts_Login.html</title>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<spring:url value="/resources/custom.css" var="customCSS" />
<link href="${customCSS}" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.js" var="angularJS" />
<spring:url value="/resources/ChangePassword/app.js" var="appJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>
	<style>
	body{
	background-image: url("/resources/spotlightbg1.jpg");
	background-size: 100%;
	}
	h1{
		color: white;
		text-align: center;
	}
	</style>
</head>



<body ng-app="ChangePasswordApp" ng-controller="ChangeUserPassword">
	<div class="row">
		<div
			class="col-xs-offset-2 col-xs-8 col-md-offset-2 col-md-8 login-header">
			<h1>SpotLightProducts</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-offset-3 col-xs-6 col-md-offset-4 col-md-4">
			<div role="alert" class="alert alert-danger"
				ng-class="{hideElement: !isInvalidCredentials, showElement: isInvalidCredentials}">
				<button type="button" class="close" aria-label="Close"
					ng-click="hideAlert()">
					<span aria-hidden="true">&times;</span>
				</button>
				{{alertMessage}}
			</div>
			<div class="panel panel-default">


				<div class="row">
					<div class="col-xs-offset-1 col-xs-10 col-md-offset-1 col-md-10">


						<form novalidate class="css-form row" name="changePasswordForm">
							<h3>Change Your Password</h3>
							<div class="form-group"
								ng-class="{ 'has-error' : changePasswordForm.oldPassword.$invalid && !changePasswordForm.oldPassword.$pristine }">
								<label for="oldPassword" class="control-label">Old
									Password</label> <input name="oldPassword" type="password"
									class="form-control" id="oldPassword"
									placeholder="Old Password" ng-model="User.password" required>
								<p
									ng-show="changePasswordForm.oldPassword.$invalid && !changePasswordForm.oldPassword.$pristine"
									class="help-block">Your Old password is required.</p>
							</div>

							<div class="form-group"
								ng-class="{ 'has-error' : changePasswordForm.password.$invalid && !changePasswordForm.password.$pristine }">
								<label for="exampleInputPassword1" class="control-label">
									New Password</label> <input name="password" type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="Password" ng-model="User.newPassword" required>
								<p
									ng-show="changePasswordForm.password.$invalid && !changePasswordForm.password.$pristine"
									class="help-block">Your password is required.</p>
							</div>

							<div class="form-group"
								ng-class="{ 'has-error' : User.newPassword !== User.reTypePassword && !changePasswordForm.retypePassword.$pristine }">
								<label for="retypePassword" class="control-label">Retype
									Password</label> <input name="retypePassword" type="password"
									class="form-control retype-password" id="retypePassword"
									placeholder="Retype Password" ng-model="User.reTypePassword">
								<p
									ng-show="User.newPassword !== User.reTypePassword && !changePasswordForm.retypePassword.$pristine"
									class="help-block">Does not match with Password.</p>
							</div>
							<div
								class="form-group col-xs-offset-4 col-xs-4 col-md-offset-2 col-md-8">
								<button class="btn btn-primary login-button"
									ng-disabled="changePasswordForm.$invalid || User.newPassword !== User.reTypePassword"
									ng-click="ChangeUserPassword()">Change Password</button>
							</div>
						</form>





						<br> <br>

					</div>
				</div>





			</div>
		</div>
	</div>
</body>
</html>
