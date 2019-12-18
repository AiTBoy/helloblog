package com.helloblog.service.serviceimp;

import com.helloblog.domain.Signtime;
import com.helloblog.domain.SigntimeKey;
import com.helloblog.service.SigntimeService;

public class SigntimeServiceImp implements SigntimeService {
    @Override
    public int deleteByPrimaryKey(SigntimeKey key) {
        return 0;
    }

    @Override
    public int insert(Signtime record) {
        return 0;
    }

    @Override
    public int insertSelective(Signtime record) {
        return 0;
    }

    @Override
    public Signtime selectByPrimaryKey(SigntimeKey key) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Signtime record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Signtime record) {
        return 0;
    }
}
