package com.eagles.ssm.pojo;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@Data
public class Goods {
    private Integer gid;
    private String goodsName;
    private Double price;
    private String upTime;
    private Integer brandId;
    private Integer cateId;
    private String goodsDesc;
    private Integer num;
    private Brand brand;
    private Cate cate;
}
