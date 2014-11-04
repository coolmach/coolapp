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

import com.cbuddy.beans.SearchKeywords;

public class KeywordIndexCreator{
	private static KeywordIndexCreator instance = null;
	private static boolean hasIndexesBeenCreated = false;
	private KeywordIndexCreator(){}
	public static KeywordIndexCreator getInstance(){
		if(instance == null){
			instance = new KeywordIndexCreator();
		}
		return instance;
	}
	public boolean indexKeywords(Session session){
		boolean executionSuccessful = true;
		try{
			if(!hasIndexesBeenCreated){
				//Indexes to be created only once
				createIndexes(session);
				hasIndexesBeenCreated = true;
			}
		}catch(Exception e){
			executionSuccessful = false;
			e.printStackTrace();
		}
		return executionSuccessful;
	}
	private List<SearchKeywords> getKeywordsList(Session session){
		String queryString = "from SearchKeywords";
		Query query = session.createQuery(queryString);
		List<SearchKeywords> keywordsList = query.list();
		return keywordsList;
	}

	private void indexKeyword(IndexWriter w, SearchKeywords keyword) throws IOException{
		Document doc = new Document();
		doc.add(new TextField("keyword", keyword.getKeyword(), Field.Store.YES));
		doc.add(new StringField("category", keyword.getCategory(), Field.Store.YES));
		doc.add(new StringField("subcategory", keyword.getCategory(), Field.Store.YES));
		w.addDocument(doc);
	}

	private void createIndexes(Session session) throws IOException, ParseException {
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
		
		
		System.out.println(">>> Keyword Indexing complete");
	}
}
