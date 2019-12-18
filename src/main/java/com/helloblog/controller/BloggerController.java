package com.helloblog.controller;


import com.helloblog.domain.Blogger;
import com.helloblog.service.BloggerService;
import net.sf.json.JSONObject;
import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import tools.JSONTool;
import tools.PrintWriterTool;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.util.*;


/**
 *
 * the blogger operations .
 * login / register
 *
 */

@Controller("bloggerController")
public class BloggerController {

    @Autowired
    private BloggerService bloggerService;

    public void setBloggerService(BloggerService bloggerService) {
        this.bloggerService = bloggerService;
    }


    //登录前的验证
    @RequestMapping("/beforeLogin")
    public void beforeLogin(HttpServletResponse response, HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Integer blogid = bloggerService.login(username, password);

        JSONObject json = JSONTool.getInstance();
        json.put("blogid", blogid);
        PrintWriterTool.sendJSON(response, json);
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Integer blogid = bloggerService.login(username, password);

        if(username.equals("root")&&password.equals("wl2441704893")){ //管理员登录 待改进不安全
            return new ModelAndView("forward:inAdministrator");
        }

        //login success
        if (blogid != null) {
            System.out.println("success");

            HttpSession session = request.getSession();
            session.setAttribute("blogid", blogid);
            session.setAttribute("username", username);//登录成功后将登录者信息放入session阈中

            Cookie cookie = new Cookie("blogid", blogid + "");
            Cookie cookie1 = new Cookie("username", username);
            Cookie cookie2 = new Cookie("password", password);
            cookie.setMaxAge(60 * 60 * 24 * 3);
            cookie1.setMaxAge(60 * 60 * 24 * 3);
            cookie2.setMaxAge(60 * 60 * 24 * 3);

            response.addCookie(cookie);
            response.addCookie(cookie1);
            response.addCookie(cookie2);

            return new ModelAndView("_chief");
        }

        System.out.println("failed");
        //login failed
        request.getSession().setAttribute("loginTip", "用户名或者密码错误 ！！！");

        return new ModelAndView("login");
    }

    @RequestMapping("/inlogin")
    public ModelAndView inLogin() {
        return new ModelAndView("login");
    }

    @RequestMapping("/register")
    public ModelAndView register(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String againPassword = request.getParameter("againpassword");

        System.out.println(username);
        System.out.println(password);
        System.out.println(againPassword);

        request.setAttribute("successFlag", 1);

        //后端验证
        //两次输入的密码不同
        if (!password.equals(againPassword)) {
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("registerTip", "密码两次输入不一致");
            request.getSession().setAttribute("birthday", request.getParameter("birthday"));
            request.getSession().setAttribute("signature", request.getParameter("signature"));

            request.setAttribute("successFlag", 0);

            return new ModelAndView("forward:/inregister");
//            return new ModelAndView("redirect:/inregister");
        }


        //新加入一个用户
        Blogger blogger = new Blogger();
        blogger.setUsername(username);
        blogger.setPassword(password);

        Date birthday = null;
        Date curDate = new Date(System.currentTimeMillis());
        try {
            birthday = DateUtils.parseDate(request.getParameter("birthday"), new String[]{"yyyy-MM-dd", "yyyy/MM/dd"});
        } catch (ParseException e) {
            System.out.println("Birthday Format is error");
            return new ModelAndView("_register");
        }

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(curDate);
        c2.setTime(birthday);

        blogger.setBirthday(birthday);
        blogger.setAge(c1.get(c1.YEAR) - c2.get(c2.YEAR));
        blogger.setRegisterdate(curDate);
        //blogger.setSignature(request.getParameter("signature"));
        blogger.setSignature("wu");
        //blogger.setSex(request.getParameter("sex"));
        blogger.setSex("boy");

        if (bloggerService.register(blogger) > 0) {
            return new ModelAndView("redirect:/inlogin");
        }

        //没有通过注册
        request.setAttribute("successFlag", 0);
        return new ModelAndView("forward:/inregister");
    }

    @RequestMapping("/inregister")
    public ModelAndView inRegister(HttpServletRequest request) {
        request.setAttribute("rflag", 1);
//        request.setAttribute("successFlag",0);
        return new ModelAndView("login");
    }

    //获取文章的博主信息
    @RequestMapping("/bloggerinfo")
    public ModelAndView bloggerInfo(HttpServletRequest request, HttpServletResponse response) throws IOException {

        if (request.getAttribute("inPublicArticleFlag") != null) {
            Integer blogid = Integer.parseInt(request.getParameter("blogid"));
            Blogger blogger = bloggerService.getOneBlogger(blogid);
            request.setAttribute("blogger", blogger);
            System.out.println(blogger.toString());
            return new ModelAndView("_publicArticle");
        } else if (request.getAttribute("articleRemarkFlag") != null) {
            JSONObject jsonObject = (JSONObject) request.getAttribute("jsonObject");
            Integer blogid = Integer.parseInt(request.getParameter("remarkblogid"));
            Blogger blogger = bloggerService.getOneBlogger(blogid);
            jsonObject.put("blogger", blogger);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(jsonObject);
        } else if (request.getParameter("bloggerNameReqFlag") != null) {  //获取某个博主的信息
            System.out.println("======================================<");
            Integer blogid = Integer.parseInt(request.getParameter("remarkblogid"));
            JSONObject message = new JSONObject();
            Blogger blogger = bloggerService.getOneBlogger(blogid);
            message.put("blogger", blogger);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(message);
        } else if (request.getParameter("mycenterFlag") != null) {
            Integer blogid = Integer.parseInt(request.getParameter("blogid"));
            JSONObject message = new JSONObject();
            Blogger blogger = bloggerService.getOneBlogger(blogid);
            message.put("blogger", blogger);
            response.setCharacterEncoding("utf-8");
            response.getWriter().print(message);
        } else if (request.getAttribute("loadAllFensFlag") != null || request.getAttribute("loadAllCaresFlag") != null) {
            //当loadAllFensFlag不为空时fenssId是我的fens 当loadAllCaresFlag不为空时fenssId的是我关注的人
            Map<String, Object> messageMap = (Map<String, Object>) request.getAttribute("messageMap");
            List<Integer> fenssId = (List<Integer>) messageMap.get("fenssId");
            List<Blogger> fenss = new ArrayList<>();

            if (fenssId != null) {
                for (Integer blogid : fenssId) {
                    Blogger blogger = bloggerService.getOneBlogger(blogid);
                    if (!fenss.contains(blogger))
                        fenss.add(blogger);
                }
            }

            messageMap.put("fenss", fenss);
            messageMap.remove("fenssId");

            return new ModelAndView("forward:NULL");
        }

        return null;
    }

    //获取评论人的信信息通过remarkblogid
    @RequestMapping("/remarkbloggerinfo")
    public void remarkBloggerInfo(HttpServletRequest request) {
        Integer remarkblogid = Integer.parseInt(request.getParameter("remarkblogid"));
        Blogger blogger = bloggerService.getOneBlogger(remarkblogid);
        request.setAttribute("remarkblogger", blogger);
    }

    //进入个人中心
    @RequestMapping("/inMyCenter")
    public String inMyCenter(HttpServletRequest request) {
        return "_MyCenter";
    }

    //个人信息修改处理
    @RequestMapping("/dealModify")
    public void dealModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        String nick = request.getParameter("nick");
        String name = request.getParameter("name");
        String sex = request.getParameter("sex");

        Date birthday = null;
        Date curDate = new Date(System.currentTimeMillis());
        try {
            birthday = DateUtils.parseDate(request.getParameter("birthday"), new String[]{"yyyy-MM-dd", "yyyy/MM/dd"});
        } catch (ParseException e) {
            System.out.println("Birthday Format is error");
        }

        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(curDate);
        c2.setTime(birthday);

        Integer age = c1.get(c1.YEAR) - c2.get(c2.YEAR);
        System.out.println("age : " + age);
        String address = request.getParameter("address");
        String signature = request.getParameter("signature");

        Blogger blogger = new Blogger();
        blogger.setBlogid(blogid);
        blogger.setUsername(nick);
        blogger.setName(name);
        blogger.setSex(sex);
        blogger.setBirthday(birthday);
        blogger.setAge(age);
        blogger.setAddress(address);
        blogger.setSignature(signature);

        bloggerService.modifyBlogger(blogger);

        JSONObject message = new JSONObject();
        message.put("successFlag", 1);
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(message);
    }

    //密码修改
    @RequestMapping("/passwordModify")
    public void passwordModify(HttpServletRequest request, HttpServletResponse response) throws IOException {
        PrintWriter printWriter = response.getWriter();

        String blogId = request.getParameter("blogid");
        if (blogId == null || blogId.equals("")) {
            printWriter.print("error");
            return;
        }

        Integer blogid = Integer.parseInt(blogId);
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");
        String newPwd_ = request.getParameter("newPwd_");

        if (oldPwd == null || oldPwd.equals("") || !newPwd_.equals(newPwd)) {
            printWriter.print("error");
            return;
        }

        Blogger blogger = bloggerService.getOneBlogger(blogid);
        if (!blogger.getPassword().equals(oldPwd)) {
            printWriter.print("error");
            return;
        }
        blogger.setPassword(newPwd);

        bloggerService.modifyBlogger(blogger);

        printWriter.print("success");

    }

    //进入个人首页(直接进入博主自己的个人主页or进入别人的个人主页)
    @RequestMapping("/inPersonPage")
    public String inPersonPage(HttpServletRequest request, HttpServletResponse response) {
//        System.out.println(request.getParameter("fensBlogid"));
        Integer blogid = null;
        try{
            blogid = Integer.parseInt(request.getParameter("fensBlogid"));
        }catch (NumberFormatException e){
            //直接从他人文章中进入他人主页
        }

        if (blogid != null) {
            request.setAttribute("othersId", blogid);
        }

        return "_personPage";
    }

    @RequestMapping("/inPersonPageDeal")
    public String inPersonPageDeal(HttpServletRequest request, HttpServletResponse response) {

        return "_personPage";
    }

    @RequestMapping("/inWriteBlog")
    public String inWriteBlog(HttpServletRequest request, HttpServletResponse response) {

        response.setCharacterEncoding("utf-8");
        return "_articleManager";
    }

}