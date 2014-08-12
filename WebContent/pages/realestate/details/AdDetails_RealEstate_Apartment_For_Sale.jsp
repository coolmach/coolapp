<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
</div>

<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="#">
		<div class="col-md-12 post_title">
			<div style="float:left;">
				<s:property value="postDetails.title"/>
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="furnished" class="col-sm-4 control-label fieldCaption">Location</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="postDetails.location"/>, <s:property value="postDetails.city"/></label>
				</div>
			</div>				
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label fieldCaption">Total Area</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="postDetails.area"/> sq.ft</label> 
				</div>
				<label for="Bedrooms" class="col-sm-2 control-label fieldCaption">Bedrooms</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="postDetails.bedrooms"/> BHK</label>
				</div>	
			</div>
			<s:if test="postDetails.preferenceStr != null">
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label fieldCaption">Preference</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="postDetails.preferenceStr"/></label>
				</div>
			</div>
			</s:if>
			
			<div class="form-group">
				<label for="newOrResale" class="col-sm-4 control-label fieldCaption">New/Re-sale</label>
				<div class="col-sm-8">
					<label class="form-control-static"><s:property value="postDetails.newOrResaleStr"/></label>
				</div>
			</div>			
			
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Price</label>
				<div class="col-sm-6">
					<label class="form-control-static fieldValueBold"><s:property value="postDetails.priceValueStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="approvalAuthority" class="col-sm-4 control-label fieldCaption">Approval Authority</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:if test="postDetails.approvalAuthority == \"\"">
							-
						</s:if>
						<s:else>
							<s:property value="postDetails.approvalAuthority"/>
						</s:else>
					</label>
				</div>
			</div>
			<div class="form-group">
				<label for="builderName" class="col-sm-4 control-label fieldCaption">Builder Name</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:if test="postDetails.builderName == \"\"">
							-
						</s:if>
						<s:else>
							<s:property value="postDetails.builderName"/>
						</s:else>
					</label>
				</div>
			</div>			
			<div class="form-group">
				<label for="facingDirection" class="col-sm-4 control-label fieldCaption">Facing Direction</label>
				<div class="col-sm-2">
					<label class="form-control-static"><s:property value="postDetails.facingDirectionStr"/></label>
				</div>
				<label for="floorNumber" class="col-sm-3 control-label fieldCaption">Floor No</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="postDetails.floorNumberStr"/> Floor</label>
				</div>
			</div>
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label fieldCaption">Remarks</label>
				<div class="col-sm-8">
					<label class="form-control-static"><s:property value="postDetails.description"/></label>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-preview thumbnail" data-trigger="fileinput"
					style="width: 140px; height: 105px;">
					<img class="images_ad"
						src="<s:url value='ImageAction?imageId=%{postDetails.imageFileName}' />"
						style="width: 135px; height: 100px;">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label fieldCaption" style="text-align:left;">Contact Details</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label class="form-control-static fieldValueBold" style="margin-left:15px;">
						<s:property value="postDetails.contactPersonName"/> - Ph:
						<s:property value="postDetails.contactNo"/> 
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-3">
					<label for="" class="col-sm-6 control-label fieldCaption">Amenities</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6" style="margin-left:15px;">
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
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-5">
				<button type="submit" class="btn btn-primary pull-right" onClick="history.go(-1);">Back</button>
			</div>
		</div>
	</s:form>

</div>
<div class="col-md-4" >
<div class="col-md-12 post_title">
			<div style="float:left;">
				Comments
			</div>
		</div>
<div class="col-md-12" id="comments-div">
<%@include file="/ajax_comments.jsp" %>
</div>		

<textarea id="comments" class="form-control" rows="3"></textarea>
 <button id="post_cmt" type="button" class="btn btn-default">Post</button>
</div>
