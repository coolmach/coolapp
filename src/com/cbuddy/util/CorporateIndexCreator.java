package com.cbuddy.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Query;
import org.hibernate.Session;

import com.cbuddy.beans.Corp;

public class CorporateIndexCreator{
	private static CorporateIndexCreator instance = null;
	private CorporateIndexCreator(){}
	public static CorporateIndexCreator getInstance(){
		if(instance == null){
			instance = new CorporateIndexCreator();
		}
		return instance;
	}
	public boolean indexCorporates(Session session){
		boolean executionSuccessful = false;
		try{
			createIndexes(session);
			executionSuccessful = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return executionSuccessful;
	}
	private List<Corp> getCorporateList(Session session){
		String queryString = "from Corp";
		Query query = session.createQuery(queryString);
		List<Corp> corporates = query.list();
		return corporates;
	}

	private void indexCorporate(IndexWriter w, Corp corp) throws IOException{
		Document doc = new Document();
		doc.add(new IntField("id", corp.getCorpId(), Field.Store.YES));
		doc.add(new TextField("name", corp.getCorpName(), Field.Store.YES));
		doc.add(new TextField("shortName", corp.getCorpShortName(), Field.Store.YES));
		w.addDocument(doc);
	}

	private void createIndexes(Session session) throws IOException, ParseException {
		// 0. Specify the analyzer for tokenizing text.
		//    The same analyzer should be used for indexing and searching
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);

		// 1. create the index

		Directory index = null;
		IndexWriterConfig config = null;
		IndexWriter w = null;


		String fileName = "corporate-index";
		File outputFile = new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName);
		index = FSDirectory.open(outputFile);
		config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
		w = new IndexWriter(index, config);
		w.deleteAll();

		List<Corp> corporatesList = getCorporateList(session);
		for(Corp corp:corporatesList){
			indexCorporate(w, corp);
		}
		w.close();

	}
}
