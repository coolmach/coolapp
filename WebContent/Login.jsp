<div class="container" style="margin: 10%;">
	<div class="row">
		<div class="col-md-5 ">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Login</strong>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Email</label>
							<div class="col-sm-9">
								<input class="form-control" id="inputEmail3" placeholder="Email"
									required="" type="email">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">
								Password</label>
							<div class="col-sm-9">
								<input class="form-control" id="inputPassword3"
									placeholder="Password" required="" type="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<div class="checkbox">
									<label> <input type="checkbox"> Remember me </label>
								</div>
							</div>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm">
									Sign in</button>
								<button type="reset" class="btn btn-default btn-sm">
									Reset</button>
							</div>
						</div>
					</form>
				</div>
				<!-- <div class="panel-footer">
					Not Registered? <a href="#">Register here</a>
				</div> -->
			</div>
		</div>

		<div class="col-md-5 " id="registerForm" style="border-left:1px solid #eeeeee">
			<form class="form-horizontal" role="form" id="registration" method='post'
				action='register.php'>
				<fieldset>
					<legend>New to CBuddy? Sign Up!</legend>
					<div class="form-group">
						<label class="col-sm-3 control-label">Username:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="username" name="user_name" required="" placeholder="UserName" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Password:</label>
						<div class="col-sm-9">
							<input placeholder="Password" required="" type="password" class="form-control" id="password" name="password1" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Password:</label>
						<div class="col-sm-9">
							<input placeholder="Password" required="" type="password" class="form-control" id="password" name="password2">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Mobile:</label>
						<div class="col-sm-9">
							<input placeholder="Mobile" required="" type="text" class="form-control" id="mobile" name="mobile">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Email</label>
						<div class="col-sm-9">
							<input class="form-control" id="email" name="email" placeholder="Email"
									required="" type="email">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>
						<div class="col-sm-9">
							<button type="submit" class="btn btn-success">Submit</button>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

