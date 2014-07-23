<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/Cbuddy.css"/>
<div class=" header_2">
	<div class=""></div>
</div>
<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post" action="#">
		<div class="col-md-12 post_title">
			<div style="float:left;">
				<s:property value="#action.model.title"/>
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
				<label for="area" class="col-sm-4 control-label fieldCaption">Brand</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.brand"/></label>
					<s:if test="!#action.model.model.equals(\"\")"> 
						,&nbsp;<label class="form-control-static"><s:property value="#action.model.model"/></label>
					</s:if>
				</div>	
			</div>
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label fieldCaption">Screen</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.screenType"/></label>
					<s:if test="!#action.model.screenSize.equals(\"\")">
						,&nbsp;<label class="form-control-static"><s:property value="#action.model.screenSize"/>"</label>
					</s:if>  
				</div>	
			</div>	
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label fieldCaption">Year of Purchase</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:property value="#action.model.year"/>
					</label>
					<s:if test="#action.model.billAvailable.equals(\"Y\")">
						(Original Bill Available)
					</s:if>
					<s:else>
						(Original Bill Not Available)
					</s:else>
				</div>
			</div>		
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Price</label>
				<div class="col-sm-6">
					<label class="form-control-static fieldValueBold"><s:property value="#action.model.priceStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="stabilizer" class="col-sm-4 control-label fieldCaption">Stabilizer</label>
				<div class="col-sm-6">
					<s:if test="#action.model.stabilizer.equals(\"Y\")">
						<label class="form-control-static">Available</label>
					</s:if>
					<s:else>
						<label class="form-control-static">Not Available</label>
					</s:else>  
				</div>	
			</div>
			<div class="form-group">
				<label for="hdmi" class="col-sm-4 control-label fieldCaption">HDMI Port</label>
				<div class="col-sm-6">
					<s:if test="#action.model.hdmi.equals(\"Y\")">
						<label class="form-control-static">Yes</label>
					</s:if>
					<s:else>
						<label class="form-control-static">No</label>
					</s:else>  
				</div>	
			</div>
			<div class="form-group">
				<label for="area" class="col-sm-4 control-label fieldCaption">USB Port</label>
				<div class="col-sm-6">
					<s:if test="#action.model.usb.equals(\"Y\")">
						<label class="form-control-static">Yes</label>
					</s:if>
					<s:else>
						<label class="form-control-static">No</label>
					</s:else>  
				</div>	
			</div>								
			<div class="form-group">
				<label for="description" class="col-sm-4 control-label fieldCaption">Remarks</label>
				<div class="col-sm-8">
					<s:if test="#action.model.description.equals(\"\")">
						<label class="form-control-static">-</label>
					</s:if>
					<s:else>
						<label class="form-control-static"><s:property value="#action.model.description"/></label>
					</s:else>
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
<div class="col-md-5"></div>
