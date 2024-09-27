package com.eagles.ssm.service.impl;

import com.eagles.ssm.mapper.CateMapper;
import com.eagles.ssm.pojo.Cate;
import com.eagles.ssm.service.CateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CateServiceImpl implements CateService {

    @Autowired
    private CateMapper cateMapper;

    @Override
    public List<Cate> getCateList() {
        return cateMapper.getCateList();
    }
}
