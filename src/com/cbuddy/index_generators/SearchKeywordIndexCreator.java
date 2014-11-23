package com.cbuddy.index_generators;

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
import org.hibernate.SessionFactory;

import com.cbuddy.beans.SearchKeywords;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.CbuddySessionFactory;

public class SearchKeywordIndexCreator{
	private SearchKeywordIndexCreator(){}
	public static void main(String[] args) throws IOException, ParseException{
		SessionFactory sessionFactory = CbuddySessionFactory.getSessionFactory();
		Session dbSession = sessionFactory.openSession();
		createIndexes(dbSession);
		dbSession.close();
		System.out.println(">>> Keyword Indexing complete...");
	}
	public static boolean indexKeywords(Session session){
		boolean executionSuccessful = true;
		try{
			createIndexes(session);
		}catch(Exception e){
			executionSuccessful = false;
			e.printStackTrace();
		}
		return executionSuccessful;
	}
	private static List<SearchKeywords> getKeywordsList(Session session){
		String queryString = "from SearchKeywords";
		Query query = session.createQuery(queryString);
		List<SearchKeywords> keywordsList = query.list();
		return keywordsList;
	}

	private static void indexKeyword(IndexWriter w, SearchKeywords keyword) throws IOException{
		Document doc = new Document();
		doc.add(new TextField("keyword", keyword.getKeyword(), Field.Store.YES));
		doc.add(new StringField("category", keyword.getCategory(), Field.Store.YES));
		doc.add(new StringField("subcategory", keyword.getSubcategory(), Field.Store.YES));
		doc.add(new StringField("city", keyword.getCity(), Field.Store.YES));
		doc.add(new StringField("location", keyword.getLocation(), Field.Store.YES));
		w.addDocument(doc);
	}

	private static void createIndexes(Session session) throws IOException, ParseException {
		// 0. Specify the analyzer for tokenizing text.
		//    The same analyzer should be used for indexing and searching
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		
		String fileName = "keywords-index"; 
				
		Directory index = FSDirectory.open(new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName));
		IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
		IndexWriter w = new IndexWriter(index, config);
		w.deleteAll();
		List<SearchKeywords> keywordsList = getKeywordsList(session);
		for(SearchKeywords keyword:keywordsList){
			indexKeyword(w, keyword);
		}
		w.close();
		
		
		
	}
}
