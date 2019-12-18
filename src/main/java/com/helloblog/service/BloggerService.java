package com.helloblog.service;

import com.helloblog.domain.Blogger;

import java.util.List;

public interface BloggerService {
    Integer login(String username , String password);

    int register(Blogger record);

    //通过id获取某位博主信息
    Blogger getOneBlogger(Integer blogid);

    //修改个人资料
    int modifyBlogger(Blogger blogger);

    //获取所有blogger信息
    List<Blogger> getAllBloger();


    int removeOneBlogger(Integer blogid);

//    int insertSelective(Blogger record);



    int updateByPrimaryKeySelective(Blogger record);

    int updateByPrimaryKey(Blogger record);
}
