<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
	#backButton{margin-left:75px; font-size:12px;}
	#backButton button{padding:5px; border:0px solid #FFFFFF; background-color:#0099CC;}
</style>

<div class="col-md-8" style="border:1px solid #CCCCCC; margin-left:2%; width:63.5%;">
	<div class="row">
		<div class="header_responseMessage" style="margin-left:5%;margin-bottom:10px;overflow:hidden;">
			<s:property value="responseMsg" />
			<s:if test="fieldErrors.containsKey('DomainNotRegistered')">
				<!-- Special Error set in Action for this case (Company is registered, but his domain is not registered) -->
				Domain '<s:property value="CorpEmailId.substring(CorpEmailId.indexOf('@') + 1)"/>' is not registered. Click <a href="#">here</a> to register your domain.
			</s:if>
			<s:else>
				<s:fielderror />
			</s:else>
		</div>
		
		<div class="col-md-10" id="signInSection" style="margin-left: 9%; margin-top: 2%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Login</strong>
				</div>

				<div class="panel-body">
					<!--s:form cssClass="form-horizontal" role="form" action="login" theme="simple"-->
					<s:form cssClass="form-horizontal" role="form" theme="simple" id="loginForm">
						<input type="hidden" name="actionType" id="actionType" value="LOGIN">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-4 control-label">
								Email</label>
							<div class="col-sm-6">
								<input class="form-control" name="username" value='<s:property value="username"/>' id="username"
									placeholder="Email/Mobile Number" required>
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-4 control-label">
								Password</label>
							<div class="col-sm-6">
								<input class="form-control" name="password" id="password"
									placeholder="Password" type="password" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<div class="checkbox">
									<label> <input type="checkbox"> Remember me </label>
									&nbsp;&nbsp;&nbsp; <a href="<s:url action="forgotPwd"/>">Forgot Password?</a> 
								</div>
							</div>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-9">
								<button type="submit" class="btn btn-success btn-sm" id="loginBtn">
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


		<div class="col-md-10 " id="signUpSection" style="margin-left: 9%; display: none;">
			<div class="col-md-12 " id="divCheckPasswordMatch"></div>
			<div class="panel panel-default">
				<div class="panel-heading">
					<span style="font-size:14px;font-weight:bold;">New User Registration</span>
				</div>
				<div class="panel-body">
					<s:form cssClass="form-horizontal" role="form" action="signup" theme="simple" id="registrationForm">
						<input type="hidden" name="actionType" id="actionType" value="REGISTER">
						<div class="form-group">
							<label class="col-sm-5 control-label">Company<span class="mandatory">*</span></label>
							<div class="col-sm-6">
								<input class="form-control" id="corpName" name="corpName" placeholder="Company Name" required value='<s:property value="%{corpName}" />'> 
								<input type="hidden" name="corpId" id="corpId" value='<s:property value="%{corpId}" />'> 
								<input type="hidden" name="selectedCorpName" id="selectedCorpName"  value='<s:property value="%{selectedCorpName}" />'>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-5 control-label">Corporate Email Id<span class="mandatory">*</span></label>
							<div class="col-sm-6">
								<input class="form-control" id="CorpEmailId" name="CorpEmailId" placeholder="Email" required type="email" value='<s:property value="%{CorpEmailId}" />' > 
								<span class="help-block">* will be used only once for verification</span>

							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-5 control-label">Personal Email Id<span class="mandatory">*</span></label>
							<div class="col-sm-6">
								<input class="form-control" id="PersonalEmailId" name="PersonalEmailId" placeholder="Personal Email Id" required type="email"  value='<s:property value="%{PersonalEmailId}" />'>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-5 control-label">Choose a CBuddy Password<span class="mandatory">*</span></label>
							<div class="col-sm-6">
								<input placeholder="Password" required type="password"
									class="form-control" id="Pwd" name="Pwd">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-5 control-label">&nbsp;</label>
							<div class="col-sm-6">
								<button id="btnSignUp" type="submit" class="btn btn-success">Submit</button>
								<button type="reset" class="btn btn-default btn-sm" >Reset</button>
							</div>
						</div>
						<div class="form-group last">
							<label class="col-sm-5 control-label">&nbsp;</label>
							<div class="col-sm-6">
								<label> <a class="smallLink"
									href="#" onClick="showSignInForm()">Already Registered?Login</a>
								</label>
							</div>
						</div>														
					</s:form>
				</div>
			</div>			
		</div>
	</div>
	<div style="margin-bottom:20px;">
		<span id="backButton">
			<button id="backToResultsButton" class="btn-primary" style="background-image:none;">
				<span class="glyphicon glyphicon-chevron-left"></span> 
				Back to Results
			</button>
		</span>
	</div>
</div>
<script>
	$(document).ready(function(){
		var action = '<s:property value="%{actionType}" />';
		if(action == "LOGIN"){
			showSignInForm();
		}else if(action == "REGISTER"){
			showRegistrationForm();
		}
		
		$("#corpName").autocomplete({
		    source: function(request, response) {
			    $.ajax({
				    url:"/Virat" + "/autoSuggestCorp",
				    type: "POST",
				    dataType: "json",
				    data: {corpSearchString:$("#corpName").val()},
				    success: function(data) {
				        response( $.map(data, function(item) {
					        return {
					            value: item.id,
					            label: item.description,
					        };
				        }));
				    },
				    error: function (error) {
				       alert('error: ' + error.responseText);
				    }
			    });
			},
			select:function(event, ui){
				event.preventDefault();
				$("#corpId").val(ui.item.value);
				$("#corpName").val(ui.item.label);
				$("#selectedCorpName").val(ui.item.label);
			},
		    minLength: 1
		 });
	});
</script>
<script>
	function get(name){
	   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
	      return decodeURIComponent(name[1]);
	}

	function showRegistrationForm(){
		$("#signUpSection").show();
		$("#signInSection").hide();		
	}
	function showSignInForm(){
		$("#signUpSection").hide();
		$("#signInSection").show();		
	}
</script>

<script>
$(document).ready(function(){
	//Prevent form submission. Only Ajax call is allowed
	$("#loginForm").attr("action", "javascript:void(0);");
	
	$("#loginBtn").bind("click", function(){
		uname = $("#username").val();
		pwd = $("#password").val();
		$.ajax({
			type: 'POST',
			url: "miniLogin_Proceed", 
			data: {'username':uname, 'password':pwd},
			success: function(data, status) {
				$('.data').html('');
				$('.data').html(data);
			}
		});	
	});
});
</script>

<script>
$(document).ready(function(){
	alert("JSP");
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>