package com.helloblog.service;

import com.helloblog.domain.Fens;
import java.util.List;

public interface FensService {

    //增加关注的人
    int addCare(Fens fens);

    //删除所关注的人
    int removeCare(Fens fens);

    //查找id的所有粉丝id
    List<Integer> getAllFens(Integer blogid);

    //查找id所关注的所有人的id
    List<Integer> getAllCare(Integer blogid);

    //查找某个Fens对象是否存在
    int isExitOneFens(Fens fens);

}
