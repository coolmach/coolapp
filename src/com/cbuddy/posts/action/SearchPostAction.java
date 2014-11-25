package com.cbuddy.posts.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.SearchKeywords;
import com.cbuddy.posts.model.MiniPostDetails;
import com.cbuddy.util.AutoSuggestKeywordsService;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.LogUtil;
import com.cbuddy.util.Utils;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class SearchPostAction extends ActionSupport implements ModelDriven<MiniPostDetails>{
	private static final long serialVersionUID = 12L;
	MiniPostDetails postDetails = new MiniPostDetails();
	List<MiniPostDetails> postsList = new ArrayList<MiniPostDetails>();
	private String searchKeyword;
	private String actionName;
	private static String POST_INDEX_BASE_FOLDER_PATH = "C:\\Shiva\\indexes\\posts\\";
	private static String POSTS_INDEX = POST_INDEX_BASE_FOLDER_PATH + "post-indexes";
	public String getAdListForSearch(){
		
		matchKeywordIfManuallyEntered();

		//If it belongs to a specific category, take them to that specific category list screen, rather than a generic screen
		String category = postDetails.getCategory();
		String subcategory = postDetails.getSubcategory();

		if(category != null && !category.equals("-1")){
			if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE)){
				actionName = "realestate";
			}else if(category.equals(CBuddyConstants.CATEGORY_AUTOMOBILES)){
				actionName = "automobile";
			}else if(category.equals(CBuddyConstants.CATEGORY_COMPUTERS)){
				actionName = "computers";
			}else if(category.equals(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD)){
				if(subcategory != null){
					if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_AIRCOOLER)){
						actionName = "airCooler";
					}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_CAMERA)){
						actionName = "camera";
					}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_DVD_MUSIC_PLAYER)){
						actionName = "dvd";
					}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_FRIDGE)){
						actionName = "fridge";
					}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_TELEVISION)){
						actionName = "television";
					}else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_WASHINGMACHINE)){
						actionName = "washingMachine";
					}
				}
			}else if(category.equals(CBuddyConstants.CATEGORY_FURNITURE)){
				actionName = "furniture";
			}else if(category.equals(CBuddyConstants.CATEGORY_MOBILE)){
				actionName = "mobiles";
			}
			if(actionName != null){
				return "redirect_to_a_category_action";
			}
		}
		
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		Directory index = null;
		int hitsPerPage = 10;
		
		try {
			Query q = formQuery(analyzer);
			index = FSDirectory.open(new File(POSTS_INDEX));
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
			TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
			searcher.search(q, collector);
			ScoreDoc[] hits = collector.topDocs().scoreDocs;

			System.out.println("Found " + hits.length + " hits.");
			LogUtil.getInstance().info(">>> Found " + hits.length + " hits.");

			populateSearchResults(hits, searcher);

			reader.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.SUCCESS;
	}	

	private void matchKeywordIfManuallyEntered(){
		/* Even if the user has manually entered the keyword (not selected from the autocomplete list), we have
		 * to check if it matches with a pre-defined keyword.
		 * If so, get the pre-defined keyword and it's attributes and then continue the search.
		 */
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		try {
			List<SearchKeywords> keywordsList = new AutoSuggestKeywordsService().getList(dbSession, searchKeyword);
			if(keywordsList != null){
				SearchKeywords topKeyword = null;
				float topScore = 0;
				for(SearchKeywords keyword:keywordsList){
					if(keyword.getMatchscore() > topScore){
						topScore = keyword.getMatchscore();
						topKeyword = keyword;
					}
				}
				
				/* Some Dirty Logic - START
				 * If input search sentence contains the letter "in" before the last word, then the last word most probably denotes the location.
				 * That is, the user is specifically searching for the location.
				 * That means that though matching score is good, the locations should match.
				 * E.g. If user enters manually "1 BHK for sale in Agara", then even though the matching score is > 1 for the DB keyword "1 BHK for Sale in Marathalli",
				 * we should not consider this result, as the location is not the same. 
				 */
				String location = null;
				String[] tokens = searchKeyword.split(" ");
				int noOfWords = tokens.length;
				if(noOfWords > 2){
					if(tokens[noOfWords - 2].equalsIgnoreCase("in")){
						location = tokens[noOfWords - 1]; //The last word in the search keyword sentence.
						//Get Location Code
						location = LocationUtil.getLocationCode(dbSession, location);
					}
				}
				if(topScore > 1.0){
					if(location != null){
						postDetails.setLocation(location);
						if(location.equals(topKeyword.getLocation())){
							postDetails.setCategory(topKeyword.getCategory());
							postDetails.setSubcategory(topKeyword.getSubcategory());
							postDetails.setCity(topKeyword.getCity());
						}
					}else{
						postDetails.setCategory(topKeyword.getCategory());
						postDetails.setSubcategory(topKeyword.getSubcategory());
						postDetails.setCity(topKeyword.getCity());
						postDetails.setLocation(topKeyword.getLocation());
					}
				}
				/* Some Dirty Logic - END */
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		SearchPostAction postAction = new SearchPostAction();
		postAction.searchKeyword = "Samsung";
		postAction.getAdListForSearch();	
	}
	
	private Query formQuery(StandardAnalyzer analyzer)
			throws ParseException{
		BooleanQuery booleanQuery = new BooleanQuery();
		Query query1 = new QueryParser(Version.LUCENE_44, "description_full", analyzer).parse(searchKeyword + "*");
		booleanQuery.add(query1, Occur.MUST);
		
		Query query2 = new QueryParser(Version.LUCENE_44, "title", analyzer).parse(searchKeyword);
		query2.setBoost(5);
		booleanQuery.add(query2, Occur.SHOULD);
		
		String city = postDetails.getCity();
		if(city!= null && !city.trim().equals("-1")){
			TermQuery termQuery = new TermQuery(new Term("city", city));
			booleanQuery.add(termQuery, Occur.MUST);
		}
		String location = postDetails.getLocation();
		if(location != null && !location.trim().equals("-1")){
			TermQuery termQuery = new TermQuery(new Term("location", location));
			booleanQuery.add(termQuery, Occur.MUST);
		}
		String category = postDetails.getCategory();
		if(category != null && !category.trim().equals("-1")){
			TermQuery termQuery = new TermQuery(new Term("category", category));
			booleanQuery.add(termQuery, Occur.MUST);
		}
		String subcategory = postDetails.getSubcategory();
		if(subcategory != null && !subcategory.trim().equals("-1")){
			TermQuery termQuery = new TermQuery(new Term("subcategory", subcategory));
			booleanQuery.add(termQuery, Occur.MUST);
		}
		String company = postDetails.getCorpId();
		if(company != null && !company.trim().equals("-1")){
			TermQuery termQuery = new TermQuery(new Term("company", company));
			booleanQuery.add(termQuery, Occur.MUST);
		}
		return booleanQuery;
	}

	private void populateSearchResults(ScoreDoc[] hits, IndexSearcher searcher)
			throws IOException {
		for(int i=0; i<hits.length; ++i) {
			int docId = hits[i].doc;
			Document d = searcher.doc(docId);
			MiniPostDetails miniPostDetails = new MiniPostDetails();

			miniPostDetails.setPostId(Integer.parseInt(d.get("postId")));
			miniPostDetails.setCategory(d.get("category"));
			miniPostDetails.setSubcategory(d.get("subcategory"));
			miniPostDetails.setSubcategoryStr(new Utils().getSubCategoryDesc(miniPostDetails.getCategory(), miniPostDetails.getSubcategory()));
			miniPostDetails.setCity(d.get("city"));
			miniPostDetails.setLocation(d.get("location"));
			miniPostDetails.setCityName(d.get("cityName"));
			miniPostDetails.setLocationName(d.get("locationName"));
			miniPostDetails.setTitle(d.get("title"));
			miniPostDetails.setPrice(Double.parseDouble(d.get("price")));
			miniPostDetails.setDescription_generic(d.get("description_general"));
			miniPostDetails.setDescription_specific(d.get("description_specific"));
			miniPostDetails.setDescription_full(d.get("description_full"));
			miniPostDetails.setNoOfImages(Integer.parseInt(d.get("no_of_images")));
			miniPostDetails.setImageFileName(d.get("image_file_name"));

			miniPostDetails.setUrlForAdDetails(Utils.getAdDetailsUrl(miniPostDetails.getCategory(), miniPostDetails.getSubcategory()));
			
			System.out.println(miniPostDetails);
			
			postsList.add(miniPostDetails);
		}
	}

	@Override
	public MiniPostDetails getModel() {
		return postDetails;
	}


	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public List<MiniPostDetails> getPostsList() {
		return postsList;
	}

	public void setPostsList(List<MiniPostDetails> postsList) {
		this.postsList = postsList;
	}

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}
}
