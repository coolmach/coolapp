<%@ taglib prefix="s" uri="/struts-tags"%>
<div class=" header_2"></div>
<div class="col-md-6 pull-left">
	<div class="col-md-3">
		<img id="guy-img" src="images/Guy.png">
	</div>
	<div class="col-md-9">
		<div class="col-md-12 cbuddy_intro">
			<h4>An exclusive Classifieds portal for Techies</h4>
		</div>
		<div class="col-md-12 cbuddy_intro">
			<i style="margin: 10px;">"Say no to brokers, yes to folks/your
				colleagues"</i>
		</div>
		<div class="col-md-12 cbuddy_intro">
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"><b>Verified
					Posts</b>
			</div>
			<div style="margin: 15px;">
				<img class="star-img" src="images/star.png"><b>Authenticate
					Users</b>
			</div>
		</div>
		<div class="col-md-12">
			<img src="images/arrow.png" style="float: left;"> <input
				type="text" class="input-lg" id="category" name="category"
				placeholder="I am looking for...">
		</div>
	</div>
</div>
<div class="col-md-5">
	<table class="table mygrid">
		<tr>
			<td><s:url action="realestate" var="urlTag">
					<s:param name="category">REAL ESTATE</s:param>
				</s:url> <a href="<s:property value="#urlTag" />"><img class="images_ad"
					src="images/real_estate.png"> </a><%-- <strong>REAL ESTATE</strong> --%></td>
			<td><s:url action="cars" var="urlTag1">
					<s:param name="category">CARS</s:param>
				</s:url> <a href="<s:property value="#urlTag1" />"><img
					class="images_ad" src="images/cars.png"> </a><%-- <strong>Cars/Bikes</strong> --%>
			</td>
			<td><s:url action="household" var="urlTag2">
					<s:param name="category">HOUSEHOLD</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a><%-- <strong>Household
					Items</strong> --%></td>
		</tr>
		<tr>
			<td><s:url action="laptops" var="urlTag3">
					<s:param name="category">LAPTOPS</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png">
			</a><%-- <strong>Laptops/Computers</strong> --%>
			</td>
			<td><s:url action="mobiles" var="urlTag4">
					<s:param name="category">MOBILES</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png">
			</a><%-- <strong>Mobile Phones</strong> --%>
			</td>
			<td><s:url action="books" var="urlTag5">
					<s:param name="category">DVD</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png">
			</a><%-- <strong>Books And DVDs</strong> --%>
			</td>
		</tr>

	</table>
	<%-- <div class="table mygrid">
          <s:url action="adlist" var="urlTag">
            <s:param name="category">REAL ESTATE</s:param>
          </s:url>
          <a href="<s:property value="#urlTag" />" ><img  class="images_ad" src="images/real_estate.png"></a>
    </div>
	<div class="table mygrid">
	<s:url action="adlist" var="urlTag1">
            <s:param name="category">CARS</s:param>
          </s:url>
          <a href="<s:property value="#urlTag1" />" ><img  class="images_ad" src="images/cars.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="adlist" var="urlTag2">
            <s:param name="category">HOUSEHOLD</s:param>
          </s:url>
          <a href="<s:property value="#urlTag2" />" ><img  class="images_ad" src="images/household.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="adlist" var="urlTag3">
            <s:param name="category">LAPTOPS</s:param>
          </s:url>
          <a href="<s:property value="#urlTag3" />" ><img  class="images_ad" src="images/laptops.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="adlist" var="urlTag4">
            <s:param name="category">MOBILES</s:param>
          </s:url>
          <a href="<s:property value="#urlTag4" />" ><img  class="images_ad" src="images/mobiles.png"></a>
	</div>
	<div class="table mygrid">
	<s:url action="adlist" var="urlTag5">
            <s:param name="category">DVD</s:param>
          </s:url>
          <a href="<s:property value="#urlTag5" />" ><img  class="images_ad" src="images/dvd.png"></a>
	</div><br/>
	 --%>
	<div class="col-md-12 mygrid_post">
		<span id="post"> <a class="" id="post_ad"
			href="<s:url action="postad"/>">Post Ad</a>
		</span>
	</div>

</div>
