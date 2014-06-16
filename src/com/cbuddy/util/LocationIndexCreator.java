package com.cbuddy.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Query;
import org.hibernate.Session;

import com.cbuddy.beans.City;
import com.cbuddy.beans.Location;

public class LocationIndexCreator{
	private static LocationIndexCreator instance = null;
	private LocationIndexCreator(){}
	public static LocationIndexCreator getInstance(){
		if(instance == null){
			instance = new LocationIndexCreator();
		}
		return instance;
	}
	public boolean indexAllLocations(Session session){
		return indexLocations(session, null);
	}
	public boolean indexLocationsForCity(Session session, String city){
		if(city==null || city.trim().equals("")){
			return false;
		}
		return indexLocations(session, city);
	}
	private boolean indexLocations(Session session, String city){
		boolean executionSuccessful = false;
		try{
			createIndexes(session, city);
			executionSuccessful = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return executionSuccessful;
	}
	private List<Location> getLocationList(Session session, String city){
		String queryString = "from Location where city_code = :city";
		Query query = session.createQuery(queryString);
		query.setParameter("city", city);
		List<Location> locationList = query.list();
		return locationList;
	}

	private void indexLocation(IndexWriter w, Location location) throws IOException{
		Document doc = new Document();
		doc.add(new StringField("code", location.getLocCode(), Field.Store.YES));
		doc.add(new TextField("name", location.getLocName(), Field.Store.YES));
		w.addDocument(doc);
	}

	private List<City> getAllCities(Session session){
		String queryString = "from City";
		Query query = session.createQuery(queryString);
		List<City> cityList = query.list();
		return cityList;
		
	}
	
	private void createIndexes(Session session, String city) throws IOException, ParseException {
		// 0. Specify the analyzer for tokenizing text.
		//    The same analyzer should be used for indexing and searching
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);

		// 1. create the index
		if(city == null){
			//Index needs to be done for all locations in all cities
			Directory index = null;
			IndexWriterConfig config = null;
			IndexWriter w = null;
			
			List<City> cityList = getAllCities(session);
			for(City tempCity:cityList){
				index = FSDirectory.open(new File(tempCity.getCityCode() + "-location-index"));
				config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
				w = new IndexWriter(index, config);
				w.deleteAll();
				
				List<Location> locationList = getLocationList(session, tempCity.getCityCode());
				for(Location location:locationList){
					indexLocation(w, location);
				}
				w.close();
			}
		}else{
			//Index needs to be done only for locations in a given city
			Directory index = FSDirectory.open(new File(city + "-location-index"));
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
			IndexWriter w = new IndexWriter(index, config);
			w.deleteAll();
			List<Location> locationList = getLocationList(session, city);
			for(Location location:locationList){
				indexLocation(w, location);
			}
			w.close();
		}
		
		
		System.out.println("Indexing complete");
	}
}
