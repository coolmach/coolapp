package com.cbuddy.posts.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
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

		String querystr = searchKeyword;
		querystr = querystr + "*"; //Keyword can be in any part of the document
		int hitsPerPage = 10;

		org.apache.lucene.search.Query q = null;
		
		try {
			index = FSDirectory.open(new File(POSTS_INDEX));
			q = new QueryParser(Version.LUCENE_44, "description_full", analyzer).parse(querystr);
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
			TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
			searcher.search(q, collector);
			ScoreDoc[] hits = collector.topDocs().scoreDocs;
			
			System.out.println("Found " + hits.length + " hits.");
			LogUtil.getInstance().info(">>> Found " + hits.length + " hits.");

			for(int i=0; i<hits.length; ++i) {
				int docId = hits[i].doc;
				Document d = searcher.doc(docId);
				MiniPostDetails postDetails = new MiniPostDetails();

				postDetails.setPostId(Integer.parseInt(d.get("postId")));
				postDetails.setCategory(d.get("category"));
				postDetails.setSubcategory(d.get("subcategory"));
				postDetails.setSubcategoryStr(new Utils().getSubCategoryDesc(postDetails.getCategory(), postDetails.getSubcategory()));
				postDetails.setCity(d.get("city"));
				postDetails.setLocation(d.get("location"));
				postDetails.setTitle(d.get("title"));
				postDetails.setPrice(Double.parseDouble(d.get("price")));
				postDetails.setDescription_generic(d.get("description_generic"));
				postDetails.setDescription_specific(d.get("description_specific"));
				postDetails.setDescription_full(d.get("description_full"));
				postDetails.setNoOfImages(Integer.parseInt(d.get("no_of_images")));
				postDetails.setImageFileName(d.get("image_file_name"));
				
				postDetails.setUrlForAdDetails(Utils.getAdDetailsUrl(postDetails.getCategory(), postDetails.getSubcategory()));

				postsList.add(postDetails);
			}

			// reader can only be closed when there
			// is no need to access the documents any more.
			reader.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return Action.SUCCESS;
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
