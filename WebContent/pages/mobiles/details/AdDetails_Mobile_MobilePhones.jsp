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
					<label class="form-control-static" fieldValueItalics><s:property value="#action.model.brandStr"/></label>&nbsp;-  
					<label class="form-control-static" fieldValueItalics><s:property value="#action.model.model"/></label>
				</div>	
			</div>
			<div class="form-group">
				<label for="touchScreen" class="col-sm-4 control-label fieldCaption">Touch Screen</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:if test="#action.model.touchScreen == \"Y\"">
							Yes
						</s:if>
						<s:else>
							No
						</s:else>
					</label>
				</div>
			</div>			
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label fieldCaption">Year of Purchase</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.year"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="priceValue" class="col-sm-4 control-label fieldCaption">Price</label>
				<div class="col-sm-6">
					<label class="form-control-static fieldValueBold"><s:property value="#action.model.priceStr"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="carParking" class="col-sm-4 control-label fieldCaption">Operating System</label>
				<div class="col-sm-6">
					<s:if test="#action.model.operatingSystem == null">
						<label class="form-control-static">-</label>
					</s:if>
					<s:else>
						<label class="form-control-static"><s:property value="#action.model.operatingSystem"/></label>
					</s:else>
				</div>
			</div>
			<div class="form-group">
				<label for="color" class="col-sm-4 control-label fieldCaption">Color</label>
				<div class="col-sm-6">
					<label class="form-control-static"><s:property value="#action.model.color"/></label>
				</div>
			</div>
			<div class="form-group">
				<label for="dualSim" class="col-sm-4 control-label fieldCaption">No. of Sims</label>
				<div class="col-sm-6">
					<label class="form-control-static">
						<s:if test="#action.model.dualSim == \"Y\"">
							2 (Dual Sim)
						</s:if>
						<s:else>
							1
						</s:else>
					</label>
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
