<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="container-fluid" style="margin: 10%;margin-top:3%">
	<div class="row">

		<div class="col-md-9 " id="signInSection" style="margin-left:15%; margin-top:5%;">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong>You are one step away from activation!</strong>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-md-2">
							<img src="images/common/correct.png" style="max-width:70px;padding:10px;margin-top:10px;">
						</div>
						<div class="col-md-9">
							<ul>
								<s:if test="model.corpEmailId == null">
									<s:url action="resendActivationCode" var="url_A" escapeAmp="false"><s:param name="username"><s:property value="username"/></s:param></s:url>
									<li style="list-style-type:disc;padding:5px;">An activation link has been sent to your personal email Id.</li>
									<li style="list-style-type:disc;padding:5px;">Please click on the same to activate your account.</li>
									<li style="list-style-type:disc;padding:5px;">In case you have not received the email, click <a href="<s:property value="#url_A"/>">here to re-send</a></li>
								</s:if>
								<s:else>
									<s:url action="resendActivationCode" var="url_A" escapeAmp="false"><s:param name="username"><s:property value="model.corpEmailId"/></s:param></s:url>
									<li style="list-style-type:disc;padding:5px;">An activation link has been sent to '<s:property value="model.corpEmailId"/>'.</li>
									<li style="list-style-type:disc;padding:5px;">Please click on the same to activate your account.</li>
									<li style="list-style-type:disc;padding:5px;">In case you have not received the email, click 
										<a href="<s:property value="#url_A"/>">here to re-send</a> it.
									</li>
								</s:else>
								
							</ul>
						</div>
					</div>
					<div class="row">
						<div class="col-md-9 col-md-offset-2">
							&nbsp;&nbsp;Take me to <a href="<s:url action=""/>">cBuddy Home</a>
						</div>	
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>
