package com.cbuddy.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "SEARCH_KEYWORDS")
public class SearchKeywords {
	
	private int recordId;
	private String keyword;
	private String category;
	private String subcategory;
	
	
	@Id
	@Column(name="RECORD_ID")
	public int getRecordId() {
		return recordId;
	}

	public void setRecordId(int recordId) {
		this.recordId = recordId;
	}

	@Column(name="KEYWORD")
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name="CATEGORY")
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name="SUB_CATEGORY")
	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	public String toString(){
		return "Keyword: " + keyword + ", Category: " + category + ", SubCategory: " + subcategory;
	}
}
