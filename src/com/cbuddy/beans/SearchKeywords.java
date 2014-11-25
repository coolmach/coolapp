package com.cbuddy.beans;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "SEARCH_KEYWORDS")
public class SearchKeywords {
	
	private int recordId;
	private String keyword;
	private String category;
	private String subcategory;
	private String city;
	private String cityName;
	private String location;
	private float matchscore;
	
	public SearchKeywords(){
		
	}
	
	public SearchKeywords(String keyword, String category, String sub_category, String city, String location){
		this.keyword = keyword.replace("'", "");
		this.category = category.replace("'", "");
		this.subcategory = sub_category.replace("'", "");
		this.city = city.replace("'", "");
		this.location = location.replace("'", "");
	}
	
	@Id
	@Column(name="RECORD_ID")
	@GeneratedValue(strategy=GenerationType.AUTO)
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

	@Column(name="CITY")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name="LOCATION")
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
	
	public String convertToInsertStatement(){
		return "INSERT INTO SEARCH_KEYWORDS VALUES(null, '" + keyword + " in " + location + "','" + category + "', '" + subcategory + "', '" + city + "', '" + location + "');\n";
	}

	@Transient
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public float getMatchscore() {
		return matchscore;
	}

	public void setMatchscore(float matchscore) {
		this.matchscore = matchscore;
	}
}
