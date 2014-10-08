<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="col-md-12 col-md-offset-3" id="breadCrumb">
	   <span id="cat" style="display:none"><s:property value="category" /></span>
	   <span id="sub" style="display:none"><s:property value="subCategory" /></span>
	
	<s:if test="%{category=='ELEC' || category=='TV' || category=='CAMERA' || category=='FRIDGE' || category=='AC' || category=='WASHING_MACHINE' || category=='DVD'}">
		<s:url action="electronics" var="urlTag" escapeAmp="false">
			<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">0</s:param>
		</s:url>
	</s:if>
	<s:elseif test="%{category=='REAL'}">
		<s:url action="realestate" var="urlTag" escapeAmp="false">
		<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">
				<s:property value="subCategory" />
			</s:param>
		</s:url>
	</s:elseif>
	<s:elseif test="%{category=='AUTO'}">
		<s:url action="automobile" var="urlTag" escapeAmp="false">
		<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">
				<s:property value="subCategory" />
			</s:param>
		</s:url>
	</s:elseif>
	<s:elseif test="%{category=='COMP'}">
		<s:url action="computers" var="urlTag" escapeAmp="false">
		<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">
				<s:property value="subCategory" />
			</s:param>
		</s:url>
	</s:elseif>
	<s:elseif test="%{category=='MOBILE'}">
		<s:url action="mobile" var="urlTag" escapeAmp="false">
		<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">
				<s:property value="subCategory" />
			</s:param>
		</s:url>
	</s:elseif>
	<s:elseif test="%{category=='FURN'}">
		<s:url action="furniture" var="urlTag" escapeAmp="false">
		<s:param name="category">
				<s:property value="category" />
			</s:param>
			<s:param name="subCategory">
				<s:property value="subCategory" />
			</s:param>
		</s:url>
	</s:elseif>
	
	<a class="cbuddy_link" href="<s:url action=""  />">Home</a> >
	<a class="cbuddy_link" href="<s:property value="#urlTag" />"> <span
		id="breadCrumb_Category_1"><s:property value="categoryStr" />
	</span>
	</a> > <span id="breadCrumb_SubCategory"><s:property
			value="subCategoryStr" />
	</span>
	</div>