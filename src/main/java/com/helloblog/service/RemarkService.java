package com.helloblog.service;

import com.helloblog.domain.Remark;

import java.util.List;

public interface RemarkService {
    //添加一条评论
    int addOneRemark(Remark remark);

    //通过文章id查询该文章所有评论
    List<Remark> getAllRemarks(Integer artid);

    //通过blogid查询该文章所有评论
    List<Remark> getAllRemarksByBlogid(Integer blogid);

    //给某条评论增加一个赞
    int giveALike(Integer remarkid);

    //后去某条评论的点赞数量
    Integer getOneRemarkLike(Integer remarkid);

    //删除一条评论
    int removeOneRemark(Integer remarkid);




    int deleteByPrimaryKey(Integer remarkid);

    int insert(Remark record);

    int insertSelective(Remark record);

    Remark selectByPrimaryKey(Integer remarkid);

    int updateByPrimaryKeySelective(Remark record);

    int updateByPrimaryKey(Remark record);
}
