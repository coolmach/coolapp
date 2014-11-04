package com.cbuddy.posts.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.CommonDetailsForPost;
import com.cbuddy.posts.model.MiniPostDetails;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;
import com.cbuddy.util.LocationUtil;
import com.cbuddy.util.LogUtil;

public class Testing {
	private static String POST_INDEX_BASE_FOLDER_PATH = "C:\\Shiva\\indexes\\posts\\";
	private static String POSTS_INDEX = POST_INDEX_BASE_FOLDER_PATH + "post-indexes";
	public static void addIndex(Session session, Poit poit, CommonDetailsForPost postDetails, IndexWriter w){
		try{
			String description_specific = postDetails.generateIndexableString(session);
			System.out.println(description_specific);
			Document doc = new Document();
			doc.add(new TextField("category", poit.getCategory(), Field.Store.YES));
			doc.add(new StringField("subcategory", poit.getCategory(), Field.Store.YES));
			doc.add(new StringField("city", poit.getCity(), Field.Store.YES));
			doc.add(new StringField("location", LocationUtil.getCityName(session, poit.getCity()), Field.Store.YES));
			doc.add(new StringField("title", poit.getTitle(), Field.Store.YES));
			if(poit.getDescription() != null){
				doc.add(new TextField("description_general", poit.getDescription(), Field.Store.YES));	
			}
			doc.add(new TextField("description_specific", description_specific, Field.Store.YES));
			doc.add(new TextField("description_full", poit.getTitle() + " " + poit.getDescription() + " " + description_specific, Field.Store.YES));
			doc.add(new TextField("price", String.valueOf(poit.getPrice()), Field.Store.YES));
			
			System.out.println(" Create Index: " + description_specific + " :: " + poit.getDescription() );
			
			w.addDocument(doc);

		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	private static Query createQuery(Session dbSession, int postId, String category, String subcategory){
		String query = "from Pdau where postId = :postId";
		String tableName = null;
		if(category.equals(CBuddyConstants.CATEGORY_REAL_ESTATE)){
			tableName = "Pdre";
		}else if(category.equals(CBuddyConstants.CATEGORY_AUTOMOBILES)){
			tableName = "Pdau";
		}else if(category.equals(CBuddyConstants.CATEGORY_COMPUTERS)){
			tableName = "Pcomp";
		}else if(category.equals(CBuddyConstants.CATEGORY_MOBILE)){
			tableName  = "Pdmo";
		}else if(category.equals(CBuddyConstants.CATEGORY_ELECTRONICS_AND_HOUSEHOLD)){
			if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_AIRCOOLER)){tableName = "PAirCooler";}
			else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_CAMERA)){tableName = "PCamera";}
			else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_DVD_MUSIC_PLAYER)){tableName = "PDVD";}
			else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_FRIDGE)){tableName = "PFridge";}
			else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_TELEVISION)){tableName = "PTelevision";}
			else if(subcategory.equals(CBuddyConstants.SUBCATEGORY_ELECTRONICS_AND_HOUSEHOLD_WASHINGMACHINE)){tableName = "PWashingMachine";}
		}else if(category.equals(CBuddyConstants.CATEGORY_FURNITURE)){
			tableName = "PFurniture";
		}
		query = "from " + tableName + " where postId = :postId";
		Query q = dbSession.createQuery(query);
		q.setParameter("postId", postId);
		return q;
	}

	public static void initIndex(Session dbSession){
		String query = "from Poit";
		Query q = dbSession.createQuery(query);
		List<Poit> poitList = q.list();
		IndexWriter w = null;
		try{
			StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
			Directory index = FSDirectory.open(new File(POSTS_INDEX));
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
			w = new IndexWriter(index, config);
			w.deleteAll();

			for(Poit poit:poitList){
				Query q2 = createQuery(dbSession, poit.getPostId(), poit.getCategory(), poit.getSubCategory());
				
				q2.setParameter("postId", poit.getPostId());
				List<CommonDetailsForPost> postsList = (List<CommonDetailsForPost>)q2.list();
				if(postsList.size() == 1){
					addIndex(dbSession, poit, postsList.get(0), w);
				}
			}
			w.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(w != null){
				try{
					w.close();
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		System.out.println("Index");
	}
	
	public static List<MiniPostDetails> getPosts(Session dbSession,String searchString){
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);



		Directory index = null;
		String querystr = searchString;
		querystr = querystr + "*"; //Keyword can be in any part of the document
		int hitsPerPage = 10;

		org.apache.lucene.search.Query q = null;
		List<MiniPostDetails> postsList = new ArrayList<MiniPostDetails>();
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

				postDetails.setCategory(d.get("category"));
				postDetails.setSubcategory(d.get("subcategory"));
				postDetails.setCity(d.get("city"));
				postDetails.setLocation(d.get("location"));
				postDetails.setTitle(d.get("title"));
				postDetails.setPrice(Double.parseDouble(d.get("price")));
				postDetails.setDescription_generic(d.get("description_generic"));
				postDetails.setDescription_specific(d.get("description_specific"));
				postDetails.setDescription_full(d.get("description_full"));
				postsList.add(postDetails);
			}

			// reader can only be closed when there
			// is no need to access the documents any more.
			reader.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return postsList;
	}
	
	public static void main(String[] args){
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		String searchString = "5 BHK";
		//initIndex(dbSession);
		System.out.println("**********************************************");
		List<MiniPostDetails> postsList = getPosts(dbSession, searchString);
		for(MiniPostDetails postDetail:postsList){
			System.out.println(postDetail.getDescription_full());
		}
	}

}
