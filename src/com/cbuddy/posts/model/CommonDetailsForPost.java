package com.cbuddy.posts.model;

import org.hibernate.Session;

public interface CommonDetailsForPost {
	public String getTitle();
	public String getCity();
	public String getContactNo();
	public String getContactPersonName();
	public String getDescription();
	public String getLocation();
	public double getPrice();
	public String getSubCategory();
	public String getNegotiable();
	public String getNoOfImages();
	public String generateIndexableString(Session dbSession);
}
