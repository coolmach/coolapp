<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#category{height:25px;width:205px;}
#subCategory{height:25px;width:205px;}
</style>
<div class="container" style="margin:5%; margin-left:10%;">
	<div class="row" style="margin-left:20%;">
		<s:fielderror />
	</div>
	<div class="row">
		<div class="col-md-4 " id="signInSection" style="margin-left:19.9999%;margin-top:0%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Forgot Password</strong>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="forgotPwdConfirm" method="post">
						<div class="form-group">
							<div class="col-sm-12" style="margin-top:5px;">
								<input class="form-control" id="PersonalEmailId" name="PersonalEmailId" required type="email" placeholder="Enter Personal Email Id">
							</div>
							<div class="col-sm-12" style="margin-top:10px;">
								&nbsp;*&nbsp;New password would be sent to this Email Id
							</div>							
						</div>					
						<div class="form-group">
							<div class="col-sm-12" style="margin-top:15px;">
								<input class="form-control" id="CorpEmailId" name="CorpEmailId" required type="email" placeholder="Enter Company Email Id">
							</div>
							<div class="col-sm-12" style="margin-top:10px;">
								&nbsp;*&nbsp;Needed only for validation
							</div>							
						</div>
						<div class="form-group">
							<div class="col-sm-8 col-sm-offset-3" style="margin-top:20px;">
								<button type="submit" class="btn btn-success btn-md">Reset Password</button>
							</div>							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

