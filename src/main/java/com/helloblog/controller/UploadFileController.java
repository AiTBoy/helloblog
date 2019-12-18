package com.helloblog.controller;

import com.helloblog.domain.BloggerImage;
import com.helloblog.service.BloggerImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import tools.PrintWriterTool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;


//该控制器主要用于上传图片或文件
@Controller("uploadFileController")
public class UploadFileController {

    @Autowired
    BloggerImageService bloggerImageService;

    public void setBloggerImageService(BloggerImageService bloggerImageService) {
        this.bloggerImageService = bloggerImageService;
    }

    @RequestMapping("/uploadImage")//图片上传
    public void uploadImage(HttpServletRequest request, HttpServletResponse response,@RequestParam(value="file") MultipartFile file) {
        Integer blogid    = Integer.parseInt(request.getParameter("blogid"));
        Integer type      = Integer.parseInt(request.getParameter("type"));

        String  imageName = request.getServletContext().getRealPath("/image/background") + blogid + "-" + type + ".jpg"; //背景图片

        BloggerImage bloggerImage = new BloggerImage();
        bloggerImage.setBlogid(blogid);
        bloggerImage.setImageurl(imageName);
        bloggerImage.setType(1);

        System.out.println(imageName);

        File imageFile = new File(imageName);
        try {
            file.transferTo(imageFile);
        } catch (IOException e) {
            e.printStackTrace();
        }

        bloggerImageService.addOneImage(bloggerImage);

        PrintWriterTool.sendMessage(response,"图片上传成功");
    }
}
