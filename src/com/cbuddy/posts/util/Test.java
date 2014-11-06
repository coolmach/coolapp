package com.cbuddy.posts.util;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.PhraseQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopScoreDocCollector;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

public class Test {
	public static void main(String[] args)throws IOException, ParseException{
		createIndex();
		String keyword = "micro*";
		String city = "BLR";
		queryIndex(keyword,city);
	}	
	public static void createIndex()
	throws IOException{
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_44, analyzer);
		Directory dir = FSDirectory.open(new File("E:\\index"));
		IndexWriter writer = new IndexWriter(dir, config);
		writer.deleteAll();
		addDocuments(writer);
		writer.close();
	}
	private static Query createQuery(String keyword, String city)
			throws ParseException{
		return createQuery2(keyword, city);
	}
	
	private static Query createQuery2(String keyword, String city)
	throws ParseException{
		StandardAnalyzer analyzer = new StandardAnalyzer(Version.LUCENE_44);
		QueryParser queryParser = new QueryParser(Version.LUCENE_44, "title", analyzer);
		Query query = queryParser.parse(keyword);
		BooleanQuery booleanQuery = new BooleanQuery();
		booleanQuery.add(query, Occur.MUST);
		TermQuery termQuery = new TermQuery(new Term("city", city));
		termQuery.setBoost(5);
		booleanQuery.add(termQuery, Occur.SHOULD);
		return booleanQuery;
	}
	public static void queryIndex(String keyword, String city)
	throws IOException, ParseException{
		Query query = createQuery(keyword, city);
		Directory dir = FSDirectory.open(new File("E:\\index"));
		IndexReader reader = DirectoryReader.open(dir);
		IndexSearcher searcher = new IndexSearcher(reader);
		TopScoreDocCollector collector = TopScoreDocCollector.create(10, true);
		searcher.search(query, collector);
		
		ScoreDoc[] hits = collector.topDocs().scoreDocs;
		for(ScoreDoc scoreDoc:hits){
			int docId = scoreDoc.doc;
			Document doc = searcher.doc(docId);
			System.out.println(scoreDoc.score + " - " + doc.get("city") + "- " + doc.get("title"));
		}
		System.out.println("Hits: " + hits.length);
		reader.close();
	}
	private static void addDocument(IndexWriter writer, String str, String city)
	throws IOException{
		Document document = new Document();
		document.add(new TextField("title", str, Field.Store.YES));
		document.add(new StringField("city", city, Field.Store.YES));
		writer.addDocument(document);
	}
	private static void addDocuments(IndexWriter writer)
	throws IOException{
		addDocument(writer, "Sony Xperia Z1 - White, New Condition with Charger only","BLR");
		addDocument(writer, "HTC One X+ Mint condition","BLR");
		addDocument(writer, "Iphone 6 High Copy 1:1 Usa Import @ lowest Price in the","BLR");
		addDocument(writer, "Micromax canvas A110 under warranty on sale","BLR");
		addDocument(writer, "3 months Old Lenovo P780 with Box and Bill","BLR");
		addDocument(writer, "5 months old micromax unite 2 A106","BLR");
		addDocument(writer, "A gifted xperia phone for urgent sale","BLR");
		addDocument(writer, "10 month old micromax canvas 2 plus fully working condi","BLR");
		addDocument(writer, "apple IPhone 6 clone copy made in Korea","BLR");
		addDocument(writer, "Sony xperia Tippo single sim for sale just 2999","BLR");
		addDocument(writer, "no kya 7610 SALE Good Condition","BLR");
		addDocument(writer, "Micromax unite 2 A106 Just 20 days old with excellent c","BLR");
		addDocument(writer, "Isamsara galaxy s3","BLR");
		addDocument(writer, "lg optimus one p500 android smartphone","BLR");
		addDocument(writer, "Samsung galaxy s3 I9300 6 months old","CHE");
		addDocument(writer, "Xiaomi Redmi 1s for sale or exchange with high end","CHE");
		addDocument(writer, "Micromax Canvas Elanza 1 month old mobile for sale in B","CHE");
		addDocument(writer, "iphone 4 16gb ... worth buying","CHE");
		addDocument(writer, "Micromax Bolt A62 in excellent condition","CHE");
		addDocument(writer, "samsung galaxy s3","CHE");
		addDocument(writer, "samsung galaxy ace for sale just 3months used","CHE");
		addDocument(writer, "hi I want to sell my Samsung note","CHE");
		addDocument(writer, "samsung s dous 2","CHE");
		addDocument(writer, "Samsung galaxy trend for sale","CHE");
		addDocument(writer, "Brand New Xiaomi RedMi 1S unopened and sealed box","CHE");
		addDocument(writer, "nokia lumia 620 good","CHE");
		addDocument(writer, "xolo a500s, 4'' display, 512 ram, 4 gb internal android ","CHE");

	}
}
