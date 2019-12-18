package com.helloblog.controller;

import com.helloblog.domain.Article;
import com.helloblog.domain.Remark;
import com.helloblog.service.RemarkService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import tools.JSONTool;
import tools.PrintWriterTool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller("remarkController")
public class RemarkController {

    @Autowired
    public RemarkService remarkService;

    public void setRemarkService(RemarkService remarkService) {
        this.remarkService = remarkService;
    }

    @RequestMapping("/articleRemark")
    public String articleRemark(HttpServletRequest request , HttpServletResponse response) throws IOException {
        Remark remark = new Remark();

        //暂时没有解决中文问题
        Integer artid        = Integer.parseInt(request.getParameter("artid"));
        String  content      = request.getParameter("content");                        //评论内容
        Integer remarkblogid = Integer.parseInt(request.getParameter("remarkblogid")); //评论人的id
        Integer like = 0;
        Date    date =  new Date(System.currentTimeMillis());

        remark.setArtid(artid);
        remark.setContent(content);
        remark.setRemarkblogid(remarkblogid);
        remark.setPraise(like);
        remark.setDatetime(date);
        System.out.println(date);

        if (remarkService.addOneRemark(remark) == 1){ //评论成功
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("remark",remark);

            request.setAttribute("jsonObject",jsonObject);
            request.setAttribute("articleRemarkFlag",1);

            return "forward: bloggerinfo";
        }else { //评论失败

        }
        return "";
    }
    
    @RequestMapping("/listArticleRemarks") //列出某篇文章所有评论
    public String listArticleRemarks(HttpServletRequest request,HttpServletResponse response) throws IOException {
        if(request.getAttribute("inPublicArticleFlag") != null){  //转发来自主文章首页
            List<Remark> articleRemarks  = remarkService.getAllRemarks(Integer.parseInt(request.getParameter("artid")));//该主文章所有评论
            request.setAttribute("articleRemarks",articleRemarks);
            return "forward: bloggerinfo";
        }else if(request.getAttribute("bloggerArticlesFlag") != null){  //转发来自 个人主页/登录界面/个人中心
            Map<String , Object> messageMap = (Map<String , Object>)request.getAttribute("messageMap");
            List<Article> articles  = (List<Article>) messageMap.get("bloggerArticlesList");
            Map<String,Integer> B_R = new HashMap<>();//文章id以及其对应的评论数目

            if(articles != null)
                for(Article article : articles){
                    List<Remark> articleRemarks  = remarkService.getAllRemarks(article.getArtid());//该主文章所有评论
                    Integer num = articleRemarks.size();
                    B_R.put("artid"+article.getArtid(),num);
                }

            messageMap.put("B_R",B_R);

            return "forward:/NULL";
        }

        return "";
    }

    @RequestMapping("/listArticleRemark") //列出某篇文章所有评论（评论中包括评论的整个信息）
    public String listArticleRemark(HttpServletRequest request,HttpServletResponse response) throws IOException {
        if(request.getParameter("RemarkRemarkedFlag") != null){
            Map<String , Object> messageMap = (Map<String , Object>)request.getAttribute("messageMap");
            List<Article> articles  = (List<Article>) messageMap.get("bloggerArticlesList");
            Map<String,List<Remark>> artidRemark = new HashMap<>();//文章博主id以及其对应的评论

            if(articles != null){
                for(Article article : articles){
                    List<Remark> articleRemarks  = remarkService.getAllRemarks(article.getArtid());//该文章所有评论
                    if(articleRemarks != null)//该文章存在评论
                        artidRemark.put("artid"+article.getArtid(),articleRemarks);
                }
            }

            messageMap.put("artidRemark",artidRemark);

            return "forward:/NULL";
        }

        return "forward:/NULL";
    }

    @RequestMapping("/bloggerRemarkedNum")//博主被评论的次数
    public void bloggerRemarkedNum(HttpServletRequest request,HttpServletResponse response){
        Integer artid = Integer.parseInt(request.getParameter("artid"));
        Integer rNum = remarkService.getAllRemarks(artid).size();

        JSONObject json = JSONTool.getInstance();
        json.put("rNum",rNum);
        PrintWriterTool.sendJSON(response,json);
    }

    @RequestMapping("/remarkLikeDeal")
    public void likeDeal(HttpServletRequest request ,HttpServletResponse response) throws IOException {
        Integer remarkid = Integer.parseInt(request.getParameter("remarkid"));
        remarkService.giveALike(remarkid);
        System.out.println("=====================================1");
        int likes = remarkService.getOneRemarkLike(remarkid);
        System.out.println("=====================================2");

        JSONObject responseMessage = new JSONObject();
        responseMessage.put("likes",likes);
        System.out.println("=====================================3");

        response.setCharacterEncoding("utf-8");
        PrintWriter printWriter = response.getWriter();
        printWriter.print(responseMessage);
        System.out.println("=====================================4");
    }

    @RequestMapping("/bloggerAllRemarks") //某博主评论的所有文章
    public String bloggerAllRemarks(HttpServletRequest request){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        Map<String,Object> map = new HashMap<>();

        List<Remark> bloggerAllremarks = remarkService.getAllRemarksByBlogid(blogid);
        map.put("bloggerAllremarks",bloggerAllremarks);
        request.setAttribute("map",map);

        return "forward:loadArticlesByArtid";
    }

    @RequestMapping("/removeOneRemark")
    public String removeOneRemark(HttpServletRequest request){
        Integer remarkid = Integer.parseInt(request.getParameter("remarkid"));
        System.out.println("》》》》》》》》"+remarkid);
        remarkService.removeOneRemark(remarkid);

        request.setAttribute("messageMap",new HashMap<String , Object>());

        return "forward:NULL";
    }


    @RequestMapping("/NULL")
    public void NULL(HttpServletRequest request ,HttpServletResponse response){
        JSONObject json = JSONTool.getInstance();
        JSONTool.putMap(json,(Map<String, Object>) request.getAttribute("messageMap"));

        PrintWriterTool.sendJSON(response,json);
    }
}
