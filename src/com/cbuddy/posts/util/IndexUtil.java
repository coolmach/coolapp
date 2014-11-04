package com.cbuddy.posts.util;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.hibernate.Session;

import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.CommonDetailsForPost;
import com.cbuddy.util.LocationUtil;

public class IndexUtil {
	private static String POST_INDEX_BASE_FOLDER_PATH = "C:\\Shiva\\indexes\\posts\\";
	private static String POSTS_INDEX = POST_INDEX_BASE_FOLDER_PATH + "post-indexes";

	public static void addIndex(Session session, Poit poit, CommonDetailsForPost postDetails){
		IndexWriter w=null;
		try{
			StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
			Directory index = FSDirectory.open(new File(POSTS_INDEX));
			IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
			w = new IndexWriter(index, config);

			String description_specific = postDetails.generateIndexableString(session);
			System.out.println(description_specific);
			Document doc = new Document();
			doc.add(new TextField("category", poit.getCategory(), Field.Store.YES));
			doc.add(new StringField("subcategory", poit.getCategory(), Field.Store.YES));
			doc.add(new StringField("city", poit.getCity(), Field.Store.YES));
			doc.add(new StringField("location", LocationUtil.getCityName(session, poit.getCity()), Field.Store.YES));
			doc.add(new StringField("title", poit.getTitle(), Field.Store.YES));
			doc.add(new TextField("description_general", poit.getDescription(), Field.Store.YES));
			doc.add(new TextField("description_specific", description_specific, Field.Store.YES));
			doc.add(new TextField("description_full", poit.getDescription() + " " + description_specific, Field.Store.YES));
			doc.add(new TextField("price", String.valueOf(poit.getPrice()), Field.Store.YES));
			w.addDocument(doc);

		}catch(IOException e){
			e.printStackTrace();
		}finally{
			if(w == null){
				try {
					w.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	
}
