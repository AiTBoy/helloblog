package com.helloblog.controller;

import com.helloblog.domain.Article;
import com.helloblog.service.ArticleService;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tools.LuceneTools;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//文章搜索控制器
@Controller
public class ArticleSearchController {
    @Autowired
    ArticleService articleService;

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }

    @RequestMapping("/searchArticle")
    public String searchArticle(HttpServletRequest request , HttpServletResponse response) throws IOException, ParseException {
        String key = request.getParameter("searchContent");
        request.setAttribute("messageMap",new HashMap<>());

        //关键字查找顺序 artid-->title-->type-->content

        String path = request.getServletContext().getRealPath("/index/publicArticles"); //索引所在目录

        List<Article> result = LuceneTools.synthesizeSearch(key,path);
        List<Article> bloggerArticlesList = new ArrayList<>();

        for (Article article :
                result) {
            Article tmp = articleService.getOnePublicArticle(article.getArtid());
            bloggerArticlesList.add(tmp);
        }


        Map<String , Object> messageMap = new HashMap<>();
        messageMap.put("bloggerArticlesList",bloggerArticlesList);

        request.setAttribute("messageMap",messageMap);
        request.setAttribute("bloggerArticlesFlag",1);

        return "forward:listArticleRemarks";
    }

    @RequestMapping("/addIndexForArticle")
    public String addIndexForArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {

        return operIndex(1,request);
    }

    @RequestMapping("/removeIndexForArticle")
    public String removeIndexForArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {

        return operIndex(2,request);
    }

    @RequestMapping("/modifyIndexForArticle")
    public String modifyIndexForArticle(HttpServletRequest request,HttpServletResponse response) throws IOException {

        return  operIndex(3,request);
    }

    //对索引的修改操作
    public String operIndex(int mode,HttpServletRequest request) throws IOException {
        Article article = (Article) request.getAttribute("article");

        if(article != null){
            String path = request.getServletContext().getRealPath("/index/publicArticles"); //索引所在目录
            switch (mode){
                case 1:
                    LuceneTools.addIndexDoc(path,article);
                    break;
                case 2:
                    LuceneTools.deleteIndexDoc(path,article);
                    break;
                case 3:
                    LuceneTools.updateIndexDoc(path,article);
                    break;
            }
        }

        return "forward:NULL";
    }


}
