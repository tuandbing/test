package com.eagles.ssm.utils;

import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Getter
@Setter
@Component
public class PageUtils {

    //当前页
    private String currentPage;
    //上一页
    private Integer prevPage;
    //下一页
    private Integer nextPage;
    //尾页、总页数
    private Integer lastPage;
    //分页单位
    private Integer pageSize;
    //起始索引位置
    private Integer indexStart;
    //总记录条数
    private Integer count;

    public void initPrevPage(){
      this.prevPage = this.currentPage.equals("1") ? 1 :Integer.parseInt(this.currentPage) - 1;
    }
    public void initNextPage(){
        this.nextPage = this.currentPage.equals(lastPage+"") ? lastPage :Integer.parseInt(this.currentPage) + 1;
    }
    public void initLastPage(){
        this.lastPage = this.count % pageSize == 0 ? this.count / this.pageSize : (this.count / this.pageSize) + 1;
    }
    public void initIndexStart(){
        this.indexStart = (Integer.parseInt(this.currentPage) - 1) * this.pageSize;
    }
    public void initPage(String currentPage,Integer pageSize,Integer count){
        this.currentPage = currentPage == null || currentPage.equals("") ? "1" : currentPage;
        this.pageSize = pageSize;
        this.count = count;
        this.initLastPage();
        this.initPrevPage();
        this.initNextPage();
        this.initIndexStart();

    }



}
