package com.helloblog.controller;

import com.helloblog.service.BloggerImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


//主要用于从服务器下载文件
@Controller
public class DownloadFileController {
    @Autowired
    BloggerImageService bloggerImageService;

    public void setBloggerImageService(BloggerImageService bloggerImageService) {
        this.bloggerImageService = bloggerImageService;
    }

    @RequestMapping("/downloadImage")
    public void downloadImage(HttpServletRequest request, HttpServletResponse response) throws IOException {

        Integer blogid = Integer.parseInt(request.getParameter("blogid"));
        Integer type   = Integer.parseInt(request.getParameter("type"));

        String  path    = request.getServletContext().getRealPath("/image/background") + blogid + "-"+type+".jpg";
        File    imgFile = new File(path);

        if(!imgFile.exists()){ //如果图片不存在返回系统默认图片
            path    = request.getServletContext().getRealPath("/image/defaultbackground") + "-"+type+".jpg";
            imgFile = new File(path);
        }

        String newFileName = new String(path.getBytes(), "utf-8");
        response.setHeader("Content-disposition", "attachment;filename=" + newFileName);

        BufferedInputStream  bis = new BufferedInputStream(new FileInputStream(imgFile));
        BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());

        byte[] b = new byte[1024*1024*20];
        int len;
        while ((len = bis.read(b)) != -1){
            bos.write(b, 0, len);
        }

        if(bis != null){
            bis.close();
        }
        if(bos != null){
            bos.close();
        }
    }

}
