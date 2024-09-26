package com.eagles.ssm.controller;

import com.eagles.ssm.pojo.Brand;
import com.eagles.ssm.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("brand")
public class BrandController {

    @Autowired
    private BrandService brandService;

    @RequestMapping("findBrandAll")
    @ResponseBody
    public List<Brand> findBrandAll(){

        return brandService.getBrandList();

    }

}
