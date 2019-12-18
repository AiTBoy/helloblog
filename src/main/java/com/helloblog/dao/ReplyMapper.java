package com.helloblog.dao;

import com.helloblog.domain.Reply;

import java.util.List;

public interface ReplyMapper {

    //向数据库中插入一条评论的回复
    int insertOneRely(Reply reply);

    //通过remarkid查找回复这条评论的所有id
    List<Reply> selectRelylist(Integer remarkid);

//    int deleteByPrimaryKey(ReplyKey key);
//
//    int insert(Reply record);
//
//    int insertSelective(Reply record);
//
//    Reply selectByPrimaryKey(ReplyKey key);
//
//    int updateByPrimaryKeySelective(Reply record);
//
//    int updateByPrimaryKey(Reply record);
}