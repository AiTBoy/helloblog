package com.helloblog.controller;

import com.helloblog.domain.Blogger;
import com.helloblog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class RootOperController {
    @Autowired
    BloggerService bloggerService;

    public void setBloggerService(BloggerService bloggerService) {
        this.bloggerService = bloggerService;
    }

    @RequestMapping("/rootListAllUser")
    public String listAllUser(HttpServletRequest request, HttpServletResponse response){
        System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        Map<String , Object> messageMap = new HashMap<>();
        List<Blogger> bloggers = bloggerService.getAllBloger();

        messageMap.put("bloggers",bloggers);
        request.setAttribute("messageMap",messageMap);

        return "forward:NULL";
    }

    @RequestMapping("/inAdministrator")
    public String inAdministrator(HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
        return "_administrator";
    }

    @RequestMapping("/removeOneBlogger")
    public String removeOneBlogger(HttpServletRequest request, HttpServletResponse response){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));

        bloggerService.removeOneBlogger(blogid);

        response.setCharacterEncoding("utf-8");
        return "_administrator";
    }
}
