<%@ taglib prefix="s" uri="/struts-tags"%>
	<div id='content2'>
		<div>
			<h3>Login
				<span class="errorMsgInHeader"><s:fielderror fieldName="userName"/><s:fielderror fieldName="password"/></span>
			</h3>
			<form class="form-horizontal post" id="loginForm" action="modalLogin.action">
				<div class="form-group-modal">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="Email ID / Mobile No.">
				</div>
				<div class="form-group-modal">
					<input type="password" class="form-control" id="password" name="password" placeholder="Password">
				</div>
				<div class="form-group-modal">New User? <a href="#">Register</a></div>
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="#" onClick="login()" class="btn btn-primary pull-right" id="modalLoginBtn">Login</a>
				</div>
			</form>			
		</div>

		<!-- preload the images -->
		<div style='display:none'>
			<img src='images/x.png' alt='' />
		</div>
	</div>
	<div class="clear"></div>