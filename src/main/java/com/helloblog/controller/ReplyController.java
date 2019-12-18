package com.helloblog.controller;

import com.helloblog.domain.Reply;
import com.helloblog.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ReplyController {
    @Autowired
    ReplyService replyService;

    public void setReplyService(ReplyService replyService) {
        this.replyService = replyService;
    }

    @RequestMapping("/addOneReply")
    public void addOneReply(HttpServletRequest request, HttpServletResponse response){
        Integer replyblogid = Integer.parseInt(request.getParameter("replyblogid"));
        Integer remarkid    = Integer.parseInt(request.getParameter("remarkid"));
        Date    datetime    = new Date(System.currentTimeMillis());
        String  content     = request.getParameter("content");

        Reply reply = new Reply();
        reply.setReplyblogid(replyblogid);
        reply.setRemarkid(remarkid);
        reply.setDatetime(datetime);
        reply.setContent(content);

        replyService.addOneReply(reply);
    }

    @RequestMapping("/getAllReply")
    public String getAllReply(HttpServletRequest request , HttpServletResponse response){
        Integer remarkid = Integer.parseInt(request.getParameter("remarkid"));
        Map<String ,Object> messageMap = new HashMap<>();
        List<Reply> replyList = replyService.getReplylist(remarkid);
        messageMap.put("replyList",replyList);

        request.setAttribute("messageMap",messageMap);
        return "forward: NULL";
    }
}
