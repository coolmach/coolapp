<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="header_responseMessage">
	<s:property value="responseMsg" />
</div>
<div class="col-md-5 pull-left" style="max-width: 600px;">

	<table class="table">
		<tr>
			<th>Post Description</th>
			<th>Post Date</th>
			<th>Action</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td>Edit/Delete</td>
		</tr>

	</table>

</div>


<div class="col-md-4 pull-left" style="max-width: 400px;">
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
</div>
