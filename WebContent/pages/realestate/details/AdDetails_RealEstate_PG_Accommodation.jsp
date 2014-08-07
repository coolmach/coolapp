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
				<label for="gender" class="col-sm-4 control-label fieldCaption">Gender</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="postDetails.gender"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-4 control-label fieldCaption">Food</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:if test="postDetails.food == \"Y\"">
							Available
						</s:if>
						<s:elseif test="postDetails.food == \"N\"">
							Not Available
						</s:elseif>
						<s:else>
							Not specified
						</s:else>
					</label>
				</div>
			</div>			
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Rent</label>
				<div class="col-sm-6">
					<label class="form-control-static fieldValueBold"><s:property value="postDetails.priceValueStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Floor No</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="postDetails.floorNumberStr"/></label>
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
						style="width: 100px; height: 100px;">
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
						<s:if test="postDetails.wiFi == \"Y\""><li>Wi Fi</li></s:if>
						<s:if test="postDetails.tv == \"Y\""><li>TV/DTH</li></s:if>
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
<div class="col-md-5"></div>
