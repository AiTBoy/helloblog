package com.helloblog.service.serviceimp;

import com.helloblog.dao.BloggerMapper;
import com.helloblog.domain.Blogger;
import com.helloblog.service.BloggerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;


@Service
public class BloggerServiceImp implements BloggerService {
    @Autowired
    BloggerMapper bloggerMapper;

    @Override
    public Integer login(String username, String password) {
        Map<String , Object> params = new HashMap<>();
        params.put("username",username);
        params.put("password",password);

        Integer count = null;

        //成功登陆
        if((count = bloggerMapper.username_password(params)) != null){
            System.out.println("username :" + username + "进入系统");
        }

        //返回0时，登陆失败
        return count;
    }

    @Override
    public int register(Blogger record) {
        int randomId = 0;

        do{
            randomId = UUID.randomUUID().hashCode();  //这里随机产生一个blogerid
            System.out.println("blogid:" + randomId);
        } while (bloggerMapper.blogid(randomId) != 0);//检查该id是否已经存在过

        record.setBlogid(randomId);

        if(bloggerMapper.insert(record) > 0)
            return 1;

        return 0;
    }

    @Override
    public Blogger getOneBlogger(Integer blogid) {
        Blogger blogger = bloggerMapper.selectOneBlogger(blogid);
        return blogger;
    }

    @Override
    public int modifyBlogger(Blogger blogger) {
        return bloggerMapper.updateBlogger(blogger);
    }

    @Override
    public List<Blogger> getAllBloger() {
        return bloggerMapper.selectAllBlogger();
    }


    @Override
    public int removeOneBlogger(Integer blogid) {
        System.out.println("通过id对博主进行删除操作");
        if(bloggerMapper.deleteOneBlogger(blogid) > 0){
            System.out.println("删除成功");
            return 1;
        }
        System.out.println("失败");
        return 0;
    }


//    @Override
//    public int insertSelective(Blogger record) {
//
//        System.out.println("对博主进行增加操作----只需填写部分信息");
//        if (bloggerMapper.insertSelective(record) > 0)
//            return 1;
//        System.out.println("失败");
//        return 0;
//    }

    @Override
    public int updateByPrimaryKeySelective(Blogger record) {
//        System.out.println("更新博主信息通过id----只需填写部分信息");
//        if (bloggerMapper.updateByPrimaryKeySelective(record) > 0)
//            return 1;
//        System.out.println("失败");
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Blogger record) {
//        System.out.println("更新博主信息不能有空值");
//        if (bloggerMapper.updateByPrimaryKeySelective(record) > 0)
//            return 1;
//        System.out.println("失败");
        return 0;
    }
}
