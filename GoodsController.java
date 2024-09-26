package com.eagles.ssm.controller;

import com.eagles.ssm.pojo.Goods;
import com.eagles.ssm.service.BrandService;
import com.eagles.ssm.service.GoodsService;
import com.eagles.ssm.utils.PageUtils;
import com.eagles.ssm.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @Autowired
    private PageUtils pageUtils;

    @Autowired
    private BrandService brandService;

    @RequestMapping("list")
    public String findGoodsList(Model model, GoodsVo goodsVo) {

        HashMap<String, Object> map = new HashMap<>();

        if (goodsVo.getLikeName() != null && !goodsVo.getLikeName().equals("")) {

            map.put("likeName", goodsVo.getLikeName().trim());

        }

        if (goodsVo.getUpTimeStart() != null && !goodsVo.getUpTimeStart().trim().equals("")) {

            if (goodsVo.getUpTimeEnd() != null && !goodsVo.getUpTimeEnd().trim().equals("")) {
                map.put("upTimeEnd", goodsVo.getUpTimeEnd().trim());
                map.put("upTimeStart", goodsVo.getUpTimeStart().trim());
            }
        }

        if (goodsVo.getBrandId() != null && !goodsVo.getBrandId().trim().equals("")) {

            map.put("brandId", goodsVo.getBrandId().trim());

        }

        pageUtils.initPage(goodsVo.getCurrentPage(), 4, goodsService.getCount(map));

        map.put("indexStart", pageUtils.getIndexStart());
        map.put("pageSize", pageUtils.getPageSize());

        List<Goods> goodsList = goodsService.findGoodsList(map);

        model.addAttribute("brandList", brandService.getBrandList());
        model.addAttribute("goodsList", goodsList);
        model.addAttribute("pageUtils", pageUtils);
        model.addAttribute("goodsVo", goodsVo);

        return "goods-list";
    }

    @RequestMapping("toInsertGoods")
    public String toInsertGoods() {

        return "goods-insert";

    }

    @RequestMapping("insertGoods")
    @ResponseBody
    public String insertGoods(Goods goods) {

        Goods goods1 = goodsService.findGoodsByName(goods.getGoodsName());

        if (goods1 == null) {

            Integer num = goodsService.insertGoods(goods);

            return num == 1 ? "1" : "3";

        } else {

            Integer num = goodsService.countRaise(goods.getGoodsName());
            return num == 1 ? "2" : "4";

        }

    }


}
