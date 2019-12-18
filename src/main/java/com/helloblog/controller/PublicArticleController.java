package com.helloblog.controller;

import com.helloblog.domain.Article;
import com.helloblog.domain.Remark;
import com.helloblog.service.ArticleService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tools.JSONTool;
import tools.PrintWriterTool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@Controller("publicArticleController")
public class PublicArticleController {

    @Autowired
    ArticleService articleService;

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    //直接进入博客首页时
    @RequestMapping("/loadPublicAritcle")
    public String loadPublicAritcle(HttpServletRequest request,HttpServletResponse response){
//        List<Article> articles;
//        articles = articleService.getPublicArticles();
//        HttpSession session = request.getSession();
//        session.setAttribute("articles",articles);
        return "_chief";
    }

    //进入某篇文章时加载
    @RequestMapping("/inPublicArticle")
    public String inPublicArticle(HttpServletRequest request){
        Integer artid = Integer.parseInt(request.getParameter("artid"));

        //该文章已经不存在
        if(artid == null)
            return "_chief";

        Article article = articleService.getOnePublicArticle(artid);         //主文章
        Integer blogid = Integer.parseInt(request.getParameter("blogid")); //文章博主id（用于搜索他的其他相关文章时使用）

        article.setContent(article.getContent().replaceAll("~~1~~","%").replaceAll("~~2~~","+"));

        List<Article> bloggerArticles = null;//该博主的所有文章

        bloggerArticles = articleService.getPublicArticles(blogid);

        request.setAttribute("article",article);  //主文章
        request.setAttribute("bloggerArticles",bloggerArticles); //相关文章集合

        request.setAttribute("inPublicArticleFlag",1);//记号（表明转发从这里开始）

        return "forward:listArticleRemarks"; //添加主文章博主信息
    }

    //点赞处理
    @RequestMapping("/likeDeal")
    public void likeDeal(HttpServletRequest request ,HttpServletResponse response){
        Integer artid = Integer.parseInt(request.getParameter("artid"));
        articleService.giveALike(artid);
        int likes = articleService.getOneArticleLike(artid);

        PrintWriter printWriter = null;
        try {
            printWriter = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        printWriter.print(likes + "");
    }

    //博主首页所有文章
    @RequestMapping("/bloggerArticles")
    public String bloggerArticles(HttpServletRequest request){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        List<Article> bloggerArticlesList = articleService.getPublicArticles(blogid);
        Map<String , Object> messageMap = new HashMap<>();
        messageMap.put("bloggerArticlesList",bloggerArticlesList);
        request.setAttribute("messageMap",messageMap);


        if(request.getParameter("RemarkRemarkedFlag") != null){
            return "forward:listArticleRemark";
        }

        request.setAttribute("bloggerArticlesFlag",1);

        return "forward:listArticleRemarks";
    }

    //首页中展示所有文章
    @RequestMapping("/loadHomePageAritcle")
    public String loadHomePageAritcle(HttpServletRequest request,HttpServletResponse response){
        List<Article> bloggerArticlesList = articleService.getPublicArticles();
        Map<String , Object> messageMap = new HashMap<>();
        messageMap.put("bloggerArticlesList",bloggerArticlesList);

        request.setAttribute("messageMap",messageMap);
        request.setAttribute("bloggerArticlesFlag",1);

        return "forward:listArticleRemarks";

//        HttpSession session = request.getSession();
//        session.setAttribute("articles",articles);
//
//        response.addCookie(new Cookie("blogid","1"));
//        response.addCookie(new Cookie("username","zhangshan"));
    }

    //通过artid加载所有文章内容
    @RequestMapping("/loadArticlesByArtid")
    public void loadArticlesByArtid(HttpServletRequest request,HttpServletResponse response){
        Map<String , Object> map = (Map<String, Object>) request.getAttribute("map");
        List<Remark> bloggerAllremarks = (List<Remark>) map.get("bloggerAllremarks");
        List<Article> articles = new ArrayList<>();
        List<Integer> artids = new ArrayList<>();

        if(bloggerAllremarks != null){
            for(Remark remark : bloggerAllremarks){
                int artid = remark.getArtid();
                if(!artids.contains(artid)){
                    artids.add(artid);
                    Article article = articleService.getOnePublicArticle(artid);
                    articles.add(article);
                }
            }
        }
        System.out.println("articles+++++++++++++++++++"+articles);


        map.put("articles",articles);

        JSONObject json = JSONTool.getInstance();
        json.put("map",map);

        PrintWriterTool.sendJSON(response,json);
    }

}