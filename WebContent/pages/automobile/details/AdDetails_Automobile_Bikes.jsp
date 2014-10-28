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
				<label class="col-sm-5 control-label fieldCaption">Make</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.make"/></label>
				</div>	
			</div>										
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Model</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.model"/></label> 
				</div>
			</div>		
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Price</label>
				<div class="col-sm-7">
					<label class="form-control-static fieldValueBold">
						Rs.<s:property value="postDetails.priceStr"/>
						<s:if test="postDetails.negotiable != null && postDetails.negotiable.equals(\"Y\")">
						(Negotiable)
						</s:if>
					</label>
				</div>
			</div>

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
			<s:if test="postDetails.description != null && !postDetails.description.trim().equals('')">
			<div class="form_Row">
				<div class="col-sm-12">
					<label class="control-label fieldCaption">Other Features</label> <label class="form-control-static"><s:property value="postDetails.description"/></label>
				</div>
			</div>
			<div class="form_Row">
			 &nbsp;
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
		<div class="col-md-5" style="margin-left:-10px;">
			<%@include file="../../../image_for_ad_details.jsp"%>
			<s:if test="postDetails.regState != ''">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Reg. State</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.regState"/></label>
				</div>
			</div>
			</s:if>			
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Age</label>
				<div class="col-sm-7">
					<label class="form-control-static">
						<s:if test="postDetails.year == \"1\"">&lt; 1 year</s:if>
						<s:elseif test="postDetails.year == \"2\"">1 -2 years</s:elseif>
						<s:elseif test="postDetails.year == \"3\"">2 - 3 years</s:elseif>
						<s:elseif test="postDetails.year == \"4\"">3 - 4 years</s:elseif>
						<s:elseif test="postDetails.year == \"5\"">4 - 5 years</s:elseif>
						<s:elseif test="postDetails.year == \"6\"">&gt; 5 years</s:elseif>
					</label>
				</div>	
			</div>
			<s:if test="postDetails.noOfOwners != '-1'">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Owners</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.noOfOwners"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.color != ''">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Color</label>
				<div class="col-sm-7">
					<label class="form-control-static"><s:property value="postDetails.color"/></label>
				</div>
			</div>
			</s:if>
			<s:if test="postDetails.insuranceAvailable != '-1'">
			<div class="form_Row">
				<label class="col-sm-5 control-label fieldCaption">Insurance </label>
				<div class="col-sm-7">
					<label class="form-control-static">
						<s:if test="postDetails.insuranceAvailable == \"Y\"">
						Renewed
						</s:if>
						<s:else>
						Not Renewed
						</s:else>
					</label>
				</div>
			</div>
			</s:if>			
		</div>
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

<script>
$(document).ready(function(){
	$("#backToResultsButton").bind("click", function(){
		applyFilters();
		return false;
	});
});
</script>









