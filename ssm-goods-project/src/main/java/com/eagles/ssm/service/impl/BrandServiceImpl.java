package com.eagles.ssm.service.impl;

import com.eagles.ssm.mapper.BrandMapper;
import com.eagles.ssm.pojo.Brand;
import com.eagles.ssm.pojo.Cate;
import com.eagles.ssm.service.BrandService;
import com.eagles.ssm.service.CateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {

    @Autowired
    private BrandMapper brandMapper;

    List<Brand> brandList = new ArrayList<>();

    @Override
    public List<Brand> getBrandList() {

        if(brandList.size() > 0){
            return brandList;
        }else{
            brandList.addAll(brandMapper.getBrandList());
        }

        return brandList;
    }
}
