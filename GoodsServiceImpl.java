package com.eagles.ssm.service.impl;

import com.eagles.ssm.mapper.GoodsMapper;
import com.eagles.ssm.pojo.Goods;
import com.eagles.ssm.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;

    private Date date = new Date();

    @Override
    public List<Goods> findGoodsList(HashMap<String, Object> map) {
        return goodsMapper.findGoodsList(map);
    }

    @Override
    public Integer getCount(HashMap<String, Object> map) {
        return goodsMapper.getCount(map);
    }

    @Override
    public Goods findGoodsByName(String goodsName) {
        return goodsMapper.findGoodsByName(goodsName);
    }

    @Override
    public Integer insertGoods(Goods goods) {

        goods.setUpTime(date.toString());

        return goodsMapper.insertGoods(goods);
    }

    @Override
    public Integer countRaise(String goodsName) {
        return goodsMapper.countRaise(goodsName);
    }
}
