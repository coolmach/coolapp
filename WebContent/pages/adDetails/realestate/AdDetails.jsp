<%@ taglib prefix="s" uri="/struts-tags"%>
<%-- <div class=" header_2">
	
</div> --%>
<div class="header_responseMessage">
	<%-- <div class="col-md-12" id="breadCrumb">
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<a class="grey_link" href="<s:url action=""  />">Home</a> >
		<span id="breadCrumb_Category_1">Real Estate</span> > 
		<span id="breadCrumb_SubCategory"><s:property value="subCategoryStr" /></span>
	</div> --%>
</div>

<div class="col-md-8" id="my">
	<s:form cssClass="form-horizontal post"
		action="real_estate_postAd.action" enctype="multipart/form-data">
		<div class="col-md-12 post_title">
			<div style="float: left;">
				<s:property value="postDetails.title" />
			</div>
			<span class="error"><s:fielderror fieldName="errorMsg" /> </span>
		</div>
		<div class="col-md-8">
			<div class="form-group">
				<label for="city" class="col-sm-3 control-label">City</label>
				<div class="col-sm-3">
					<p class="form-control-static">
						<s:property value="postDetails.city" />
					</p>
				</div>
				<label for="location" class="col-sm-4 control-label">Location</label>
				<div class="col-sm-2">
					<p class="form-control-static">
						<s:property value="postDetails.location" />
					</p>
				</div>
			</div>
			<s:if test="%{subCategory == 1}">
				<div class="form-group">
					<label for="Bedrooms" class="col-sm-3 control-label">Bedrooms</label>
					<div class="col-sm-2">
						<p class="form-control-static">
							<s:property value="postDetails.bedrooms" />
							BHK
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="area" class="col-sm-3 control-label">Total Area
						(sq. ft)</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.area" />
							sq ft
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="newOrResaleStr" class="col-sm-3 control-label">New/ReSale</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.newOrResale" />
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="facingDirection" class="col-sm-3 control-label">Facing
						Direction</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.facingDirection" />
						</p>
					</div>
					<label for="floorNumber" class="col-sm-4 control-label">Floor
						No</label>
					<div class="col-sm-2">
						<p class="form-control-static">
							<s:property value="postDetails.floorNumber" />
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="priceValue" class="col-sm-3 control-label">Price</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.priceValue" />
						</p>
					</div>
				</div>
			</s:if>
			<s:elseif test="%{subCategory == 2}">
				<div class="form-group">
					<label for="Bedrooms" class="col-sm-3 control-label">Bedrooms</label>
					<div class="col-sm-2">
						<p class="form-control-static">
							<s:property value="postDetails.bedrooms" />
							BHK
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="area" class="col-sm-3 control-label">Total Area
						(sq. ft)</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.area" />
							sq ft
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="furnished" class="col-sm-3 control-label">Furnished</label>
					<div class="col-sm-6">
						<p class="form-control-static">
							<s:property value="postDetails.furnished" />
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="priceValue" class="col-sm-3 control-label">Maintenance</label>
					<div class="col-sm-3">

						<p class="form-control-static">
							<s:property value="postDetails.maintenance" />
						</p>
					</div>
				</div>

			</s:elseif>
			<s:elseif test="%{subCategory == 3}">
				<div class="form-group">
					<label for="Bedrooms" class="col-sm-3 control-label">Bedrooms</label>
					<div class="col-sm-2">
						<p class="form-control-static">
							<s:property value="postDetails.bedrooms" />
							BHK
						</p>
					</div>
				</div>
				<div class="form-group">
					<label for="area" class="col-sm-3 control-label">Total Area
						(sq. ft)</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.area" />
							sq ft
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="newOrResaleStr" class="col-sm-3 control-label">New/ReSale</label>
					<div class="col-sm-3">
						<p class="form-control-static">
							<s:property value="postDetails.newOrResale" />
						</p>
					</div>
				</div>
			</s:elseif>
			<s:elseif test="%{subCategory == 4}">

			</s:elseif>
			<s:elseif test="%{subCategory == 5}">

			</s:elseif>
			<s:elseif test="%{subCategory == 6}">

			</s:elseif>
			<s:elseif test="%{subCategory == 7}">

			</s:elseif>
			<div class="form-group"></div>
			<div class="form-group">
				<label for="carParking" class="col-sm-3 control-label">Preference</label>
				<div class="col-sm-6">
					<p class="form-control-static">
						<s:property value="postDetails.maritalPreference" />
					</p>
				</div>
			</div>


			<div class="form-group">
				<label for="description" class="col-sm-3 control-label">Remarks</label>
				<div class="col-sm-8">
					<p class="form-control-static">
						<s:property value="postDetails.Description" />
					</p>
				</div>
			</div>
		</div>
		
	
		<div class="col-md-4">
			<div class="fileinput fileinput-new" data-provides="fileinput">
				<div class="fileinput-preview thumbnail" data-trigger="fileinput"
					style="width: 200px; height: 150px;">
					<img class="images_ad"
						src="<s:url value='ImageAction?imageId=%{postDetails.imageFileName}' />"
						style="width: 100px; height: 100px;">
				</div>

			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label"
						style="text-align: left;">Contact Details</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<p class="form-control-static">
						<s:property value="postDetails.ContactPersonName" />
					</p>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<p class="form-control-static">
						<s:property value="postDetails.ContactNo" />
					</p>

				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-8">
					<label for="" class="col-sm-6 control-label"
						style="text-align: left;">Amenities</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-6">
					<p class="form-control-static">
						<s:property value="postDetails.powerBackup" />
					</p>
					<p class="form-control-static">
						<s:property value="postDetails.gym" />
					</p>
					<p class="form-control-static">
						<s:property value="postDetails.carParking" />
					</p>
					<p class="form-control-static">
						<s:property value="postDetails.childrenPlayArea" />
					</p>
					<p class="form-control-static">
						<s:property value="postDetails.clubHouse" />
					</p>
					<p class="form-control-static">
						<s:property value="postDetails.swimmingPool" />
					</p>
				</div>
			</div>

		</div>
	</s:form>
</div>
<div class="col-md-5"></div>


<%-- <div class="col-md-8 " id="my">
	<s:if test="adList.size() > 0">
		<s:iterator value="adList" status="userStatus">
			<div class="col-md-12" style="border-bottom: 1px solid #CCCCCC;">
				<h3>
					<s:property value="title" />
				</h3>
			</div>
			<div class="adspeci newvapadspeci">
				<div style="border-bottom: 1px solid #CCCCCC;">
					City <br />
					<h5>
						<strong><s:property value="cityCode" /> </strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Location <br />
					<h5>
						<strong><s:property value="locCode" /> </strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Rent <br />
					<h5>
						<strong>Rs.<s:property value="price" /> </strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Contact Person <br />
					<h5>
						<strong><s:property value="contactPerson" /> </strong>
					</h5>
				</div>
				<div style="border-bottom: 1px solid #CCCCCC;">
					Contact Name <br />
					<h5>
						<strong><s:property value="contactNo" /> </strong>
					</h5>
				</div>

			</div>
			<div class="imgspace">
				<div id="bigImg" class="imgbigcont newimgbigcont"
					style="display: block;">
					<div class="bigImg_wapp" style="cursor: zoom-in;">
						<img class="" src=" <s:property value="imageFileName" />">
					</div>
				</div>
			</div>

			<div class="col-md-12" style="border-top: 1px solid #CCCCCC;">

			</div>
		</s:iterator>
	</s:if>
	<s:if test="adList.size() > 0">
		<table class="table table-bordered">
			<tr>
				<th>Description</th>
				<th></th>
				<th>Price</th>
				<th>Date</th>
				<th>Posted By</th>
			</tr>
			<s:iterator value="adList" status="userStatus">
				<tr>
					<td><img class="" src=" <s:property value="imageFileName" />">
					</td>
					<td>
						<p>
							<s:property value="title" />
						</p> <s:iterator begin="1" end="rating">
							<img class="rating_stars" src="images/star.jpg">
						</s:iterator> <br /> <small><b><s:property value="cityCode" />,<s:property
									value="locCode" /> </b> </small><br /> <small>Contact <s:property
								value="contactPerson" />,<s:property value="contactNo" /> </small>
					</td>
					<td><s:url action="addetails" var="urlTag">
							<s:param name="price">
								<s:property value="price" />
							</s:param>
						</s:url> <a class="blue_link" href="<s:property value="#urlTag" />"><s:property
								value="price" /> </a>
					</td>
					<td><s:date name="rCreTime" format="dd/MM/yyyy" /></td>
					<td><s:property value="firstName" />(<s:property
							value="corpName" />)</td>
				</tr>
			</s:iterator>
		</table>
	</s:if>
</div>
<div class="col-md-5"></div> --%>