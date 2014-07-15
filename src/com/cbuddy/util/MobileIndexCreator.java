package com.cbuddy.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Query;
import org.hibernate.Session;

import com.cbuddy.beans.MobileMaster;

public class MobileIndexCreator{
	private static MobileIndexCreator instance = null;
	private MobileIndexCreator(){}
	public static MobileIndexCreator getInstance(){
		if(instance == null){
			instance = new MobileIndexCreator();
		}
		return instance;
	}
	public boolean indexMobileModels(Session session){
		boolean executionSuccessful = false;
		try{
			createIndexes(session);
			executionSuccessful = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return executionSuccessful;
	}
	private List<MobileMaster> getMobileModels(Session session){
		String queryString = "from MobileMaster";
		Query query = session.createQuery(queryString);
		List<MobileMaster> modelsList = query.list();
		return modelsList;
	}

	private void indexModel(IndexWriter w, MobileMaster modelDetails) throws IOException{
		Document doc = new Document();
		doc.add(new TextField("brand", modelDetails.getBrand(), Field.Store.YES));
		doc.add(new TextField("model", modelDetails.getModel(), Field.Store.YES));
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


		String fileName = "mobile-models-index";
		File outputFile = new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName);
		index = FSDirectory.open(outputFile);
		config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
		w = new IndexWriter(index, config);
		w.deleteAll();

		List<MobileMaster> modelsList = getMobileModels(session);
		for(MobileMaster modelDetails:modelsList){
			indexModel(w, modelDetails);
		}
		w.close();

	}
}
