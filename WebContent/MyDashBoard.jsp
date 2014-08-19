<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="css/dashboard.css" type="text/css">
	<div class="header_responseMessage">
		<s:property value="responseMsg" />
	</div>
	<div class="row col-md-11" style="margin-top:10px;">
		<div class="col-md-8" style="border:1px solid #DDDDDD; ">
			<div class="row">
				<s:if test="#session.userInfo.status == 'PEN'">
					<div class="col-md-12" id="welcomeBanner" style="padding-left:15px;">
						<s:url action="resendActivationCode" var="url_A" escapeAmp="false"><s:param name="username"><s:property value="#session.userInfo.personalEmailId"/></s:param></s:url>
						<ul>
							<li><span style="font-size:16px;">You are yet to activate your cBuddy account</span></li>
							<li>Please click on the link sent to your email id <span style="color:red">'<s:property value="#session.userInfo.corpEmailId"/>'</span> to activate your cBuddy account and make your posts available to other users.</li>
							<li>Click <a href="<s:property value="#url_A"/>">here</a> to resend the activation link to your email id.
						</ul>
					</div>
				</s:if>
				<s:else>
					<div class="col-md-12" id="welcomeBanner" style="padding-left:15px;">
						<s:url action="resendActivationCode" var="url_A" escapeAmp="false"><s:param name="username"><s:property value="#session.userInfo.personalEmailId"/></s:param></s:url>
						<ul>
							<li><span style="font-size:16px;">Welcome to cBuddy!</span></li>
							<li>cBuddy is an exclusive portal for professionals like you. It is a place where professionals meet, discuss and buy/sell things</li>
							<li>Get Started. Click on the 'Post Ad' button below for posting an Ad</li>
						</ul>
					</div>				
				</s:else>
			</div>
			<div class="row">
				<div class="col-md-2 col-md-offset-8" id="welcomeBanner" style="padding-bottom:15px;">
					<s:if test="adList==null || adList.size() == 0">
						<button class="mainButton_Red">Post Free Ad</button>
					</s:if>
					<s:else>
						<button class="mainButton_Red">Post Another Ad</button>
					</s:else>
				</div>
			</div>					
		</div>
		<div class="col-md-3 col-md-offset-1" style="border:1px solid #DDDDDD; padding-top:10px;">
			<span style="font-size:16px; margin-top:20px;">Search Ads</span>
			<ul id="adCategories" style="padding:10px;">
				<li><a href="#">Real Estate</a></li>
				<li><a href="#">Automobiles</a></li>
				<li><a href="#">Home Appliances</a></li>
				<li><a href="#">Computers</a></li>
				<li><a href="#">Mobiles</a></li>
				<li><a href="#">Furniture</a></li>
			</ul>
		</div>
	</div>
	<s:if test="adList.size() > 0">
	<div class="row col-md-11" style="margin-top:20px;">
		<div class="col-md-8" style="margin:0px; padding:0px;">
			<table class="table table-bordered">
				<tr>
					<th colspan="4">My Posts</th>
				</tr>
				<s:iterator value="adList" status="userStatus">
					<tr>
						 <td width="3%" style="padding-left:15px;"><input type="radio" checked name="adList_Index" id="adList_Index"></td> 
						 <td width="64%">
							<p style="color:#428bca;">
								<s:property value="title" />
								<span style="color:#FF0000; font-size:12px;">
									Views(31) &nbsp; <a href="#" style="color:#FF0000; text-decoration:underline;">Comments(2)</a>
								</span>
							</p>
						</td>
						<td>
							<span>Rs.<s:property value="price" /></span>
						</td> 
						<td><s:date name="createdOn" format="dd-MMM-yyyy" /></td>
					</tr>
				</s:iterator>
			</table>
		</div>
	</div>
	
	<div class="row col-md-11" style="margin-top:5px;">
		<div class="col-md-8 col-md-offset-5">
			<button class="tableButton">Edit Post</button> &nbsp;&nbsp;&nbsp;&nbsp;
			<button class="tableButton">Recall Post</button>
		</div>
	</div>
	</s:if>