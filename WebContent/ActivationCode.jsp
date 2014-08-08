<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#category{height:25px;width:205px;}
#subCategory{height:25px;width:205px;}
</style>
<div class="container" style="margin: 10%;">
	<div class="row">
		<div class="col-md-4 " id="signInSection" style="margin-left:19.9999%;margin-top:2%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Personal Email Id</strong>
					<s:fielderror />
				</div>
				<div class="panel-body">
					<form class="form-horizontal" action="activateContinue" method="post">
						<div class="form-group">
							<div class="col-sm-12" style="margin-top:5px;">
								<input class="form-control" id="email" name="email" required type="email" placeholder="Enter Personal mail id">
								<input type="hidden" name="activationCode" id="activationCode" value='<s:property value="#parameters.activationCode"/>'>
							</div>
							<div class="col-sm-8 col-sm-offset-3" style="margin-top:20px;">
								<button type="submit" class="btn btn-success btn-md">
									Activate</button>
							</div>							
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

