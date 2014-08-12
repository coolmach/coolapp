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
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label fieldCaption">Language Preference</label>
				<div class="col-sm-6">
					<s:if test="postDetails.regionalPreference != null">
						<label class="form-control-static"><s:property value="postDetails.regionalPreference"/></label>
					</s:if>
					<s:else>
						<label class="form-control-static">Does not matter</label>
					</s:else>
				</div>
			</div>
			<div class="form-group">
				<label for="furnished" class="col-sm-4 control-label fieldCaption">Number of Occupants</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="postDetails.noOfRoommates"/></label>
				</div>
			</div>			
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Rent</label>
				<div class="col-sm-6">
					<label class="form-control-static fieldValueBold"><s:property value="postDetails.priceValueStr"/></label>
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
						<s:if test="postDetails.wifi == \"Y\""><li>Wi Fi</li></s:if>
						<s:if test="postDetails.tv == \"Y\""><li>Tv-DTH</li></s:if>
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
</div>>
