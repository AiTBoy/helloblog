package com.helloblog.service.serviceimp;

import com.helloblog.dao.RemarkMapper;
import com.helloblog.domain.Remark;
import com.helloblog.service.RemarkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class RemarkServiceImp implements RemarkService {

    @Autowired
    RemarkMapper remarkMapper;

    @Override
    public int addOneRemark(Remark remark) {
        int randomId = 0;
        do{
            randomId = UUID.randomUUID().hashCode()>>2;  //这里随机产生一个blogerid
            System.out.println("remarkid" + randomId);
        } while (remarkMapper.remarkid(randomId) != 0);//检查该id是否已经存在过

        remark.setRemarkid(randomId);

        if(remarkMapper.insertOneRemark(remark) > 0){
            return 1;
        }

        return 0;
    }

    @Override
    public List<Remark> getAllRemarks(Integer artid) {
        return remarkMapper.selectremarks(artid);
    }

    @Override
    public List<Remark> getAllRemarksByBlogid(Integer blogid) {
        return remarkMapper.selectremarksbyblogid(blogid);
    }

    @Override
    public int giveALike(Integer remarkid) {
        return remarkMapper.addOneLikeOfRemark(remarkid);
    }

    @Override
    public Integer getOneRemarkLike(Integer remarkid) {
        return remarkMapper.selectOneRemarkLike(remarkid);
    }

    @Override
    public int removeOneRemark(Integer remarkid) {
        return remarkMapper.deleteOneRemark(remarkid);
    }


    @Override
    public int deleteByPrimaryKey(Integer remarkid) {
        return 0;
    }

    @Override
    public int insert(Remark record) {
        return 0;
    }

    @Override
    public int insertSelective(Remark record) {
        return 0;
    }

    @Override
    public Remark selectByPrimaryKey(Integer remarkid) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Remark record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Remark record) {
        return 0;
    }
}
