 <%@ taglib prefix="s" uri="/struts-tags"%>
<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		<div class="col-md-8 listSection" id="postListSection">
		<table class="table table-bordered">
			<tr>
				<th>Post Details</th>
				<td colspan="3" style="text-align:right;width:100%;"><input style="border:none;" id="page_info" type="text" readonly="readonly"
			value="Showing Page <s:property value="%{(count>0)?page:0}"/> of <s:property 
			value="%{(count<=10 && count>0)?1:(((count%10)==0)?count/10:((count/10))+1)}"/>" /></td>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr style="font-size:12px;">
					 <td style="width:25%;"><img class="images_ad" src="<s:url value='ImageAction?imageId=%{imageFileName}' />" style="width:100px;height:100px;"></td> 
					 <td>
						<p style="color:#428bca;font-size:14px;">
								<a
									href="<s:url action="automobileAdDetails" escapeAmp="false"> 
											<s:param name="category" value="'AUTO'"></s:param>
					                        <s:param name="subCategory" value="%{subCategory}"></s:param>
					                        <s:param name="postIdStr" value="%{postId}"></s:param>
											</s:url>">
									<s:property value="title" />
								</a>

						</p> 
						<span class="postField"><s:property value="city" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="location" /></span>
						<br>
						
						<s:if test="%{subCategory == 1}">
							<!-- Cars -->
							<span class="postField"><s:property value="makeStr" /></span> <span class="separator">|</span>
							<span class="postField"><s:property value="modelStr" /></span> <span class="separator">|</span>
							<span class="postField">Color:&nbsp;<s:property value="color" /></span>
							<br>
							<span class="postField"><s:property value="kms" />&nbsp;Kms&nbsp;done</span> <span class="separator">|</span>
							<span class="postField"><s:property value="fuelTypeStr" /></span> <span class="separator">|</span>
							<span class="postField">No.&nbsp;Of&nbsp;Owners:&nbsp;<s:property value="noOfOwners" /></span>						
						</s:if>
						<s:elseif test="%{subCategory == 2}">
							<!-- Bikes -->
							<span class="postField"><s:property value="makeStr" /></span> <span class="separator">|</span>
							<span class="postField"><s:property value="modelStr" /></span> <span class="separator">|</span>
							<span class="postField">Color:&nbsp;<s:property value="color" /></span>
							<br>
							<span class="postField"><s:property value="kms" />&nbsp;Kms&nbsp;done</span> <span class="separator">|</span>
							<span class="postField">No.&nbsp;Of&nbsp;Owners:&nbsp;<s:property value="noOfOwners" /></span> 		
							<br>
						</s:elseif>
						<br>
					</td>
					<td>
						<span class="postField_Highlight">
							<a
								href="<s:url action="automobileAdDetails" escapeAmp="false"> 
										<s:param name="category" value="'AUTO'"></s:param>
				                        <s:param name="subCategory" value="%{subCategory}"></s:param>
				                        <s:param name="postIdStr" value="%{postId}"></s:param>
										</s:url>">
								Rs.<s:property value="priceStr" />
							</a>
						</span>
					</td> 
					<td><s:date name="createdOn" format="dd/MM/yyyy" /></td>
				</tr>  
			</s:iterator>
		</table>
	</div>
	</s:if>
	<s:else>
		<div class="col-md-8 listSection">
			<table class="table table-bordered">
				<tr>
					<th colspan="3" style="padding-left:15px;font-size:13px;">No posts found! Try refining search criteria</th>
				</tr>
			</table>
		</div>	
	</s:else>
	</div>
