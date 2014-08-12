<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style>
#category{height:25px;width:205px;}
#subCategory{height:25px;width:205px;}
</style>
<div class="container" style="margin-left:10%; margin-bottom:2%;">
	<div class="row" style="color:#FF0000; margin-top:20px;">
		<s:if test='#session.userInfo != null && #session.userInfo.status == "PEN"'>
			You can now proceed to post an ad. It would be activated once you click on the activation link mailed to your personal email id.
		</s:if>
	</div>
	<div class="row">
		<div class="col-md-5 " id="signInSection" style="margin-left:19.9999%;margin-top:5%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>Post your Ad</strong>
				</div>
				<div class="panel-body">
					<form class="form-horizontal" role="form" action="postAdContinue" id="categoryForm" method="get">
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-3 control-label">Category</label>
							<div class="col-sm-9" style="margin-top:5px;">
								<s:select class="form-control" id="category"
									headerKey="-1" headerValue="Select Category" onChange="getSubCategory()"
									list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'COMP':'Computers/Laptops', 'MOBILE':'Mobiles', 'ELEC':'Electronics & Household Items', 'FURN':'Furniture'}" 
									name="category" 
									value="2" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword3" class="col-sm-3 control-label">Sub Category</label>
							<div class="col-sm-9" style="margin-top:5px;">
								<s:select class="form-control dropdown" id="subCategory" onChange="submitForm()"
									headerKey="-1" headerValue="Select Subcategory"
									list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'COMP':'Computers/Laptops', 'ELEC':'Electronics  & Household Items', 'FURN':'Furniture'}" 
									name="subCategory" 
									value="2" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-9">
								<div class="checkbox">
									<label style="font-size:14px;"> Or </label>
								</div>
							</div>
						</div>
						<div class="form-group last">
							<div class="col-sm-offset-3 col-sm-6">
								<input class="form-control" name="postSearch" id="postSearch" placeholder="Enter your item here..." type="text">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

