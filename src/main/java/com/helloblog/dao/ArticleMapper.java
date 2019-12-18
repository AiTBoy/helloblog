package com.helloblog.dao;

import com.helloblog.domain.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleMapper {
    //获取所有公开的文章
    List<Article> selectArticleLists();

    //获取某篇文章
    Article selectOneArticle(Integer artid);

    //获取谋篇文章当前点赞数量
    Integer selectOneArticleLike(Integer artid);

    //给谋篇文章点赞数量加1
    int addOneLikeOfArticle(Integer artid);

    //获取指定博主所有博客id
    List<Article> selectArticleList(Integer blogid);

    //根据博主id和文章题目获得文章
    Article selectArticle(@Param("blogid") Integer blogid, @Param("title") String title);

    //根据博主的id在数据库中插入一篇文章
    int insertOneArticle(Article article);

    //删除一篇文章通过artid
    int deleteOneArticle(Integer artid);
//
//    int insert(Article record);
//
//    int insertSelective(Article record);
//
//    Article selectByPrimaryKey(Integer artid);
//
//    int updateByPrimaryKeySelective(Article record);
//
//    int updateByPrimaryKeyWithBLOBs(Article record);
//
//    int updateByPrimaryKey(Article record);
}