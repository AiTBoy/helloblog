package com.helloblog.dao;

import com.helloblog.domain.BloggerImage;

public interface BloggerImageMapper {
    //向数据库中插入一张图片url
    int insertImage(BloggerImage bloggerImage);

    //检查某个BloggerImage在数据库中是否已经存在
    Integer isimage(BloggerImage bloggerImage);
}
