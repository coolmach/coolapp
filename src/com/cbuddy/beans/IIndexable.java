package com.cbuddy.beans;

import org.hibernate.Session;

public interface IIndexable {
	public String generateIndexableString(Session dbSession);
}
