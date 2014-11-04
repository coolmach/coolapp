package com.cbuddy.common.action;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.SearchKeywords;
import com.cbuddy.util.AutoSuggestKeywordsService;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LogUtil;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class GlobalSearchAction extends ActionSupport implements Serializable{

	private static final long serialVersionUID = 1L;
	private String keywordToSearch;
	private List<SearchKeywords> searchResults;
	
	public String getKeywords(){
		LogUtil.getInstance().info(">>> GlobalSearchAction.getKeywords() - ENTER");
		LogUtil.getInstance().info(">>> GlobalSearchAction.getKeywords() - keywordToSearch: " + keywordToSearch);
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		
		AutoSuggestKeywordsService service = new AutoSuggestKeywordsService();
		
		try{
			searchResults = service.getList(dbSession, keywordToSearch);
		}catch(IOException e){
			e.printStackTrace();
		}
		
		LogUtil.getInstance().info(">>> GlobalSearchAction.getKeywords() - EXIT");
		return Action.SUCCESS;
	}
	
	public String getKeywordToSearch() {
		return keywordToSearch;
	}

	public void setKeywordToSearch(String keywordToSearch) {
		this.keywordToSearch = keywordToSearch;
	}

	public List<SearchKeywords> getSearchResults() {
		return searchResults;
	}

	public void setSearchResults(List<SearchKeywords> searchResults) {
		this.searchResults = searchResults;
	}
}
