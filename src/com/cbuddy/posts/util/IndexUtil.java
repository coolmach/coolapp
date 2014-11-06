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
import com.cbuddy.util.Utils;

public class IndexUtil {
	private static String POST_INDEX_BASE_FOLDER_PATH = "C:\\Shiva\\indexes\\posts\\";
	private static String POSTS_INDEX = POST_INDEX_BASE_FOLDER_PATH + "post-indexes";

	public static void addIndex(Session session, Poit poit, CommonDetailsForPost postDetails){
		IndexWriter w=null;
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		Directory index = null;
		IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
		
		try{
			index = FSDirectory.open(new File(POSTS_INDEX));
			w = new IndexWriter(index, config);
			String description_specific = postDetails.generateIndexableString(session);
			String companyName = Utils.getCompanyName(poit.getCorpId());
			System.out.println(description_specific);
			Document doc = new Document();
			doc.add(new StringField("postId", String.valueOf(poit.getPostId()), Field.Store.YES));
			doc.add(new TextField("category", poit.getCategory(), Field.Store.YES));
			doc.add(new StringField("subcategory", poit.getSubCategory(), Field.Store.YES));
			doc.add(new StringField("city", poit.getCity(), Field.Store.YES));
			doc.add(new StringField("cityName", LocationUtil.getCityName(session, poit.getCity()), Field.Store.YES));
			if(poit.getLocation() != null){
				doc.add(new StringField("location", poit.getLocation(), Field.Store.YES));
				doc.add(new StringField("locationName", LocationUtil.getLocationName(session, poit.getCity(), poit.getLocation()), Field.Store.YES));
			}
			doc.add(new StringField("company", poit.getCorpId() + "", Field.Store.YES));
			if(companyName != null){
				doc.add(new StringField("companyName", companyName, Field.Store.YES));
			}
			
			doc.add(new TextField("title", poit.getTitle(), Field.Store.YES));
			if(poit.getDescription() != null){
				doc.add(new TextField("description_general", poit.getDescription(), Field.Store.YES));	
			}
			doc.add(new TextField("description_specific", description_specific, Field.Store.YES));
			doc.add(new TextField("description_full", poit.getTitle() + " " + poit.getDescription() + " " + companyName + " " + description_specific, Field.Store.YES));
			doc.add(new TextField("price", String.valueOf(poit.getPrice()), Field.Store.YES));
			doc.add(new StringField("no_of_images", String.valueOf(poit.getNoOfImages()), Field.Store.YES));
			if(poit.getImageFileName() != null){
				doc.add(new StringField("image_file_name", poit.getImageFileName(), Field.Store.YES));
			}
			
			System.out.println(" Create Index: " + description_specific + " :: " + poit.getDescription() );
			w.addDocument(doc);

		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try{
				if(w != null){
					w.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	
}
