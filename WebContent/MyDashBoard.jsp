<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="header_responseMessage">
	<s:property value="responseMsg" />
</div>
<div class="data">
<input id="pagecount" type="hidden" value="<s:property value="count"/>">
	<s:if test="adList.size() > 0">
		<div class="col-md-8 listSection" id="postListSection">
		<table class="table table-bordered">
			<tr>
				<th>My Posts</th>
				<td colspan="3" style="text-align:right;width:100%;"></td>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr style="font-size:12px;">
					 <td style="width:25%;"><img class="images_ad" src="<s:url value='ImageAction?imageId=%{imageFileName}' />" style="width:100px;height:100px;"></td> 
					 <td>
						<p style="color:#428bca;font-size:14px;">
							<s:property value="title" />
						</p>
						<span class="postField"><s:property value="city" /></span> <span class="separator">|</span>
						<span class="postField"><s:property value="location" /></span>
						<br>
						<span class="postField" style="margin-top:15px;"><s:property value="description" /></span>
					</td>
					<td>
						<span class="postField_Highlight">Rs.<s:property value="price" /></span>
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


<!--div class="col-md-4 pull-left" style="max-width: 400px;">
	<table class="imageTable">
		<tr>
			<td><s:url action="realestate" var="urlTag" escapeAmp="false">
					<s:param name="category">REAL</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag" />"><img class="images_ad"
					src="images/real_estate.png"> </a></td>
			<td><s:url action="automobile" var="urlTag1" escapeAmp="false">
					<s:param name="category">AUTO</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag1" />"><img
					class="images_ad" src="images/cars.png"> </a></td>
			<td><s:url action="household" var="urlTag2">
					<s:param name="category">HOUSEHOLD</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a></td>
		</tr>
		<tr>
			<td><s:url action="computers" var="urlTag3">
					<s:param name="category">LAPTOPS</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png"> </a></td>
			<td><s:url action="mobiles" var="urlTag4">
					<s:param name="category">MOBILES</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png"> </a></td>
			<td><s:url action="books" var="urlTag5">
					<s:param name="category">DVD</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png"> </a></td>
		</tr>

	</table>

</div>
<div class="col-md-3" style="max-width: 200px;">
	<table class="table">
		<tr>
			<td>Edit Profile</td>
		</tr>
		<tr>
			<td>Change/Upload Photo</td>
		</tr>

	</table>
</div-->
