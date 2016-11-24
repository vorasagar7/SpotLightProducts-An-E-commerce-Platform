<div class="row">
	<div class="col-xs-offset-2 col-xs-8 col-md-offset-4 col-md-4 login-header">
		<h1>SpotLightProducts.com</h1>
	</div>
</div>

<div class="row">
	<div class="col-xs-offset-2 col-xs-8 col-md-offset-4 col-md-4">
		<div role="alert" class="alert alert-danger"
			ng-class="{hideElement: !isAlert, showElement: isAlert}">
			<button type="button" class="close" aria-label="Close"
				ng-click="hideAlert()">
				<span aria-hidden="true">&times;</span>
			</button>
			{{alertMessage}}
		</div>
		<div class="panel panel-default">
			<div class="row">
				<div class="col-xs-offset-2 col-xs-8 col-md-offset-1 col-md-10">
					</br> </br>
					<!-- Credit Card Form starts -->
					<div class="panel panel-default credit-card-box">
						<div class="panel-heading display-table">
							<div class="row display-tr">
								<h3 class="panel-title display-td">Payment Details</h3>
								<div class="display-td">
									<img class="img-responsive pull-right"
										src="${cardImage}">
								</div>
							</div>
						</div>
						<div class="panel-body">
							<form role="form" id="payment-form">
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<label for="cardNumber">CARD NUMBER</label>
											<div class="input-group">
												<input type="tel" class="form-control" name="cardNumber"
													placeholder="Valid Card Number" autocomplete="cc-number"
													 autofocus /> <span class="input-group-addon"><i
													class="fa fa-credit-card"></i></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-7 col-md-7">
										<div class="form-group">
											<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span
												class="visible-xs-inline">EXP</span> DATE</label> <input type="tel"
												class="form-control" name="cardExpiry" placeholder="MM / YY"
												autocomplete="cc-exp" />
										</div>
									</div>
									<div class="col-xs-5 col-md-5 pull-right">
										<div class="form-group">
											<label for="cardCVC">CV CODE</label> <input type="tel"
												class="form-control" name="cardCVC" placeholder="CVC"
												autocomplete="cc-csc" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<label for="couponCode">COUPON CODE</label> <input
												type="text" class="form-control" name="couponCode" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-6">
										<button type="submit" class="btn btn-primary" ng-click="finalPayment()">
											<i class="fa fa-sign-in"></i> Pay
										</button>
									</div>
									<div class="col-xs-6">
										<button type="submit" class="btn btn-primary" ng-click="redirectPage()">
											Back
										</button>
									</div>
								</div>
								<div class="row" style="display: none;">
									<div class="col-xs-12">
										<p class="payment-errors"></p>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- Credit Card Form Ends -->
					</br> <br>
				</div>
			</div>
		</div>
	</div>
</div>
