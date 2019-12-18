//import com.helloblog.domain.Blogger;
//import com.helloblog.service.BloggerService;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.ApplicationContext;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import others.Category;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import others.Product;
//
//import java.util.Date;
//
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("classpath:applicationContext.xml")
//public class TestSpring {
//
//    @Test
//    public void test1() {
//        ApplicationContext context = new ClassPathXmlApplicationContext(
//                new String[] { "applicationContext.xml" });
//
//        Category c = (Category) context.getBean("c");
//
//        System.out.println(c.getName());
//    }
//
//    @Test
//    public void test2(){
//        ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
//
//        Product p = (Product) context.getBean("p");
//
//        System.out.println(p.getName());
//        System.out.println(p.getCategory().getName());
//
////        ProductService productService = (ProductService)context.getBean("s");
////        productService.doSomeService();
//
//    }
//
////    @Autowired
////    Category category;
////
////    @Test
////    public void test3(){
////        System.out.println(category.getName());
////    }
//
//    @Autowired
//    BloggerService bloggerService;
//
//    @Test
//    public void test4(){
//        //ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
//
//        //SqlSession sqlSession = (SqlSession) context.getBean("sqlSession");
//        System.out.println(bloggerService);
//
////        for (int i = 7010 ; i <  7110 ; i++){
////            Blogger blogger = new Blogger();
////            blogger.setBlogid(5 + i);
////            blogger.setSex("男");
////            blogger.setUsername("13233226578");
////            blogger.setName("李四" + (char)(i+10)%200);
////            blogger.setPassword("123321" + i);
////            blogger.setRegisterdate(new Date(System.currentTimeMillis()));
////            blogger.setBirthday(new Date(System.currentTimeMillis()));
////            blogger.setAge(11 + i);
////            blogger.setAddress("湖南");
////            bloggerService.insert(blogger);
////        }
//
//    }
//
//    @Test
//    public void test5(){
//        ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "applicationContext.xml" });
//
//        //bloggerService.deleteByPrimaryKey(1);
//
//        Blogger blogger = new Blogger();
//        blogger.setBlogid(1);
//        blogger.setSex("男");
//        blogger.setUsername("13576609948");
//        blogger.setName("刘宇");
//        blogger.setPassword("123456");
//        blogger.setRegisterdate(new Date(System.currentTimeMillis()));
//        blogger.setBirthday(new Date(System.currentTimeMillis()));
//        blogger.setAge(30);
//        blogger.setAddress("关东");
//        //bloggerService.insert(blogger);
//
//        //bloggerService.insert(blogger);
//
//        //System.out.println(bloggerService.selectByPrimaryKey(1).getBirthday());
//        bloggerService.updateByPrimaryKey(blogger);
//    }
//}