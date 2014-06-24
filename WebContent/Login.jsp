<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="container" style="margin: 10%;">
	<div class="row">
		<div class="col-md-5 ">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Login</strong>
				</div>
				
				<s:if test="isLoginErrorExists =='true'">
				<div class="col-md-12 " id="loginBox"><s:fielderror /> </div>
				</s:if>
				
				<div class="panel-body">
					<s:form cssClass="form-horizontal" role="form" action="login">
						<div class="form-group">
							<label for="CorpEmailId" class="col-sm-3 control-label">
								Email</label>
							<div class="col-sm-9">
								<input class="form-control" id="username" name="username" placeholder="Email"
									required="" type="email">
							</div>
						</div>
						<div class="form-group">
							<label for="Pwd" class="col-sm-3 control-label">
								Password</label>
							<div class="col-sm-9">
								<input class="form-control" id="password" name="password"
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
					</s:form>
				</div>
				<!-- <div class="panel-footer">
					Not Registered? <a href="#">Register here</a>
				</div> -->
			</div>
		</div>

		<div class="col-md-5 " id="registerForm" style="border-left:1px solid #eeeeee">
		<s:if test="isSignUpErrorExists =='true'">
		<div class="col-md-12 " id="signUpBox"><s:fielderror /> </div>
		</s:if>
		<div class="col-md-12 " id="divCheckPasswordMatch"> </div>
		<div class="col-md-12 ">
			<s:form cssClass="form-horizontal" role="form" id="registration" method='post'
				action="signup" theme="simple">
				<fieldset>
					<legend>New to CBuddy? Sign Up!</legend>
					<div class="form-group">
						<label class="col-sm-3 control-label">Name:</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="FirstName" name="FirstName" required="" placeholder="Name" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Corporate Email:</label>
						<div class="col-sm-9">
							<input class="form-control" id="CorpEmailId" name="CorpEmailId" placeholder="Email"
									required="" type="email">
									<span class="help-block">*Corporate Email will only be used to verify a User.</span>
									
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Email:</label>
						<div class="col-sm-9">
							<input class="form-control" id="email" name="email" placeholder="Email"
									required="" type="email">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Password:</label>
						<div class="col-sm-9">
							<input placeholder="Password" required="" type="password" class="form-control" id="Pwd" name="Pwd" >
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Password:</label>
						<div class="col-sm-9">
							<input placeholder="Password" required="" type="password" class="form-control" id="Pwd1" name="password1">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label">Mobile:</label>
						<div class="col-sm-9">
							<input placeholder="Mobile"  type="text" class="form-control" id="MobileNo" name="MobileNo">
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-3 control-label"></label>
						<div class="col-sm-9">
							<button id="btnSignUp" type="submit" class="btn btn-success">Submit</button>
							<button type="reset" class="btn btn-default btn-sm">Reset</button>
						</div>
					</div>
				</fieldset>
			</s:form>
			</div>
		</div>
	</div>
</div>

