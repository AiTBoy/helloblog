package tools;

import com.helloblog.domain.Article;
import org.apache.commons.io.FileUtils;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.*;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class LuceneTools {

    //获取索引存储目录
    public static Directory getIndexDirectory(String path){
        Directory   directory   = null; //索引存储目录
        try {
            directory = FSDirectory.open(new File(path).toPath()); //索引保存在磁盘上的位置
        } catch (IOException e) {
            e.printStackTrace();
        }
        return directory;
    }

    //写入索引文件流(用于创建索引文件)
    public static IndexWriter getIndexWriter(Directory directory){
        IndexWriter indexWriter = null;

        //StandardAnalyzer 索引分析器（支持中文）
        IndexWriterConfig config = new IndexWriterConfig(new StandardAnalyzer());
        try {
            indexWriter = new IndexWriter(directory,config); //创建索引流
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  indexWriter;
    }

    //获取索引文件流(用于读取索引文件)
    public static IndexReader getIndexReader(Directory directory){
        IndexReader indexReader = null;
        try {
            indexReader = DirectoryReader.open(directory); //打开索引目录
        } catch (IOException e) {
            e.printStackTrace();
        }
        return  indexReader;
    }

    //建立索引(为所有数据库中文章文件建立索引)
    public static void createIndexForArticles(List<Article> articles, String path) throws IOException {
        IndexWriter indexWriter = getIndexWriter(getIndexDirectory(path));

        try {
            for(Article article : articles){
                indexWriter.addDocument(getDocument(article));
            }
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(indexWriter != null){
                indexWriter.close();
            }
        }
    }

    public static Document getDocument(Article article){
        Document document = new Document();

        if(article.getArtid() != null)
            document.add(new StringField("artid",article.getArtid()+"", Field.Store.YES));
        if(article.getTitle() != null)
            document.add(new Field("title"  ,article.getTitle(),TextField.TYPE_STORED));
        if(article.getType() != null)
            document.add(new Field("type"   ,article.getType(), TextField.TYPE_STORED));
        if(article.getContent() != null)
            document.add(new Field("content",article.getContent(),TextField.TYPE_STORED));

        return  document;
    }


    /**
     * 索引维护相关
     * @param dir
     */
    //添加索引(文章索引)
    public static void addIndexDoc(String dir,Article article) throws IOException {
        IndexWriter indexWriter = getIndexWriter(getIndexDirectory(dir));
        try {
            indexWriter.addDocument(getDocument(article));
            System.out.println("====>成功为("+article.getTitle()+")添加索引");
        } catch (IOException e) {
            e.printStackTrace();
        }
        indexWriter.close();
    }

    //删除索引文件(根据artid删除索引)
    public static void deleteIndexDoc(String dir,Article article) throws IOException {
        IndexWriter indexWriter = getIndexWriter(getIndexDirectory(dir));
        try {
            System.out.println(article.getArtid()+"");
            indexWriter.deleteDocuments(new Term("artid",article.getArtid()+"")); //通过artid删除文章索引
            System.out.println("====>成功删除("+article.getArtid()+")  索引");
        } catch (IOException e) {
            e.printStackTrace();
        }
        indexWriter.close();
    }

    //更新索引
    public static void updateIndexDoc(String dir , Article article) throws IOException {
        IndexWriter indexWriter = getIndexWriter(getIndexDirectory(dir));
        Document document = getDocument(article);

        try {
            indexWriter.updateDocument(new Term("artid",document.get("artid")),document);
            System.out.println("====>成功更新("+article.getArtid()+")  索引");
        } catch (IOException e) {
            e.printStackTrace();
        }
        indexWriter.close();
    }

    //删除索引文件(删除整个index文件)
    public static void deleteIndex(String dir){
        try {
            FileUtils.deleteDirectory(new File(dir));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 索引检索相关
     */

    public static List<Article> searchByTitleOrTypeOrContent(String message,String method,String path) throws IOException, ParseException {
        IndexReader   indexReader   = getIndexReader(getIndexDirectory(path));
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);
        QueryParser   parser        = new QueryParser(method,new StandardAnalyzer());

        Query query = parser.parse(message); //要检索的信息

        TopDocs topDocs = indexSearcher.search(query,100);

        ScoreDoc[] scoreDocs = topDocs.scoreDocs;

        List<Article> result = new ArrayList<>(); //存储查询的结果

        System.out.println("根据-" + method + "-找到结果共"+scoreDocs.length);
        for(ScoreDoc sd : scoreDocs){
            int doc = sd.doc;
            Document document = indexSearcher.doc(doc);

            Article article = new Article();
            article.setArtid(Integer.parseInt(document.get("artid")));
            article.setTitle(document.get("title"));
            article.setType(document.get("type"));
            article.setContent(document.get("content"));

            result.add(article);

            System.out.println("find" + document.get("title") + "------" + document.get("type"));
        }

        indexReader.close();

        return result;
    }

    //综合查询
    public static List<Article> synthesizeSearch(String key , String path) throws IOException, ParseException {
        List<Article> result = new ArrayList<>();

        //关键字查找顺序 artid-->title-->type-->content
        List<Article> a1,a2,a3,a4;

        a1 = LuceneTools.searchByTitleOrTypeOrContent(key,"artid",path);
        a2 = LuceneTools.searchByTitleOrTypeOrContent(key,"title",path);
        a3 = LuceneTools.searchByTitleOrTypeOrContent(key,"type",path);
        a4 = LuceneTools.searchByTitleOrTypeOrContent(key,"content",path);

        CollectionTools.addCollections(result,new Collection[]{a1,a2,a3,a4});

        return result;
    }
}
