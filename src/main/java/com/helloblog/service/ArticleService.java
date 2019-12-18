package com.helloblog.service;

import com.helloblog.domain.Article;

import java.util.List;

public interface ArticleService {
    //获取所有公开的文章信息
    List<Article> getPublicArticles();

    //通过AtticleId获取某篇文章
    Article getOnePublicArticle(Integer artid);

    //通过id获取文章的当前点赞数量
    Integer getOneArticleLike(Integer artid);

    //通过文章id给文章点赞
    int giveALike(Integer artid);

    //获取某博主的所有文章
    List<Article> getPublicArticles(Integer blogid);

    //根据博主id和文章题目获得文章
    Article getOneArticle(Integer blogid,String title);

    //上传一篇文章
    int addOneArticle(Article article);

    //删除一篇文章通过id
    int removeOneArticle(Integer artid);


    int deleteByPrimaryKey(Integer artid);

    int insert(Article record);

    int insertSelective(Article record);

    Article selectByPrimaryKey(Integer artid);

    int updateByPrimaryKeySelective(Article record);

    int updateByPrimaryKeyWithBLOBs(Article record);

    int updateByPrimaryKey(Article record);
}
