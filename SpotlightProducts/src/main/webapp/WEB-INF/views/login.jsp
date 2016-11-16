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
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!--   <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script> -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



</head>

<div class="row">
	<div class="col-xs-offset-2 col-xs-8 col-md-offset-4 col-md-4">
		<h1>SpotLightProducts</h1>
	</div>
</div>

<body>

	<div class="row">
		<div class="col-xs-8 col-md-offset-4 col-md-4">
			<div class="panel panel-default">


				<div class="row">
					<div class="col-xs-8 col-md-offset-1 col-md-10">


						<form action="/login" method="POST">
							<h3>Login</h3>
							<div class="form-group">
								<label for="InputEmail" class="control-label">Email
									address</label> <input name="email" type="email" class="form-control"
									id="InputEmail" placeholder="Email">
							</div>
							<div class="form-group">
								<label for="InputPassword" class="control-label">Password</label>
								<input name="password" type="password" class="form-control" id="InputPassword"
									placeholder="Password">
							</div>

							<div class="form-group">
								<button type="signIn" class="btn btn-primary">
									<i class="fa fa-sign-in"></i> Sign in
								</button>
							</div>
						</form>

						<br>

						<div class="row">
							<div class="col-md-4">

								<a href="url">Forgot Password?</a>

							</div>

							<a href="url">New User?</a>

						</div>





						<br> <br>

					</div>
				</div>





			</div>
		</div>
	</div>






	</div>

</body>
</html>
