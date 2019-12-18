package com.helloblog.dao;

import com.helloblog.domain.Signtime;
import com.helloblog.domain.SigntimeKey;

public interface SigntimeMapper {
    int deleteByPrimaryKey(SigntimeKey key);

    int insert(Signtime record);

    int insertSelective(Signtime record);

    Signtime selectByPrimaryKey(SigntimeKey key);

    int updateByPrimaryKeySelective(Signtime record);

    int updateByPrimaryKey(Signtime record);
}