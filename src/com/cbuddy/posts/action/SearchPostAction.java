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

import com.cbuddy.posts.model.MiniPostDetails;
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
	private static String POST_INDEX_BASE_FOLDER_PATH = "C:\\Shiva\\indexes\\posts\\";
	private static String POSTS_INDEX = POST_INDEX_BASE_FOLDER_PATH + "post-indexes";
	public String getAdListForSearch(){
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
}
