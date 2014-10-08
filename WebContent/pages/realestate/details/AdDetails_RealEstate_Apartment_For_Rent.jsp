<%@ taglib prefix="s" uri="/struts-tags"%>

<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>

<style>
	#postDetails{margin-left:2%;border:1px solid #CCCCCC;padding:15px;}
	.form_Row{height:40px;}
	#backButton{margin-left:50px; font-size:12px;}
	#backButton button{padding:5px; border:0px solid #FFFFFF; background-color:#0099CC;}
	#backButtona{color:rgb(241,84,91);}
</style>


<div class="col-md-8" style="border:1px solid #CCCCCC; margin-left:2%; width:63.5%;">
	<s:form cssClass="form-horizontal post" action="#">
		<div class="col-md-12 post_title" style="height:40px; padding-top:10px;">
			<div style="float:left;">
				<s:property value="postDetails.title"/>
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-7">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Location</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.location"/></label>
				</div>
			</div>
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">City</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.city"/></label>
				</div>
			</div>							
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Total Area</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.area"/> sq.ft</label> 
				</div>
			</div>
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Bedrooms</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.bedrooms"/> BHK</label>
				</div>	
			</div>
			<s:if test="postDetails.preferenceStr != null">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Preference</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.preferenceStr"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.furnishedStr != null">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Furnished</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.furnishedStr"/></label>
				</div>
			</div>
			</s:if>
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Rent</label>
				<div class="col-sm-7">
					<label class="form-control-static fieldValueBold">Rs.<s:property value="postDetails.priceValueStr"/></label>
				</div>
			</div>
			<s:if test="postDetails.maintenanceStr != 0">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Maintenance</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.maintenanceStr"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.facingDirectionStr != -1">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Facing Direction</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.facingDirectionStr"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.floorNumberStr != '' && postDetails.floorNumber != '-1'">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Floor No</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.floorNumberStr"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.description != null && !postDetails.description.trim().equals('')">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Remarks</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.description"/></label>
				</div>
			</div>
			</s:if>
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Contact Person</label>
				<div class="col-sm-7">
					<label class="form-control-static fieldValueBold"><s:property value="postDetails.contactPersonName"/></label>
				</div>
			</div>
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Contact No</label>
				<div class="col-sm-7">
					<label class="form-control-static fieldValueBold"><s:property value="postDetails.contactNo"/></label>
				</div>
			</div>
			<s:if test="postDetails.powerBackup == \"Y\" || postDetails.gym == \"Y\" || postDetails.carParking == \"Y\" || postDetails.childrenPlayArea == \"Y\" || postDetails.clubHouse == \"Y\" || postDetails.swimmingPool == \"Y\"">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Amenities</label>
				<div class="col-sm-7" style="padding-top:4px; color:#777777;">
					<ul>
						<s:if test="postDetails.powerBackup == \"Y\""><li>Power Backup</li></s:if>
						<s:if test="postDetails.gym == \"Y\""><li>Gym</li></s:if>
						<s:if test="postDetails.carParking == \"Y\""><li>Car Parking</li></s:if>
						<s:if test="postDetails.childrenPlayArea == \"Y\""><li>Children Play Area</li></s:if>
						<s:if test="postDetails.clubHouse == \"Y\""><li>Club House</li></s:if>
						<s:if test="postDetails.swimmingPool == \"Y\""><li>Swimming Pool</li></s:if>
					</ul>
				</div>
			</div>			
			</s:if>
			<div class="form_Row" style="margin-top:10px; margin-bottom:10px;">
				<label class="col-sm-5 control-label fieldCaption"></label>
				<div class="col-sm-7">
					<span id="backButton">
						<button id="backToResultsButton" class="btn-primary" style="background-image:none;">
							<span class="glyphicon glyphicon-chevron-left"></span> 
							Back to Results
						</button>
					</span>
				</div>
			</div>			
		</div>
		<%@include file="../../../image_for_ad_details.jsp"%>
	</s:form>	
</div>

<!--div class="col-md-4" >
<div class="col-md-12 post_title">
			<div style="float:left;">
				Comments
			</div>
		</div>
<div class="col-md-12" id="comments-div">
< %@include file="/ajax_comments.jsp" %>
</div>		

<textarea id="comments" class="form-control" rows="3"></textarea>
 <button id="post_cmt" type="button" class="btn btn-default">Post</button>
</div-->
