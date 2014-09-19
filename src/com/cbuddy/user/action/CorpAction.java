package com.cbuddy.user.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.cbuddy.beans.Corp;
import com.cbuddy.util.AutoSuggestCorporateService;
import com.cbuddy.util.CbuddySessionFactory;
import com.opensymphony.xwork2.ActionSupport;

public class CorpAction extends ActionSupport implements ServletRequestAware{

	private static final long serialVersionUID = 1L;
	private int corpId;
	private String corpSearchString;
	private JSONArray jsonArray;

	public String autoPopulateCorporates() throws JSONException{
		String output = "success";
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		List<Corp> corpList = new AutoSuggestCorporateService().getList(dbSession, corpSearchString);

		if(corpList != null){
			jsonArray = new JSONArray();

			for(Corp corp:corpList){
				JSONObject obj = new JSONObject();
				obj.put("id", corp.getCorpId());
				obj.put("description", corp.getCorpName());
				jsonArray.put(obj);
			}
		}

		return output;
	}

	private HttpServletRequest request = null;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public int getCorpId() {
		return corpId;
	}

	public void setCorpId(int corpId) {
		this.corpId = corpId;
	}

	public String getCorpSearchString() {
		return corpSearchString;
	}

	public void setCorpSearchString(String corpSearchString) {
		this.corpSearchString = corpSearchString;
	}

	public JSONArray getJsonArray() {
		return jsonArray;
	}

	public void setJsonArray(JSONArray jsonArray) {
		this.jsonArray = jsonArray;
	}
}
