package com.helloblog.dao;

import com.helloblog.domain.Fens;

import java.util.List;

public interface FensMapper {
    //向数据库添加关注的人
    int insertCare(Fens fens);

    //向数据库删除所关注的人
    int deleteCare(Fens fens);

    //查找id的所有粉丝id
    List<Integer> selectAllFensid(Integer blogid);

    //查找id所关注的所有人的id
    List<Integer> selectAllCareid(Integer blogid);

    //查看某个fensid和careid在数据库中是否已经存在
    int isFens(Fens fens);

}
