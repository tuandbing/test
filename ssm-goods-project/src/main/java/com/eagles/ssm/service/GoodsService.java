package com.eagles.ssm.service;

import com.eagles.ssm.pojo.Goods;

import java.util.HashMap;
import java.util.List;

public interface GoodsService {

    List<Goods> findGoodsList(HashMap<String,Object> map);

    Integer getCount(HashMap<String, Object> map);

    Goods findGoodsByName(String goodsName);

    Integer insertGoods(Goods goods);

    Integer countRaise(String goodsName);
}
