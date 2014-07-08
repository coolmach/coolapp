package com.cbuddy.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.core.SimpleAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Session;

import com.cbuddy.beans.MobileMaster;

public class AutoSuggestMobileService{

	public List<MobileMaster> autopopulateModels(Session session, String modelSearchStr, String brand){

		List<MobileMaster> modelsList = new ArrayList<MobileMaster>();
		LogUtil.getInstance().info("AutoSuggestMobileService.autoPopulateModels(): Brand: " + brand + ", modelSearchStr: " + modelSearchStr);
		try{
			String fileName = "mobile-models-index";
			Directory index = FSDirectory.open(new File(CBuddyConstants.BASE_FOLDER_NAME_INDEX, fileName));
			IndexReader reader = DirectoryReader.open(index);
			IndexSearcher searcher = new IndexSearcher(reader);
//			Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);

			QueryParser queryParser = new QueryParser(Version.LUCENE_44, "modelName", new SimpleAnalyzer(Version.LUCENE_44));

			Query query = queryParser.parse("brand:" + brand + " AND modelName:" + modelSearchStr + "*");
			TopDocs topDocs = searcher.search(query, 10);
			ScoreDoc[] hits = topDocs.scoreDocs;
			LogUtil.getInstance().info("Search Results: " + hits.length);
			for (ScoreDoc scoreDoc:hits) {
				int docId = scoreDoc.doc;
				Document document = searcher.doc(docId);
				MobileMaster modelDetails = new MobileMaster();
				modelDetails.setModel(document.get("model"));
				modelDetails.setModelName(document.get("modelName"));
				modelsList.add(modelDetails);
			}
		}catch (ParseException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return modelsList;
	}
}
