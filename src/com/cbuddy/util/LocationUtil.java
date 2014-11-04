package com.cbuddy.util;

import java.util.HashMap;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.cbuddy.beans.City;
import com.cbuddy.beans.Location;

public class LocationUtil {
	private static HashMap<String, String> cityMap = new HashMap<String, String>();
	private static HashMap<String, String> locationMap = new HashMap<String, String>();
	public static String getLocationCode(Session session, String cityCode, String locationName){
		String locationCode = null;
		String queryString = "from Location where loc_name = :locName";

		Query query = session.createQuery(queryString);
		query.setParameter("locName", locationName);
		List<Location> locationList = query.list();
		if(locationList.size() > 0){
			Location location = locationList.get(0);
			locationCode = location.getLocCode();
		}
		return locationCode;
	}
	
	public static String getCityName(Session session, String cityCode){
		String cityName = cityCode;
		if(cityMap.get(cityCode) != null){
			cityName = cityMap.get(cityCode);
		}else{
			String queryString = "from City where city_code = :cityCode";

			Query query = session.createQuery(queryString);
			query.setParameter("cityCode", cityCode);
			List<City> citiesList = query.list();
			if(citiesList.size() > 0){
				City c = citiesList.get(0);
				cityName = c.getCityName();
			}
			cityMap.put(cityCode, cityName);
		}
		
		
		return cityName;
	}

	public static String getLocationName(Session session, String cityCode, String locationCode){
		String locationName = locationCode;
		if(locationMap.get(cityCode + "_" + locationCode) != null){
			locationName = locationMap.get(cityCode + "_" + locationCode);
		}else{
			String queryString = "from Location where loc_code = :locationCode and city_code = :cityCode";

			Query query = session.createQuery(queryString);
			query.setParameter("locationCode", locationCode);
			query.setParameter("cityCode", cityCode);
			List<Location> locationList = query.list();
			if(locationList.size() > 0){
				Location loc = locationList.get(0);
				locationName = loc.getLocName();
			}
			locationMap.put(cityCode + "_" + locationCode, locationName);
		}
		return locationName;
	}
}
