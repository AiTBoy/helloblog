package com.helloblog.service.serviceimp;

import com.helloblog.dao.ReplyMapper;
import com.helloblog.domain.Reply;
import com.helloblog.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReplyServiceImp implements ReplyService {
    @Autowired
    ReplyMapper replyMapper;

    public void setReplyMapper(ReplyMapper replyMapper) {
        this.replyMapper = replyMapper;
    }

    @Override
    public int addOneReply(Reply reply) {
        return replyMapper.insertOneRely(reply);
    }

    @Override
    public List<Reply> getReplylist(Integer remarkid) {
        return replyMapper.selectRelylist(remarkid);
    }

    @Override
    public int insert(Reply record) {
        return 0;
    }

    @Override
    public int insertSelective(Reply record) {
        return 0;
    }


    @Override
    public int updateByPrimaryKeySelective(Reply record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Reply record) {
        return 0;
    }
}
