package com.helloblog.controller;

import com.helloblog.domain.Fens;
import com.helloblog.service.FensService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class FensController {

    @Autowired
    FensService fensService;

    @RequestMapping("/loadAllFens")
    public String loadAllFens(HttpServletRequest request, HttpServletResponse response){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        List<Integer> fenssId = fensService.getAllFens(blogid);
        Map<String,Object> messageMap = new HashMap<>();

        messageMap.put("fenssId",fenssId);
        request.setAttribute("messageMap",messageMap);
        request.setAttribute("loadAllFensFlag",1);

        return "forward:bloggerinfo";
    }

    @RequestMapping("/loadAllCares")
    public String loadAllCares(HttpServletRequest request, HttpServletResponse response){
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));

        List<Integer> fenssId = fensService.getAllCare(blogid); //fenssId这里指的是我关注的人的集合
        Map<String,Object> messageMap = new HashMap<>();

        messageMap.put("fenssId",fenssId);
        request.setAttribute("messageMap",messageMap);
        request.setAttribute("loadAllCaresFlag",1);

        return "forward:bloggerinfo";
    }

    @RequestMapping("/addCare")
    public void addCare(HttpServletRequest request ,HttpServletResponse response){
        Integer fensid = Integer.parseInt(request.getParameter("fensid"));
        Integer careid = Integer.parseInt(request.getParameter("careid"));

        Fens fens = new Fens();
        fens.setFensid(fensid);
        fens.setCareid(careid);

        if(fensService.isExitOneFens(fens) == 0) //关注某人前首先要开始没关注他
            fensService.addCare(fens);
    }

    @RequestMapping("/cancelCare")
    public void cancelCare(HttpServletRequest request,HttpServletResponse response){ //这里repose参数如果没有声明前端ajax会收到404
        Integer fensid = Integer.parseInt(request.getParameter("fensid"));
        Integer careid = Integer.parseInt(request.getParameter("careid"));

        Fens fens = new Fens();
        fens.setFensid(fensid);
        fens.setCareid(careid);

        if(fensService.isExitOneFens(fens) == 1)  //取消关注前应先关注他
            fensService.removeCare(fens);
    }

}
