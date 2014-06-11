<%@ taglib prefix="s" uri="/struts-tags"%>
	<div id='content1'>
		<div>
			<h3>Post Category</h3>
			<form class="form-horizontal post" id="loginForm" action="postad">
				<div class="form-group-modal">
					<s:select class="form-control" id="category"
						headerKey="-1" headerValue="Select Category" onChange="getSubCategory()"
						list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'LAP':'Laptops', 'ELEC':'Electronics', 'HOUSE':'Household Items', 'BOOK':'Books/DVDs'}" 
						name="category" 
						value="2" />
				</div>
				<div class="form-group-modal">
					<s:select class="form-control" id="subCategory"
						headerKey="-1" headerValue="Select Subcategory"
						list="#{'REAL':'Real Estate', 'AUTO':'Cars/Bikes', 'LAP':'Laptops', 'ELEC':'Electronics', 'HOUSE':'Household Items', 'BOOK':'Books/DVDs'}" 
						name="subCategory" 
						value="2" />
				</div>
				<div class="col-sm-offset-2 col-sm-10 modalFormBtn">
					<s:submit cssClass="btn btn-primary pull-right" value="Continue"/>
				</div>
			</form>			
		</div>
	</div>
