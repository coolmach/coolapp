<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <div class="header_responseMessage">
	<s:property value="responseMsg" />
</div>
<div class="col-md-12" style="max-width: 100%;">
	<div class="col-md-3 pull-left">
		<img id="guy-img" src="images/Guy.png">
	</div>
	<div class="col-md-6" style="width: 650px; margin-top: 4%;">
		<div class="col-md-12 cbuddy_intro">
			<div class="mainHeading">An exclusive Classifieds portal for
				Techies</div>
		</div>
		<div class="col-md-12 cbuddy_intro"
			style="margin-top: 3%; margin-left: 2%;">
			<h5 class="subHeading">"Say no to brokers, yes to fellow IT
				Community"</h5>
		</div>
		<!-- div class="col-md-12 cbuddy_intro bulletSection">
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"> <span
					class="bulletItem">Verified Posts</span>
			</div>
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"> <span
					class="bulletItem">Authenticated Users</span>
			</div>
		</div-->

	</div>
	<!-- <div class="col-md-3">
	
	</div> -->

</div>
<div class="col-md-12" style="padding-left: 2%; max-width: 200px;">
	<a class="myButton" id="post_ad" href="<s:url action="postAdStart"/>">Post
		Ad</a>

</div>

<div class="col-md-8"
	style="margin-top: 1%; margin-left: 5%; max-width: 900px; margin-bottom: 20px;">
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
			<td><s:url action="electronics" var="urlTag2" escapeAmp="false">
					<s:param name="category">ELEC</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a></td>
			<td><s:url action="computers" var="urlTag3" escapeAmp="false">
					<s:param name="category">COMP</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png"> </a></td>
			<td><s:url action="mobile" var="urlTag4" escapeAmp="false">
					<s:param name="category">MOBILE</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png"> </a></td>
			<td><s:url action="furniture" var="urlTag5" escapeAmp="false">
					<s:param name="category">FURN</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png"> </a></td>
		</tr>

	</table>

</div>

<div class="col-md-12" style="margin-top:2%;margin-left:16%; padding-left: 18%;">
	<img src="images/arrow.png" id="arr_img"> 
	<input type="text" class="form-control" id="category_search" name="category" placeholder="I am looking for...">
</div>
 --%>

<div class="header_responseMessage">
	<s:property value="responseMsg" />
</div> 

		<div class="col-md-3 pull-left">
			<img id="guy-img" src="images/Guy.png">
		</div>
		<div class="pull-right"
			style="width: 650px; margin-top: 4%; margin-right: 160px;">
			<div class="col-md-12 cbuddy_intro">
				<div class="mainHeading">An exclusive Classifieds portal for
					Techies</div>
			</div>
			<div class="col-md-12 cbuddy_intro"
				style="margin-top: 3%; margin-left: 2%;">
				<h5 class="subHeading">"Say no to brokers, yes to fellow IT
					Community"</h5>
			</div>
			<div class="col-md-12"
				style="margin-left: -63px; margin-top: 4%; text-align: center;">
				<a class="myButton" id="post_ad"
					href="<s:url action="postAdStart"/>">Post Ad</a>

			</div>
		</div>

<div class="col-md-10 pull-left"
	style="margin-top: 4%; margin-left: 8%;  margin-bottom: 44px; max-width: 900px;">
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
			<td><s:url action="electronics" var="urlTag2" escapeAmp="false">
					<s:param name="category">ELEC</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a></td>
			<td><s:url action="computers" var="urlTag3" escapeAmp="false">
					<s:param name="category">COMP</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png"> </a></td>
			<td><s:url action="mobile" var="urlTag4" escapeAmp="false">
					<s:param name="category">MOBILE</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png"> </a></td>
			<td><s:url action="furniture" var="urlTag5" escapeAmp="false">
					<s:param name="category">FURN</s:param>
					<s:param name="subCategory">1</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png"> </a></td>
		</tr>

	</table>

</div>
	