package com.helloblog.service;

import com.helloblog.domain.Reply;

import java.util.List;

public interface ReplyService {

    //增加一条评论的回复
    int addOneReply(Reply reply);

    //查找某条评论的所有回复
    List<Reply> getReplylist(Integer remarkid);



//    int deleteByPrimaryKey(ReplyKey key);

    int insert(Reply record);

    int insertSelective(Reply record);

//    Reply selectByPrimaryKey(ReplyKey key);

    int updateByPrimaryKeySelective(Reply record);

    int updateByPrimaryKey(Reply record);
}
