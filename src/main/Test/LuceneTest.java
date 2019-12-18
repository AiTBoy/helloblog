
import com.helloblog.domain.Article;
import com.helloblog.service.ArticleService;

import org.apache.lucene.queryparser.classic.ParseException;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import tools.CollectionTools;

import java.io.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class LuceneTest {
    @Autowired
    ArticleService articleService;

    @Test
    public void test1() throws IOException, ParseException {

        List<Article> a1 = new ArrayList<>();
        List<Article> a2 = new ArrayList<>();

        Article x1 = new Article();
        Article x2 = new Article();
        Article x3 = new Article();
        x1.setArtid(111);
        x2.setArtid(222);
        x3.setArtid(333);

        a1.add(x1);
        a1.add(x2);
        a2.add(x2);
        a2.add(x3);

        List<Article> a3 = new ArrayList<>();
        CollectionTools.addCollections(a3,new Collection[]{a1,a2});

        for (Article a:
             a3) {
            System.out.println(a.getArtid());

        }
        System.out.println(a3.size());




//        List<Article> articles = articleService.getPublicArticles();

        //Article a = articles.get(0);

        //articles.remove(a);

        //String path = request.getServletContext().getRealPath("/index/publicArticles"); //背景图片

//        LuceneTools luceneTools = new LuceneTools();
//        luceneTools.createIndexForArticles(articles,"C:\\Program Files\\Idea2019\\mycode\\HELLOBLOG\\target\\HELLOBLOG\\index\\publicArticles");

        //luceneTools.addIndexDoc("D:\\index",a);
        //luceneTools.searchByTitleOrTypeOrContent("1","artid","D:\\index");
        //luceneTools.deleteIndex("D:\\index");
        //Article article = new Article();
        //article.setArtid(21386341);
        //luceneTools.deleteIndexDoc("D:\\index",article);
        //luceneTools.searchByTitleOrTypeOrContent("21386341","artid","D:\\index");
        //System.out.println(articles.size());
        //LuceneTools.deleteIndex("D:\\index");
    }


//    public void index(){
//        IndexWriter writer = null;
//        try {
//            //1、创建Derictory
////        Directory directory = new RAMDirectory();//这个方法是建立在内存中的索引
//
//
//
//            Directory directory = FSDirectory.open(new File("D:\\lucene\\index"));//这个方法是建立在磁盘上面的索引
////        2、创建IndexWriter，用完后要关闭
//            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_4_10_3,new StandardAnalyzer(Version.LUCENE_4_10_3));
//            writer = new IndexWriter(directory,config);
//
//            //3、创建Document对象
//            Document document = null;
//            File fl = new File("D:\\lucene\\file");
//
//            //4、为Document添加Field
//            for(File file : fl.listFiles()){
//                document = new Document();
//
//                document.add(new Field("content","你dsafdasfddasfdafda好", TextField.TYPE_STORED));
//                //把文件名存放到硬盘中，不作分词
//                document.add(new Field("fileName",file.getName(),Field.Store.YES, Field.Index.ANALYZED.NOT_ANALYZED));
//                //把绝对路径放到硬盘中，不作分词
//                document.add(new Field("path", file.getAbsolutePath(), Field.Store.YES, Field.Index.NOT_ANALYZED));
//            }
//            //5、通过IndexWriter添加文档到索引中
//            writer.addDocument(document);
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            if(null != writer){
//                try {
//                    writer.close();
//                } catch (IOException e) {
//                    e.printStackTrace();
//                }
//            }
//        }
//    }
//
//    /**
//     * 搜索
//     */
//    public void searcher(){
//        try {
//            //1、创建Directory
//            Directory directory = FSDirectory.open(new File("D:\\lucene\\index"));
//
//            //2、创建IndexReader，需要关闭
//            IndexReader reader = IndexReader.open(directory);
//
//            //3、根据IndexReader创建IndexSearcher
//            IndexSearcher searcher = new IndexSearcher(reader);
//
//            //4、创建索引的Query
//            //第二个参数代表着要搜索的域
//            QueryParser parser = new QueryParser(Version.LUCENE_4_10_3,"content",new StandardAnalyzer(Version.LUCENE_4_10_3));
//            //表示搜索content中包含java的文档
//            Query query = parser.parse("他");
//
//            //5、根据searcher搜索并返回TopDocs
////            表示返回前面10条
//            TopDocs topDocs = searcher.search(query,10);
//            //6、根据TopDocs获取ScoreDoc对象
//            ScoreDoc[] scoreDocs = topDocs.scoreDocs;
//            System.out.println(scoreDocs.length);
//            for(ScoreDoc sd : scoreDocs){
//                //7、根据Searcher和ScordDoc对象获取具体的Document对象
//                //获取这个文档的id
//                int doc = sd.doc;
//                Document document = searcher.doc(doc);
//                //8、根据Document对象获取需要的值
//                System.out.println("【找到】" + document.get("fileName") + "    " + document.get("path") + " .." + document.get("content"));
//            }
//
//            reader.close();
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//    @Test
//    public void test(){
//        //index();
//        searcher();
//    }
//



}








//class Indexer {
//    // 写索引实例
//    private IndexWriter writer;
//
//    /**
//     * 构造方法 实例化IndexWriter
//     *
//     * @param indexDir
//     * @throws IOException
//     */
//    public Indexer(String indexDir) throws IOException {
//        //得到索引所在目录的路径
//        Directory directory = FSDirectory.open(Paths.get(indexDir));
//        // 标准分词器
//        Analyzer analyzer = new IKAnalyzer();
//        //保存用于创建IndexWriter的所有配置。
//        IndexWriterConfig iwConfig = new IndexWriterConfig(analyzer);
//        //实例化IndexWriter
//        writer = new IndexWriter(directory, iwConfig);
//    }
//
//    /**
//     * 关闭写索引
//     *
//     * @throws Exception
//     * @return 索引了多少个文件
//     */
//    public void close() throws IOException {
//        writer.close();
//    }
//
//    public int index(String dataDir) throws Exception {
//        File[] files = new File(dataDir).listFiles();
//        for (File file : files) {
//            //索引指定文件
//            indexFile(file);
//        }
//        //返回索引了多少个文件
//        return writer.numDocs();
//
//    }
//
//    /**
//     * 索引指定文件
//     *
//     * @param f
//     */
//    private void indexFile(File f) throws Exception {
//        //输出索引文件的路径
//        System.out.println("索引文件：" + f.getCanonicalPath());
//        //获取文档，文档里再设置每个字段
//        Document doc = getDocument(f);
//        //开始写入,就是把文档写进了索引文件里去了；
//        writer.addDocument(doc);
//    }
//
//    /**
//     * 获取文档，文档里再设置每个字段
//     *
//     * @param f
//     * @return document
//     */
//    private Document getDocument(File f) throws Exception {
//        Document doc = new Document();
//        //把设置好的索引加到Document里，以便在确定被索引文档
//        doc.add(new TextField("contents", new FileReader(f)));
//        //Field.Store.YES：把文件名存索引文件里，为NO就说明不需要加到索引文件里去
//        doc.add(new TextField("fileName", f.getName(), Field.Store.YES));
//        //把完整路径存在索引文件里
//        doc.add(new TextField("fullPath", f.getCanonicalPath(), Field.Store.YES));
//        return doc;
//    }
//
//    public static void main(String[] args) {
//        //索引指定的文档路径
//        String indexDir = "D:\\lucene\\index";
//        ////被索引数据的路径
//        String dataDir = "D:\\lucene\\file";
//        Indexer indexer = null;
//        int numIndexed = 0;
//        //索引开始时间
//        long start = System.currentTimeMillis();
//        try {
//            indexer = new Indexer(indexDir);
//            numIndexed = indexer.index(dataDir);
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        } finally {
//            try {
//                indexer.close();
//            } catch (Exception e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }
//        //索引结束时间
//        long end = System.currentTimeMillis();
//        System.out.println("索引：" + numIndexed + " 个文件 花费了" + (end - start) + " 毫秒");
//    }
//
//}

















//class Searcher {
//
//    public static void search(String indexDir, String q) throws Exception {
//
//        // 得到读取索引文件的路径
//        Directory dir = FSDirectory.open(Paths.get(indexDir));
//        // 通过dir得到的路径下的所有的文件
//        IndexReader reader = DirectoryReader.open(dir);
//        // 建立索引查询器
//        IndexSearcher is = new IndexSearcher(reader);
//        // 实例化分析器
//        Analyzer analyzer = new IKAnalyzer();
//        // 建立查询解析器
//        /**
//         * 第一个参数是要查询的字段； 第二个参数是分析器Analyzer
//         */
//        QueryParser parser = new QueryParser("contents", analyzer);
//        // 根据传进来的p查找
//        Query query = parser.parse(q);
//        // 计算索引开始时间
//        long start = System.currentTimeMillis();
//        // 开始查询
//        /**
//         * 第一个参数是通过传过来的参数来查找得到的query； 第二个参数是要出查询的行数
//         */
//        TopDocs hits = is.search(query, 10);
//        // 计算索引结束时间
//        long end = System.currentTimeMillis();
//        System.out.println("匹配 " + q + " ，总共花费" + (end - start) + "毫秒" + "查询到" + hits.totalHits + "个记录");
//        // 遍历hits.scoreDocs，得到scoreDoc
//        /**
//         * ScoreDoc:得分文档,即得到文档 scoreDocs:代表的是topDocs这个文档数组
//         *
//         * @throws Exception
//         */
//        for (ScoreDoc scoreDoc : hits.scoreDocs) {
//            Document doc = is.doc(scoreDoc.doc);
//            System.out.println(doc.get("fullPath"));
//        }
//
//        // 关闭reader
//        reader.close();
//    }
//
//    public static void main(String[] args) {
//        String indexDir = "D:\\lucene\\index";
//        //我们要搜索的内容
//        String q = "你";
//        try {
//            search(indexDir, q);
//        } catch (Exception e) {
//            // TODO Auto-generated catch block
//            e.printStackTrace();
//        }
//    }
//}
