package com.helloblog.dao;

import com.helloblog.domain.Remark;

import java.util.List;

public interface RemarkMapper {

    //向数据库中插入一条评论
    int insertOneRemark(Remark remark);

    //查看指定remarkid在数据中是否已经存在
    int remarkid(Integer remarkid);

    //通过指定文章id查询数据库中所有评论
    List<Remark> selectremarks(Integer artid);

    //通过指定blogid查询数据库中所有评论
    List<Remark> selectremarksbyblogid(Integer remarkblogid);

    //给某条文章评论在数据中赞记录增加一
    int addOneLikeOfRemark(Integer remarkid);

    //从数据库中获取某条评论的点赞数量
    Integer selectOneRemarkLike(Integer remarkid);

    //从数据库中删除某条评论
    int deleteOneRemark(Integer remarkid);


//    int deleteByPrimaryKey(Integer remarkid);
//
//    int insertSelective(Remark record);
//
//    Remark selectByPrimaryKey(Integer remarkid);
//
//    int updateByPrimaryKeySelective(Remark record);
//
//    int updateByPrimaryKey(Remark record);
}