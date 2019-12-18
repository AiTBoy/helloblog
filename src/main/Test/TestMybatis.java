//import java.io.IOException;
//import java.io.InputStream;
//import java.sql.SQLException;
//import java.util.*;
//
//import com.github.pagehelper.PageHelper;
//import com.helloblog.dao.RemarkMapper;
//import com.helloblog.domain.Article;
//import com.helloblog.domain.Blogger;
//import com.helloblog.domain.Remark;
//import com.helloblog.service.RemarkService;
//import com.helloblog.service.serviceimp.RemarkServiceImp;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import others.Category;
//import others.Order;
//import others.OrderItem;
//import others.Product;
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import org.junit.Test;
//import org.mybatis.generator.api.MyBatisGenerator;
//import org.mybatis.generator.config.Configuration;
//import org.mybatis.generator.config.xml.ConfigurationParser;
//import org.mybatis.generator.exception.InvalidConfigurationException;
//import org.mybatis.generator.exception.XMLParserException;
//import org.mybatis.generator.internal.DefaultShellCallback;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:applicationContext.xml")
//public class TestMybatis {
//    public static SqlSession loadXML(String resource) throws IOException {
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        SqlSession session=sqlSessionFactory.openSession();
//        return session;
//    }
//
//    public static void main(String[] args) throws IOException {
//        SqlSession session = loadXML("mybatis-config.xml");
//
//        List<Category> cs=session.selectList("listCategory");
//        for (Category c : cs) {
//            System.out.println(c.getName());
//        }
//
//        List<Product> cs1=session.selectList("listProduct");
//        for (Product c : cs1) {
//            System.out.println(c.getName());
//        }
//
//        Category category = new Category();
//        category.setName("category3");
//        session.insert("addCategory",category);
//
//        session.delete("deleteCategory",1);
//
//        Category category1 = session.selectOne("getCategory",2);
//        category1.setName("category999");
//        System.out.println(category1.getName());
//
//        session.update("updateCategory",category1);
//
//        System.out.println("--------------------------");
//        List<Category> cs2 = session.selectList("listCategoryByName","cat");
//        for (Category c : cs2) {
//            System.out.println(c.getName());
//        }
//
//        Map<String , Object> maps = new HashMap<>();
//        maps.put("id",2);
//        maps.put("name","cat");
//        List<Category> cs3 = session.selectList("listCategoryByIdAndName",maps);
//
//        for (Category c : cs3) {
//            System.out.println(" +" + c.getName());
//        }
//
//        IN in = new IN();
//        in.id = 1;
//        in.name="cat";
//        List<Category> cs4 = session.selectList("listCategoryByIdAndName",in);
//        for (Category c : cs4) {
//            System.out.println(" +-" + c.getName());
//        }
//
//        session.commit();
//        session.close();
//
//    }
//
//    @Test
//    public void test1() throws IOException {
//        SqlSession session = loadXML("mybatis-config.xml");
//
//        List<Category> cs = session.selectList("listCategory1");
//        for (Category c : cs) {
//            System.out.println(c);
//            List<Product> ps = c.getProducts();
//            for (Product p : ps) {
//                System.out.println("\t"+p);
//            }
//        }
//
//        List<Product> products = session.selectList("listProduct1");
//        for(Product product : products){
//            System.out.println(product.toString() + product.getCategory().toString());
//
//        }
//
//        List<Order> os = session.selectList("listOrder");
//        for (Order o : os) {
//            System.out.println(o.getCode());
//            List<OrderItem> ois= o.getOrderItems();
//            for (OrderItem oi : ois) {
//                System.out.format("\t%s\t%f\t%d%n", oi.getProduct().getName(),oi.getProduct().getPrice(),oi.getNumber());
//                System.out.println(oi.getOrder());
//            }
//        }
//
//
//
//        List<Product> ps = session.selectList("listProduct2");
//        for(Product product : ps){
//            System.out.println(product.toString());
//        }
//
//        Map<String , Object> m = new HashMap<>();
//        m.put("name","a");
//        List<Product> ps1 = session.selectList("listProduct2",m);
//        System.out.println(ps1.toString());
//
//        Map<String , Object> m1 = new HashMap<>();
//        //m1.put("name","a");
//        //m1.put("price","87.88f");
//        m1.put("sss","88.87f");
//        List<Product> ps2 = session.selectList("listProduct3",m1);
//        System.out.println(ps2.toString());
//
//        Product p = new Product();
//        p.setId(6);
//        p.setName("product zz");
//        p.setPrice(99.99f);
//        session.update("updateProduct",p);
//        session.commit();
//
//        Map<String , Object> m2 = new HashMap<>();
//        m2.put("name","b");
//        //m2.put("price","87.88f");
//        //m2.put("sss","88.87f");
//        List<Product> ps3 = session.selectList("listProduct4",m2);
//        System.out.println(ps3.toString());
//
//        System.out.println("------------------------");
//        Map<String,Object> params = new HashMap<>();
//        params.put("name","a");
////      params.put("price","10");
//        List<Product> ps4 = session.selectList("listProduct5",params);
//        for (Product pp : ps4) {
//            System.out.println(pp);
//        }
//
//        System.out.println("------------------------");
//        List<Integer> ids = new ArrayList();
//        ids.add(1);
//        ids.add(3);
//        ids.add(5);
//        System.out.println(ids);
//
//        List<Product> ps5 = session.selectList("listProduct6",ids);
//        for (Product pp1 : ps5) {
//            System.out.println(pp1);
//        }
//
//        System.out.println("------------------------");
//
//        Map<String, String> ps6 =new HashMap();
//        params.put("name", "product");
//
//        List<Product> lps = session.selectList("listProduct7",params);
////        for (Product pp2 : lps) {
////            System.out.println(pp2);
////        }
//
//    }
//
//    @Test
//    public void test3() throws IOException {
//        SqlSession session = loadXML("mybatis-config.xml");
//        List<Category> cs = session.selectList("listCategory");
//        for (Category c : cs) {
//            session.delete("deleteCategory", c);
//        }
//        for (int i = 0; i < 100; i++) {
//            Category c = new Category();
//            c.setName("category name " + i);
//            session.insert("addCategory", c);
//        }
//        List<Category> cs2 = session.selectList("listCategory");
//        for (Category c : cs2) {
//            System.out.println(c.getName());
//        }
//
//        System.out.println("-----------------------------------------");
//        Map<String,Object> params = new HashMap<>();
//        params.put("start", 0);
//        params.put("count", 5);
//        List<Category>  cs1 =session.selectList("listCategory", params);
//        for (Category c : cs1) {
//            System.out.println(c);
//        }
//
//        session.commit();
//        session.close();
//    }
//
//    @Test
//    public void test4() throws IOException {
//        SqlSession session = loadXML("mybatis-config.xml");
//        PageHelper.offsetPage(0, 5);
//
//        List<Category> cs = session.selectList("listCategory");
//        for (Category c : cs) {
//            System.out.println(c.getName());
//        }
//    }
//
//    @Test
//    public void test5() throws IOException {
//        String resource = "mybatis-config.xml";
//        InputStream inputStream = Resources.getResourceAsStream(resource);
//        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//        SqlSession session = sqlSessionFactory.openSession();
//        Blogger blogger =session.selectOne("selectByPrimaryKey",1);
//        System.out.println(blogger.getName());
//
//        session.close();
//    }
//
//    @Test
//    public void test6() throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
//        List<String> warnings = new ArrayList<String>();
//        boolean overwrite = true;
//        InputStream is= TestMybatis.class.getClassLoader().getResource("generatorConfig.xml").openStream();
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = cp.parseConfiguration(is);
//        is.close();
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
//        myBatisGenerator.generate(null);
//        System.out.println("生成代码成功，刷新项目，查看文件,然后执行TestMybatis.java");
//    }
//
//    @Test
//    public void test7() throws IOException {
//        SqlSession session = loadXML("mybatis-config.xml");
//        List<Article> articles = session.selectList("selectArticleLists");
//        for(Article article : articles){
//            System.out.println(article.getContent());
//        }
//
//        session.commit();
//        session.close();
//    }
//
//
//    @Autowired
//    RemarkMapper remarkMapper;
//
//    @Test
//    public void test8() throws IOException {
//        ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
//        SqlSession session = loadXML("mybatis-config.xml");
//        Remark remark = new Remark();
//        remark.setArtid(1);
//        remark.setContent("134");
//        remark.setRemarkblogid(1);
//        remark.setPraise(1);
//        remark.setDatetime(new Date(System.currentTimeMillis()));
//
//        remark.setRemarkid(-267189320);
//
//        remarkMapper.insertOneRemark(remark);
//
//    }
//}
//
//
//class IN{
//    int id;
//    String name;
//
//}