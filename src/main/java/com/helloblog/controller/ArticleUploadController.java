package com.helloblog.controller;

import com.helloblog.domain.Article;
import com.helloblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller("articleUploadController")
public class ArticleUploadController {
    @Autowired
    ArticleService articleService;

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    //检查谋篇博主的文章是否存在
    @RequestMapping("/isArticleExit")
    public String isArticleExit(HttpServletRequest request , HttpServletResponse response){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        String  title  = request.getParameter("title");
        Article article = articleService.getOneArticle(blogid,title);

        Map<String, Object> messsageMap = new HashMap<>();

        if(article != null)
            messsageMap.put("title",article.getTitle());

        request.setAttribute("messageMap",messsageMap);

        return "forward:NULL";
    }

    //上传博主的文章
    @RequestMapping("/uploadArticle")
    public String uploadArticle(HttpServletRequest request , HttpServletResponse response){
        Map<String, Object> messageMap = new HashMap<>();
        Integer blogid                 = Integer.parseInt(request.getParameter("blogid"));

        String title =   request.getParameter("title");
        String content = request.getParameter("content");
        String type    = request.getParameter("type");
        String method  = request.getParameter("method");

        int modifyFlag = 0; //索引修改标志
        Article article = articleService.getOneArticle(blogid,title);
        if(article == null){
            article = new Article();
        }else {
            modifyFlag = 1;
            articleService.removeOneArticle(article.getArtid());
        }

        article.setBlogid(blogid);
        article.setTitle(title);
        article.setContent(content);
        article.setType(type);

//        System.out.println("content" + content);


        int successFlag = 0;
        if(articleService.addOneArticle(article) == 1){//文章上传成功
            request.setAttribute("article",article);
            successFlag = 1;
        }else {
            request.setAttribute("article",null);
        }
        messageMap.put("successFlag",successFlag);
        request.setAttribute("messageMap",messageMap);

        if(modifyFlag == 1){
            return "forward:modifyIndexForArticle";
        }

        return "forward:addIndexForArticle";
    }

    //删除某篇博客
    @RequestMapping("/removeOneArticle")
    public String  removeOneArticle(HttpServletRequest request , HttpServletResponse response){
        Map<String, Object> messageMap = new HashMap<>();
        Integer artid                  = Integer.parseInt(request.getParameter("artid"));

        articleService.removeOneArticle(artid);

        messageMap.put("removeFlag",1);
        request.setAttribute("messageMap",messageMap);
        Article article = new Article();
        article.setArtid(artid);
        request.setAttribute("article",article);

        return "forward:removeIndexForArticle";
    }
}
