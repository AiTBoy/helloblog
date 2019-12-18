package com.helloblog.dao;

import com.helloblog.domain.Blogger;

import java.util.List;
import java.util.Map;

public interface BloggerMapper {

    //验证登陆用户是否正确(返回匹配到的blogid)
    Integer username_password(Map<String , Object> map);

    //检擦某BlogId在数据中是否存在
    int blogid(int blogid);

    //向数据库中增加用户
    int insert(Blogger record);

    //通过blogid 查询唯一一个博主
    Blogger selectOneBlogger(Integer blogid);

    //修改blogger在数据库中的信息
    int updateBlogger(Blogger blogger);

    //查找到所有用户信息
    List<Blogger> selectAllBlogger();


    int deleteOneBlogger(Integer blogid);



//    int insertSelective(Blogger record);

//    Blogger selectByPrimaryKey(Integer blogid);
//
//    int updateByPrimaryKeySelective(Blogger record);
//
//    int updateByPrimaryKey(Blogger record);
}