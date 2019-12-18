package com.helloblog.service.serviceimp;

import com.helloblog.dao.BloggerImageMapper;
import com.helloblog.domain.BloggerImage;
import com.helloblog.service.BloggerImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BloggerImageServiceImp implements BloggerImageService {

    @Autowired
    BloggerImageMapper bloggerMapper;

    public void setBloggerMapper(BloggerImageMapper bloggerMapper) {
        this.bloggerMapper = bloggerMapper;
    }

    @Override
    public int addOneImage(BloggerImage bloggerImage) {
        if(isExitImage(bloggerImage) != null){
            return 1;
        }

        return bloggerMapper.insertImage(bloggerImage);
    }

    @Override
    public Integer isExitImage(BloggerImage bloggerImage) {
        return bloggerMapper.isimage(bloggerImage);
    }
}
