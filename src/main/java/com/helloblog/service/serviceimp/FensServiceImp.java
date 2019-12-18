package com.helloblog.service.serviceimp;

import com.helloblog.dao.FensMapper;
import com.helloblog.domain.Fens;
import com.helloblog.service.FensService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FensServiceImp implements FensService {

    @Autowired
    FensMapper fensMapper;

    @Override
    public int addCare(Fens fens) {
        return fensMapper.insertCare(fens);
    }

    @Override
    public int removeCare(Fens fens) {
        return fensMapper.deleteCare(fens);
    }

    @Override
    public List<Integer> getAllFens(Integer blogid) {
        return fensMapper.selectAllFensid(blogid);
    }

    @Override
    public List<Integer> getAllCare(Integer blogid) {
        return fensMapper.selectAllCareid(blogid);
    }

    @Override
    public int isExitOneFens(Fens fens) {
        return fensMapper.isFens(fens);
    }

}
