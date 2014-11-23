package com.cbuddy.index_generators;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.SearchKeywords;
import com.cbuddy.util.CbuddySessionFactory;

public class SearchKeywordDBSeedGenerator {
	private static final String BASE_PATH = "C:\\Shiva\\generated_indexes\\";
	public static void main(String[] args)throws IOException, ParseException{
		ArrayList<String> locationList = getLocationList("BLR");
		ArrayList<SearchKeyword_Input> inputs = formInputForRealEstate();
		ArrayList<SearchKeywords> output = new ArrayList<SearchKeywords>();
		
		for(SearchKeyword_Input input:inputs){
			for(String area:locationList){
				SearchKeywords keyword = new SearchKeywords(input.keyword + " in " + area, input.category, input.sub_category, "BLR", area);
				output.add(keyword);
			}
		}
	
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		dbSession.beginTransaction();
		
		updateDB(output, dbSession);
		
		dbSession.getTransaction().commit();
		dbSession.close();
		
		generateOutput(output);
		System.out.println(">>> Written!");
	}

	private static void updateDB(List<SearchKeywords> keywords, Session dbSession){
		//Delete existing entries in DB
		String str = String.format("Delete from %s", "SearchKeywords");
		Query q = dbSession.createQuery(str);
		q.executeUpdate();
		
		for(SearchKeywords keyword:keywords){
			dbSession.save(keyword);
		}
	}
	
	private static ArrayList<String> getLocationList(String cityCode) throws IOException{
		FileReader fileReader = new FileReader(new File(BASE_PATH, cityCode + "_Locations.txt"));
		BufferedReader bReader = new BufferedReader(fileReader);
		String line = "";
		ArrayList<String> list = new ArrayList<String>();
		while((line=bReader.readLine()) != null){
			list.add(line);
		}
		bReader.close();
		fileReader.close();
		return list;
	}
	
	private static void generateOutput(List<SearchKeywords> outputs) throws IOException{
		FileWriter fileWriter = new FileWriter(new File(BASE_PATH, "output.txt"));
		BufferedWriter bWriter = new BufferedWriter(fileWriter);
		for(SearchKeywords line:outputs){
			bWriter.write(line.toString());
		}
		bWriter.close();
		fileWriter.close();
	}
	
	private static ArrayList<SearchKeyword_Input> formInputForRealEstate(){
		ArrayList<SearchKeyword_Input> SearchKeyword_Inputs = new ArrayList<SearchKeyword_Input>();
		
		SearchKeyword_Inputs.add(new SearchKeyword_Input("1 BHK for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("2 BHK for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("3 BHK for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("4 BHK for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("1 BHK for Sale", "REAL", "1"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("2 BHK for Sale", "REAL", "1"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("3 BHK for Sale", "REAL", "1"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("4 BHK for Sale", "REAL", "1"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("1 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("2 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("3 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("4 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("2 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("2 BHK Apartment for Rent", "REAL", "2"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Land For Sale", "REAL", "6"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("North Indian Roommate required", "REAL", "7"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Tamil Roommate required", "REAL", "7"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Kannada Roommate required", "REAL", "7"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Telugu Roommate required", "REAL", "7"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Bengali Roommate required", "REAL", "7"));
		SearchKeyword_Inputs.add(new SearchKeyword_Input("Hindi Roommate required", "REAL", "7"));
		
		return SearchKeyword_Inputs;
	}
}


class SearchKeyword_Input{
	public String keyword;
	public String category;
	public String sub_category;
	public SearchKeyword_Input(String keyword, String category, String sub_category){
		this.keyword = keyword;
		this.category = category;
		this.sub_category = sub_category;
	}
}

