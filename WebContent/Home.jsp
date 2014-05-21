<%@ taglib prefix="s" uri="/struts-tags"%>
<script>
	jQuery(function($) {
		// Load dialog on page load
		//$('#basic-modal-content').modal();

		// Load dialog on click
		$('#basic-modal .basic').click(function(e) {
			$('#basic-modal-content').modal();
			return false;
		});
	});
</script>
<script>
	function login() {
		$("#loginForm").submit(
				function f(data) {
					var postData = $(this).serializeArray();
					var formURL = $(this).attr("action");
					$.ajax({
						url : formURL,
						type : "POST",
						data : postData,
						success : function(data, textStatus, jqXHR) {
							var modalDiv = document
									.getElementById("basic-modal-content");
							modalDiv.innerHTML = data;
						},
						error : function(jqXHR, textStatus, errorThrown) {
							alert(errorThrown);
						}
					});
					data.preventDefault(); //STOP default action
				});
		$("#loginForm").submit();
	}
</script>

<script>
	function getSubCategory() {
		var category = $("#cat").val();
		$("#scat").html("");
		if (category == "REAL") {
			var numbers = [ 1, 2, 3, 4 ];
			var val = [ 'APSL', 'APRNT', 'INSL', 'INRNT' ];
			var options = [ 'Apartment for Sale', 'Apartment for Rent',
					'Individual House for Sale', 'Individual House for Rent' ];
		} else if (category == "AUTO") {
			var numbers = [ 1, 2, 3 ];
			var val = [ 'CAR', 'BIKE', 'CYCLE' ];
			var options = [ 'Cars', 'Bikes', 'Cycles' ];
		} else if (category == "LAP") {
			var numbers = [ 1, 2 ];
			var val = [ 'LAPTOP', 'DESKTOP', 'ACC', 'OTH' ];
			var options = [ 'Laptops', 'Desktops', 'Accessories', 'Others' ];
		} else if (category == "ELEC") {
			var numbers = [ 1, 2, 3 ];
			var val = [ 'TV', 'DVD', 'MUSIC', 'OTH' ];
			var options = [ 'TVs', 'Music Players', 'Others' ];
		}
		var index = 0;
		$.each(numbers, function(val, text) {
			$('#scat').append(
					$('<option class="optionListItem"></option>').val(
							val[index]).html(options[index]));
			index = index + 1;
		});
	}
</script>

<script>
	$('#modalLoginBtn').click(function() {
		login();
		return false;
	});
</script>
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
					src="images/real_estate.png"> </a>
			<%-- <strong>REAL ESTATE</strong> --%>
			</td>
			<td><s:url action="cars" var="urlTag1">
					<s:param name="category">CARS</s:param>
				</s:url> <a href="<s:property value="#urlTag1" />"><img
					class="images_ad" src="images/cars.png"> </a>
			<%-- <strong>Cars/Bikes</strong> --%></td>
			<td><s:url action="household" var="urlTag2">
					<s:param name="category">HOUSEHOLD</s:param>
				</s:url> <a href="<s:property value="#urlTag2" />"><img
					class="images_ad" src="images/household.png"> </a>
			<%-- <strong>Household
					Items</strong> --%>
			</td>
		</tr>
		<tr>
			<td><s:url action="laptops" var="urlTag3">
					<s:param name="category">LAPTOPS</s:param>
				</s:url> <a href="<s:property value="#urlTag3" />"><img
					class="images_ad" src="images/laptops.png"> </a>
			<%-- <strong>Laptops/Computers</strong> --%></td>
			<td><s:url action="mobiles" var="urlTag4">
					<s:param name="category">MOBILES</s:param>
				</s:url> <a href="<s:property value="#urlTag4" />"><img
					class="images_ad" src="images/mobiles.png"> </a>
			<%-- <strong>Mobile Phones</strong> --%></td>
			<td><s:url action="books" var="urlTag5">
					<s:param name="category">DVD</s:param>
				</s:url> <a href="<s:property value="#urlTag5" />"><img
					class="images_ad" src="images/dvd.png"> </a>
			<%-- <strong>Books And DVDs</strong> --%></td>
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
			href="<s:url action="postad"/>">Post Ad</a> </span>
	</div>
	<div class="col-md-12 mygrid_post">
		<span id="post"><a class="" id="post_ad"
			href="<s:url action="postad"/>">Post Advertisement</a>
		</span>
	</div>
	<s:if test="%{#session.userLoggedIn} != null">
		<%@include file="./postAd_Modal_Window.jsp"%>
	</s:if>
	<s:else>
		<%@include file="./login_Modal_Window.jsp"%>
	</s:else>
</div>
