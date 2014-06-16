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

import com.cbuddy.beans.Location;

public class AutoSuggestLocationService{

	public List<Location> process(Session session, String city, String term) throws IOException{
		LocationIndexCreator.getInstance().indexAllLocations(session);
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		Directory index = FSDirectory.open(new File(city + "-location-index"));
		String querystr = term;
		querystr = querystr + "*"; //Begins-with search
		int hitsPerPage = 10;
		org.apache.lucene.search.Query q = null;
		
		List<Location> locationList = new ArrayList<Location>();
		
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
				Location location = new Location();
				location.setLocCode(d.get("code"));
				location.setLocName(d.get("name"));
				System.out.println((i + 1) + ". " + d.get("code") + "\t" + d.get("name"));
				locationList.add(location);
			}

			// reader can only be closed when there
			// is no need to access the documents any more.
			reader.close();

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return locationList;
	}
}
