package com.cbuddy.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Session;

import com.cbuddy.beans.Corp;

public class AutoSuggestCorporateService{

	public List<Corp> getList(Session session, String searchString){
		List<Corp> corporatesList = null;
		try{
			corporatesList = getAutoSuggestList(session, searchString);
		}catch(IOException e){
			e.printStackTrace();
		}
		return corporatesList;
	}
	
	public List<Corp> getAutoSuggestList(Session session, String searchString) throws IOException{

		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		
		String fileName = "corporate-index";
		
		//String fileName = "BLR-location-index";
		
		Directory index = FSDirectory.open(new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName));
		String querystr = searchString;
		querystr = querystr + "*"; //Begins-with search
		int hitsPerPage = 10;
		org.apache.lucene.search.Query q = null;
		
		List<Corp> corporatesList = new ArrayList<Corp>();
		
		try {
			q = new QueryParser(Version.LUCENE_44, "name", analyzer).parse(querystr);
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
			TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
			searcher.search(q, collector);
			ScoreDoc[] hits = collector.topDocs().scoreDocs;

			// 4. display results
			System.out.println("Found " + hits.length + " hits.");
			
			for(int i=0; i<hits.length; ++i) {
				int docId = hits[i].doc;
				Document d = searcher.doc(docId);
				Corp corp = new Corp();
				corp.setCorpShortName(d.get("shortName"));
				corp.setCorpName(d.get("name"));
				corp.setCorpId(Integer.valueOf(d.get("id")));
				System.out.println((i + 1) + ". " + d.get("id") + "\t" + d.get("name"));
				corporatesList.add(corp);
			}

			// reader can only be closed when there
			// is no need to access the documents any more.
			reader.close();

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return corporatesList;
	}
}
