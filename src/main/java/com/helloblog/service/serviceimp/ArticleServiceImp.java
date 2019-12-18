package com.helloblog.service.serviceimp;

import com.helloblog.dao.ArticleMapper;
import com.helloblog.domain.Article;
import com.helloblog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tools.CodecKitTools;

import javax.servlet.http.Cookie;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class ArticleServiceImp implements ArticleService {
    @Autowired
    ArticleMapper articleMapper;

    @Override
    public List<Article> getPublicArticles() {
        List<Article> articles = articleMapper.selectArticleLists();
        //不存在任何文章
        if(articles.size() == 0)
            return null;
        for(Article article : articles){
            article.setContent(article.getContent().replaceAll("~~1~~","%").replaceAll("~~2~~","+"));
        }
        return articles;
    }

    @Override
    public Article getOnePublicArticle(Integer artid) {
        Article article = articleMapper.selectOneArticle(artid);
        return article;
    }

    @Override
    public Integer getOneArticleLike(Integer artid) {
        Integer likes = articleMapper.selectOneArticleLike(artid);
        return likes;
    }

    @Override
    public int giveALike(Integer artid) {
        return articleMapper.addOneLikeOfArticle(artid);
    }

    @Override
    public List<Article> getPublicArticles(Integer blogid) {
        List<Article> articles = articleMapper.selectArticleList(blogid);
        for(Article article : articles){
            article.setContent(article.getContent().replaceAll("~~1~~","%").replaceAll("~~2~~","+"));
        }
        return articles;
    }

    @Override
    public Article getOneArticle(Integer blogid, String title) {
        Article article = articleMapper.selectArticle(blogid,title);
//        if(article != null){
////            String tmpStr = article.getContent().replaceAll("~~~","%").replaceAll("~~~~","+");
////            article.setContent(tmpStr);
////        }
        return article;
    }

    @Override
    public int addOneArticle(Article article) {
        String c = null;
        String s = article.getContent().replaceAll("~~1~~","%").replaceAll("~~2~~","+");
//        System.out.println(s);
        try {
            c = CodecKitTools.decodeByJava8(new String(s.getBytes(),"utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
//        CodecKitTools.ecode();
//        CodecKitTools.encode();

//        System.out.println("==============================" + c +"==========================================\n");



        article.setContent(c);
        if(article.getArtid() == null){
            int randomId = 0;
            do{
                randomId = UUID.randomUUID().hashCode()>>2;  //这里随机产生一个artid

                System.out.println("remarkid" + randomId);
            } while (articleMapper.selectOneArticle(randomId) != null);//检查该id是否已经存在过
            article.setArtid(randomId);
        }

        article.setLike(0);
        article.setPublictime(new Date(System.currentTimeMillis()));

        return articleMapper.insertOneArticle(article);
    }

    @Override
    public int removeOneArticle(Integer artid) {
        return  articleMapper.deleteOneArticle(artid);
    }







    @Override
    public int deleteByPrimaryKey(Integer artid) {
        return 0;
    }

    @Override
    public int insert(Article record) {
        return 0;
    }

    @Override
    public int insertSelective(Article record) {
        return 0;
    }

    @Override
    public Article selectByPrimaryKey(Integer artid) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Article record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKeyWithBLOBs(Article record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Article record) {
        return 0;
    }
}
