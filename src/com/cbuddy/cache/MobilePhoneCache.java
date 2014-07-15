package com.cbuddy.cache;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.cbuddy.beans.MobileMaster;

public class MobilePhoneCache {
	private static MobilePhoneCache instance = new MobilePhoneCache();
	private static final HashMap<String, String> mobileModelCache = new HashMap<String, String>();
	private MobilePhoneCache(){
		
	}
	
	public static MobilePhoneCache getInstance(){
		return instance;
	}
	
	public void addToMobileModelCache(String brand, String modelCode){
		mobileModelCache.put(brand + "_" + modelCode, modelCode);
	}
	
	public String getModelName(String brand, String modelCode){
		return mobileModelCache.get(brand + "_" + modelCode);
	}
	
	public void removeFromModelCache(String brand, String modelCode){
		mobileModelCache.remove(brand + "_" + modelCode);
	}
	
	public void initialize(Session dbSession){
		String queryString = "from MobileMaster";
		Query query = dbSession.createQuery(queryString);
		List<MobileMaster> modelsList = query.list();
		for(MobileMaster model:modelsList){
			addToMobileModelCache(model.getBrand().trim(), model.getModel().trim());
		}
	}
	
	public void clearCache(){
		mobileModelCache.clear();
	}
}
