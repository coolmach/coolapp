<%@ taglib prefix="s" uri="/struts-tags"%>
	<div id='content'>
		<div id='basic-modal' class="mygrid_post">
			<input type='button' name='basic' value='Post Ad' class='basic'/>
		</div>
		
		<!-- modal content -->
		<div id="basic-modal-content">
			<h3>Login</h3>
			<form class="form-horizontal post" id="loginForm" action="modalLogin.action">
				<div class="form-group-modal">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="Email Id / Mobile No.">
					<s:fielderror fieldName="username"/>
				</div>
				<div class="form-group-modal">
					<input type="password" class="form-control" id="password" name="password" placeholder="Password">
					<s:fielderror fieldName="password"/>
				</div>
				<div class="form-group-modal">New User? <a href="#">Register</a></div>
				<div class="col-sm-offset-2 col-sm-10 modalFormBtn"><a href="#" onClick="login()" class="btn btn-primary pull-right" id="modalLoginBtn">Login</a></div>
			</form>			
		</div>

		<!-- preload the images -->
		<div style='display:none'>
			<img src='images/x.png' alt='' />
		</div>
	</div>