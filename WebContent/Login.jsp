<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container" style="margin: 10%;">
	<div class="row">
	<s:if test="responseMsg != null">
		<div class="header_responseMessage">
			<s:property value="responseMsg" />
		</div>
	</s:if>
		<div class="col-md-5 " id="signInSection"
			style="margin-left: 19.9999%; margin-top: 5%;">
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Login</strong>
					<s:fielderror />
				</div>

				<div class="panel-body">
				
					<!--s:form cssClass="form-horizontal" role="form" action="login" theme="simple"-->
					<s:form cssClass="form-horizontal" role="form" action="postAdLogin" theme="simple">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">
								Email</label>
							<div class="col-sm-9">
								<input class="form-control" name="username" value='<s:property value="username"/>' id="username"
									placeholder="Email/Mobile Number" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">
								Password</label>
							<div class="col-sm-9">
								<input class="form-control" name="password" id="password"
									placeholder="Password" type="password" required>
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
									<s:if test="isLoginErrorExists=='false'">
								<button type="reset" class="btn btn-default btn-sm" >
									Reset</button>
									</s:if>
							</div>
						</div>
					</s:form>
				</div>
				<div class="panel-footer">
					Not Registered? <a class="smallLink" href="#"
										onClick="showRegistrationForm()">Register</a> 
				</div> 
			</div>
		</div>

		<div class="col-md-5 " id="signUpSection"
			style="border-left: 1px solid #eeeeee; margin-left: 19.9999%; display: none;">
			<div class="col-md-12 " id="divCheckPasswordMatch">
				<s:fielderror />
			</div>
			<div class="col-md-12 ">
				<s:form cssClass="form-horizontal" role="form" id="registration"
					method='post' action="signup" theme="simple">
					<fieldset>
						<legend>New to CBuddy? Sign Up!</legend>
						<div class="form-group">
							<label class="col-sm-4 control-label">Name</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" id="FirstName"
									name="FirstName" required="" placeholder="Name">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Company</label>
							<div class="col-sm-8">
								<input class="form-control" id="corpName" name="corpName"
									placeholder="Company Name" required> <input
									type="hidden" name="corpId" id="corpId"> <input
									type="hidden" name="selectedCorpName" id="selectedCorpName">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Corporate Email</label>
							<div class="col-sm-8">
								<input class="form-control" id="CorpEmailId" name="CorpEmailId"
									placeholder="Email" required="" type="email"> <span
									class="help-block">* will be used only once for
									verification</span>

							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Personal Email</label>
							<div class="col-sm-8">
								<input class="form-control" id="email" name="email"
									placeholder="Email" required="" type="email">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Password</label>
							<div class="col-sm-8">
								<input placeholder="Password" required="" type="password"
									class="form-control" id="Pwd" name="Pwd">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Re-enter Password</label>
							<div class="col-sm-8">
								<input placeholder="Password" required="" type="password"
									class="form-control" id="Pwd1" name="password1">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Mobile</label>
							<div class="col-sm-8">
								<input placeholder="Mobile" type="text" class="form-control"
									id="MobileNo" name="MobileNo">
							</div>
						</div>

						<div class="form-group" style="margin-top: 20px;">
							<label class="col-sm-4 control-label"></label>
							<div class="col-sm-8">
								<button id="btnSignUp" type="submit" class="btn btn-success">Submit</button>
								<label> <a style="margin-left: 50px;" class="smallLink"
									href="#" onClick="showSignInForm()">Already Registerd?Login</a>
								</label>
							</div>
						</div>
					</fieldset>
				</s:form>
			</div>
		</div>
	</div>
</div>
