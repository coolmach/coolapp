<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
</div>
<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="#">
		<div class="col-md-12 post_title">
			<div style="float:left;">
				<s:property value="%{#action.model.title}" /> 
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg"/></span>
		</div>
	   <div class="col-md-8">
			<div class="form-group">
				<label for="furnished" class="col-sm-4 control-label fieldCaption">Location</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.location"/>, <s:property value="#action.model.city"/></label>
				</div>
			</div>	
			<div class="form-group">
				<label for="make" class="col-sm-4 control-label fieldCaption">Make</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.makeStr"/></label>
				</div>
			</div>		
			<div class="form-group">
				<label for="model" class="col-sm-4 control-label fieldCaption">Model</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.modelStr"/></label>
				</div>
			</div>			
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label fieldCaption">Year</label>
				<div class="col-sm-2">
					<label class="form-control-static"><s:property value="#action.model.year"/></label> 
				</div>
				<label for="Bedrooms" class="col-sm-3 control-label fieldCaption">Kms Done</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="#action.model.kms"/></label>
				</div>	
			</div>
			<div class="form-group">
				<label for="noOfOwners" class="col-sm-4 control-label fieldCaption">No. of owners</label>
				<div class="col-sm-6">
					<s:if test="#action.model.noOfOwners != 0">
						<label class="form-control-static"><s:property value="#action.model.noOfOwners"/></label>
					</s:if>
					<s:else>
						<label class="form-control-static">Not specified</label>
					</s:else>
				</div>
			</div>			
			<div class="form-group">
				<label for="fuelTypeStr" class="col-sm-4 control-label fieldCaption">Fuel Type</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="#action.model.fuelTypeStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Price</label>
				<div class="col-sm-3">
					<label class="form-control-static fieldValueBold"><s:property value="#action.model.priceStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="color" class="col-sm-4 control-label fieldCaption">Color</label>
				<div class="col-sm-3">
					<label class="form-control-static"><s:property value="#action.model.color"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="mileage" class="col-sm-4 control-label fieldCaption">Mileage</label>
				<div class="col-sm-3">
					<s:if test="#action.model.mileage != 0">
						<label class="form-control-static"><s:property value="#action.model.mileage"/></label>
					</s:if>
					<s:else>
						<label class="form-control-static">Not specified</label>
					</s:else>
				</div>

				<label for="mileage" class="col-sm-2 control-label fieldCaption">Insurance</label>
				<div class="col-sm-3">
					<s:if test="#action.model.insuranceAvailable == \"Y\"">
						<label class="form-control-static">Renewed</label>
					</s:if>
					<s:elseif test="#action.model.insuranceAvailable == \"N\"">
						<label class="form-control-static">Not Renewed</label>
					</s:elseif>
					<s:else>
						<label class="form-control-static">Not Specified</label>
					</s:else>
				</div>
			</div>				
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label fieldCaption">Remarks</label>
				<div class="col-sm-8">
					<label class="form-control-static"><s:property value="#action.model.description"/></label>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-preview thumbnail" data-trigger="fileinput"
					style="width: 140px; height: 105px;">
					<img class="images_ad"
						src="<s:url value='ImageAction?imageId=%{#action.model.imageFileName}' />"
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
						<s:property value="#action.model.contactPersonName"/> - Ph:
						<s:property value="#action.model.contactNo"/> 
					</label>
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
