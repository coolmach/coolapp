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

import com.cbuddy.beans.SearchKeywords;

public class AutoSuggestKeywordsService{

	public List<SearchKeywords> getList(Session session, String searchString) throws IOException{
		KeywordIndexCreator.getInstance().indexKeywords(session);
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		
		LogUtil.getInstance().info(">>> AutoSuggestKeywordsService.getList() - ENTER");
		LogUtil.getInstance().info(">>> AutoSuggestKeywordsService.getList() - searchString: " + searchString);
		
		String fileName = "keywords-index";
		
		Directory index = FSDirectory.open(new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName));
		String querystr = searchString;
		querystr = querystr + "*"; //Keyword can be in any part of the document
		int hitsPerPage = 10;
		org.apache.lucene.search.Query q = null;
		
		List<SearchKeywords> keywordsList = new ArrayList<SearchKeywords>();
		
		try {
			q = new QueryParser(Version.LUCENE_44, "keyword", analyzer).parse(querystr);
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
			TopScoreDocCollector collector = TopScoreDocCollector.create(hitsPerPage, true);
			searcher.search(q, collector);
			ScoreDoc[] hits = collector.topDocs().scoreDocs;

			// 4. display results
			System.out.println("Found " + hits.length + " hits.");
			LogUtil.getInstance().info(">>> Found " + hits.length + " hits.");
			
			for(int i=0; i<hits.length; ++i) {
				int docId = hits[i].doc;
				Document d = searcher.doc(docId);
				SearchKeywords keyword = new SearchKeywords();
				
				keyword.setKeyword(d.get("keyword"));
				keyword.setCategory(d.get("category"));
				keyword.setSubcategory(d.get("subcategory"));
				
				System.out.println((i + 1) + ". " + keyword);
				LogUtil.getInstance().info(">>> " + (i + 1) + ". " + keyword);
				keywordsList.add(keyword);
			}

			// reader can only be closed when there
			// is no need to access the documents any more.
			reader.close();

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return keywordsList;
	}
}
