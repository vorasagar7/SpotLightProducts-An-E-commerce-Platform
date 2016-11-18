<!-- <html>
<head>
<title>Yahoo!!</title>
</head>
<body>
    <p><font color="red">${errorMessage}</font></p>
    <form action="/login" method="POST">
        Name : <input name="name" type="text" /> Password : <input name="password" type="password" /> <input type="submit" />
    </form>
</body>
</html>-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>

<title>SpotLightProducts_Login.html</title>
<!--   <link rel="stylesheet" type = "text/css" href="/resources/bootstrap-3.3.7-dist/css/bootstrap.min.css" /> -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<!--   <link rel="stylesheet" type = "text/css" href="/resources/font-awesome-4.7.0/css/font-awesome.min.css" /> -->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<!--   <script src="scripts/jquery-3.1.1.min.js"></script> -->
<spring:url value="/resources/custom.css" var="customCSS"/>
<link href="${customCSS}" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!--   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<spring:url value="/resources/AngularJS/angular.min.js" var="angularJS" />
<spring:url value="/resources/Login/app.js" var="appJS" />
<spring:url value="/resources/Login/controller.js" var="controllerJS" />
<script src="${angularJS}"></script>
<script src="${appJS}"></script>
<script src="${controllerJS}"></script>
</head>



<body>
	<div class="row">
		<div class="col-xs-offset-2 col-xs-8 col-md-offset-2 col-md-8 login-header">
			<h1>SpotLightProducts</h1>
		</div>
	</div>
	<div class="row login-form" ng-app="LoginApp" ng-controller="loginController">
		<div class="col-xs-offset-3 col-xs-6 col-md-offset-4 col-md-4">
			<div class="panel panel-default">


				<div class="row">
					<div class="col-xs-offset-1 col-xs-10 col-md-offset-1 col-md-10">


						<form action="/login" method="POST" novalidate class="css-form row" name="userForm">
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
										<a href="url">Forgot Password?</a>
									</div>
								</div>
								<input name="password" type="password" class="form-control login-input" id="InputPassword" placeholder="Password" ng-model="user.password" required>
								<p ng-show="userForm.password.$invalid && !userForm.password.$pristine" class="help-block">You password is required.</p>
							</div>

							<div class="form-group col-xs-offset-4 col-xs-4 col-md-offset-2 col-md-8">
								<button type="signIn" class="btn btn-primary login-button" ng-disabled="userForm.$invalid">
									<!-- <i class="fa fa-sign-in login-icon"></i>  -->Sign in
								</button>
							</div>
							<div class="form-group col-xs-offset-4 col-xs-4 col-md-offset-2 col-md-8">
								<button class="btn btn-primary login-button">Create a New Account</button>
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
