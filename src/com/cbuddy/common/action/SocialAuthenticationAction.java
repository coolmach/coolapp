/*
 ===========================================================================
 Copyright (c) 2013 3PillarGlobal

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sub-license, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ===========================================================================

 */

package com.cbuddy.common.action;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.RequestUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.views.util.UrlHelper;
import org.brickred.socialauth.Permission;
import org.brickred.socialauth.SocialAuthConfig;
import org.brickred.socialauth.SocialAuthManager;


/**
 * 
 * It redirects the browser to an appropriate URL which will be used for
 * authentication with the provider that has been set by clicking the icon. It
 * creates an instance of the requested provider from AuthProviderFactory and
 * calls the getLoginRedirectURL() method to find the URL which the user should
 * be redirect to.
 * 
 *
 * 
 */

public class SocialAuthenticationAction implements SessionAware,
ServletRequestAware, ServletResponseAware {

	private Map<String, Object> userSession;
	private String id;
	private String mode;
	private String url;
	private HttpServletRequest request;
	private HttpServletResponse response;


	public String index(){
		System.out.println("SocialAuthenticationAction.index()");
		return "success";
	}

	public String execute() throws Exception  {
		System.out.println("Given provider id :: " + id);

		SocialAuthManager manager;
		if (userSession.get("socialAuthManager") != null) {
			manager = (SocialAuthManager) userSession.get("socialAuthManager");
			if ("signout".equals(mode)) {
				manager.disconnectProvider(id);
				return "home";
			}
		} else {
			InputStream in = SocialAuthenticationAction.class.getClassLoader()
			.getResourceAsStream("oauth_consumer.properties");
			System.out.println(in);
			SocialAuthConfig conf = SocialAuthConfig.getDefault();
			conf.load(in);
			manager = new SocialAuthManager();
			manager.setSocialAuthConfig(conf);
			System.out.println(manager);
			userSession.put("socialAuthManager", manager);
		}

		String returnToUrl = RequestUtils.getServletPath(request);
		System.out.println(returnToUrl);
		// returnToUrl =
		// "http://opensource.brickred.com/socialauth-struts-demo/socialAuthSuccessAction.do";
		returnToUrl = UrlHelper.buildUrl("socialAuthSuccessAction", request,
				response, null, null, true, true, true);
		System.out.println(returnToUrl);
		url = manager.getAuthenticationUrl(id, returnToUrl);
		System.out.println("Redirecting to: " + url);
		if (url != null) {
			return "redirect";
		}
		return "failure";
	}

	@Override
	public void setSession(final Map<String, Object> session) {
		userSession = session;
	}

	@Override
	public void setServletRequest(final HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletResponse(final HttpServletResponse response) {
		this.response = response;
	}

	public String getId() {
		return id;
	}

	public void setId(final String id) {
		this.id = id;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(final String mode) {
		this.mode = mode;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(final String url) {
		this.url = url;
	}

}
