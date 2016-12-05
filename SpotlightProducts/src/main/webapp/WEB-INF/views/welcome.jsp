<!DOCTYPE html>
<html>

<head>
<style>
</style>
<title>SpotLightProduct's Main Page</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script
	src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>




<style>
#navBarSearchForm input[type=text] {
	width: 500px !important;
}

.navbar {
	margin-bottom: 0;
}

.borderless li {
	border-top: none;
}

.welcomeMessage {
	margin-top: 15px;
	color: white;
}
</style>



</head>

<div class="row">
	<div class="col-xs-8 col-md-offset-4 col-md-4">
		<h1 align="center">SpotlightProducts</h1>
	</div>
</div>

<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">SP</a>
		</div>

		<form class="navbar-form navbar-left" role="search"
			id="navBarSearchForm" method="POST" action="/search">
			<div class="form-group">
				<input type="text" name="searchQuery" class="form-control"
					placeholder="Search">
			</div>
			<button type="submit" class="btn btn-primary btn">
				<i class="fa fa-search"></i>
			</button>
		</form>




		<ul class="nav navbar-nav navbar-right">

			<li><form action="/ShoppingCart">
					<button type="submit" class="btn btn-primary navbar-btn">
						<i class="fa fa-shopping-cart"></i> Shopping Cart
					</button>
				</form></li>



			<li class="dropdown"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" role="button" aria-haspopup="true"
				aria-expanded="false">${email} <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="/Dashboard">Dashboard</a></li>
					<li><a href="/ChangePassword">Change Password</a></li>
					<li role="separator" class="divider"></li>
					<li><a href="/Logout">Logout</a></li>
				</ul></li>
		</ul>
	</div>
	<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


<ul class="nav nav-pills">
	<li role="presentation" class="active"><a href="/homepage">Home</a></li>
	<li role="presentation"><a href="/filterByElectronics">Electronics</a></li>
	<li role="presentation"><a href="/filterByMobiles">Mobiles</a></li>
	<li role="presentation"><a href="/filterByShoes">Shoes</a></li>
	<li role="presentation"><a href="/filterByWatches">Watches</a></li>
	<li role="presentation"><a href="/filterByBooks">Books</a></li>
	<li role="presentation"><a href="/filterBySpotlightProducts">SpotLightProducts</a></li>
</ul>

<!-- Page Content -->
<div class="container">

	<div class="row">

		




		<div class="col-md-12">

			<div class="row carousel-holder">

				<div class="col-md-12">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel-example-generic" data-slide-to="0"
								class="active"></li>
							<li data-target="#carousel-example-generic" data-slide-to="1"></li>
							<li data-target="#carousel-example-generic" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="item active">
								<img class="slide-image" src="/resources/nikon-1.png" />

							</div>
							<div class="item">
								<img class="slide-image" src="/resources/macbook-1.jpg" alt="">
							</div>
							<div class="item">
								<img class="slide-image" src="/resources/image3.jpg" alt="">
							</div>
						</div>
						<a class="left carousel-control" href="#carousel-example-generic"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>
			<br>
			<div class="row">

				<div class="col-sm-4 col-lg-4 col-md-4">
					<a href="http://localhost:8080/ProductDetails?id=29">
					<div class = "thumbnail">
						<img src="/resources/mainpage1.jpg" alt="">
						<div class="caption">
							<h4 class="pull-right">$300.00</h4>
							<h4>
								Adidas Originals Women's Sneaker</a>
							</h4>
							<p>
								Sports shoes<a target="_blank" href="#"></a>.
							</p>
						</div>
						<div class="ratings">
							<p class="pull-right">2 reviews</p>
							<p>
								<span class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span> <span
									class="glyphicon glyphicon-star"></span>
							</p>
						</div>
					</div>
					</a>
				</div>

				<div class="col-sm-4 col-lg-4 col-md-4">
					<a href="http://localhost:8080/ProductDetails?id=6">
						<div class="thumbnail">
							<img src="/resources/mainpage2.jpg" alt="">
							<div class="caption">
								<h4 class="pull-right"></h4>
								<h4>Heated Butter Knife
					
					</h4>
					<p>Butter Knife which can be used to heat the butter as well</p>
				</div>
				
				<div class="ratings">
					<p class="pull-right">12 reviews</p>
					<p>
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span>
					</p>
				</div>				
				</div>
				</a>
			</div>	
			
			<div class="col-sm-4 col-lg-4 col-md-4">
					<a href="http://localhost:8080/ProductDetails?id=49">
						<div class="thumbnail">
							<img src="/resources/mainpage6.jpg" alt="">
							<div class="caption">
								<h4 class="pull-right"></h4>
								<h4>Data Structure and Algorithms in Python
					
					</h4>
					<p>This is a book on Data Structures and Algorithms in Python</p>
				</div>
				
				<div class="ratings">
					<p class="pull-right">12 reviews</p>
					<p>
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span>
					</p>
				</div>				
				</div>
				</a>
			</div>	
			
			
			
		<div class="col-sm-4 col-lg-4 col-md-4">
			<a href="http://localhost:8080/ProductDetails?id=8">
			<div class="thumbnail">
				<img src="/resources/mainpage3.jpg" alt="">
				<div class="caption">
					<h4 class="pull-right">$120</h4>
					<h4> Laser keyboard
						</a>
					</h4>
					<p>No need for physical keyboard</p>
				</div>
				<div class="ratings">
					<p class="pull-right">10 reviews</p>
					<p>
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span>
					</p>
				</div>
			</div>
			</a>
		</div>

		<div class="col-sm-4 col-lg-4 col-md-4">
			<a href="http://localhost:8080/ProductDetails?id=32">
			<div class="thumbnail">
				<img src="/resources/mainpage4.jpg" alt="">
				<div class="caption">
					<h4 class="pull-right">$150</h4>
					<h4>
						Casio Men's Analog
					</h4>
					<p>Classical Analog Watch</p>
				</div>
				<div class="ratings">
					<p class="pull-right">6 reviews</p>
					<p>
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span> <span
							class="glyphicon glyphicon-star-empty"></span>
					</p>
				</div>
			</div>
			</a>
		</div>

		<div class="col-sm-4 col-lg-4 col-md-4">
			<a href="http://localhost:8080/ProductDetails?id=4">
			<div class="thumbnail">
				<img src="/resources/mainpage5.jpg" alt="">
				<div class="caption">
					<h4 class="pull-right">$200.00</h4>
					<h4>
						<a href="#">One Plus 2</a>
					</h4>
					<p>A cutting edge smartphone by OnePlus</p>
				</div>
				<div class="ratings">
					<p class="pull-right">18 reviews</p>
					<p>
						<span class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star"></span> <span
							class="glyphicon glyphicon-star-empty"></span>
					</p>
				</div>
			</div>
		</div>

		
				
			</div>
		
		</div>



	</div>

</div>

</div>

</div>
<!-- /.container -->

<div class="container">

	<hr>

	<!-- Footer -->
	<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; SpotlightProducts.com 2016</p>
				<a href="/CustomerSupport">Customer Support </a>
			</div>




		</div>
	</footer>

</div>
<!-- /.container -->




</html>
