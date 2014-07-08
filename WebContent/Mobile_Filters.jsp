<div class=" header_2">
	<div class="col-md-12 filter_cat" style="margin-top:3.86%;">
		<div class="form-group pull-left searchFilter" id="sub-main" style="margin-left:4.5%;">
			<div id="subCategory" class="inputstyle pointer form-control">
				<span class="content">Type</span><span
					class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
			</div>
			
			<div id="subCategory_hidden_sub" class="subCategory_hidden_bck" style="display: none;">
				<ul class="list-unstyled">
					<li value="1"><span class="content">Handsets</span></li>
					<li value="2"><span class="content">Accessories</span></li>
				</ul>
			</div>
		</div>
		
	 <form class="form-inline" id="cars"> 
			<div class=" pull-left hidden-subcat searchFilter" id="make-main">
				<div id="make" class="inputstyle pointer form-control">
					Make <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_make" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_make" name="make" value="SON"/><span class="content">Sony</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="NOK"/><span class="content">Nokia</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="SAM"/><span class="content">Samsung</span></li>
							<li><input type="checkbox" class="check_make" name="make" value="APP"/><span class="content">Apple</span></li>
						<li><input type="checkbox" class="check_make" name="make" value="OTH"/><span class="content">Others</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>

			<div class=" pull-left hidden-subcat searchFilter" id="year-main">
				<div id="year" class="inputstyle pointer form-control">
					Year <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_year" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_year" name="year" value="<2005" /><span class="content">< 2005</span></li>
						<li><input type="checkbox" class="check_year" name="year" value="2005-2010" /><span class="content">2005-2010</span></li>
						<li><input type="checkbox" class="check_year" name="year" value="2011" /><span class="content">2011</span></li>
						<li><input type="checkbox" class="check_year" name="year" value="2012" /><span class="content">2012</span></li>
						<li><input type="checkbox" class="check_year" name="year" value="2013" /><span class="content">2013</span></li>
						<li><input type="checkbox" class="check_year" name="year" value="2014" /><span class="content">2014</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>
			<div class=" pull-left hidden-subcat searchFilter" id="model-main">
				<div id="model" class="inputstyle pointer form-control">
					Model <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_model" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_model" name="model" value="IPAD" /><span class="content">iPad</span></li>
						<li><input type="checkbox" class="check_model" name="model" value="GALAXY" /><span class="content">Galaxy</span></li>
						<li><input type="checkbox" class="check_model" name="model" value="OTHERS" /><span class="content">Others</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>			
			<div class=" pull-left hidden-subcat searchFilter" id="processorSpeed-main">
				<div id="processorSpeed" class="inputstyle pointer form-control">
					Processor Speed <span class="glyphicon glyphicon glyphicon-chevron-down form-control-show"></span>
				</div>
				<div id="subCategory_hidden_processorSpeed" class="subCategory_hidden_bck" style="display: none;">
					<ul class="list-unstyled">
						<li><input type="checkbox" class="check_processorSpeed" name="processorSpeed" value="1 GHz" /><span class="content"><= 1 GHz</span></li>
						<li><input type="checkbox" class="check_processorSpeed" name="processorSpeed" value="2 GHz" /><span class="content">2 GHz</span></li>
						<li><input type="checkbox" class="check_processorSpeed" name="processorSpeed" value="> 2 GHz" /><span class="content">> 2 GHz</span></li>
					</ul>
					<a href="#" class="clear blue_link">clear filters</a>
				</div>
			</div>			
		 </form> 
	</div>
	<div class="col-md-12 selected_filters" style="display:none;" id="filterValueBar"></div>
	
	<div class="col-md-12" id="breadCrumb">
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<a class="grey_link" href="<s:url action=""  />">Home</a> >
		<span id="breadCrumb_Category"><s:property value="categoryStr" /></span> > 
		<span id="breadCrumb_SubCategory"><s:property value="subCategoryStr" /></span>
	</div>
</div>