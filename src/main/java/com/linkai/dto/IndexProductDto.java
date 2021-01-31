package com.linkai.dto;

import com.linkai.entity.Img;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * @Author yamon
 * @Date 2020-09-18 19:09
 * @Description
 * @Version 1.0
 */
@Data
public class IndexProductDto implements Serializable {
    private Integer proId;
    private String proTitle;
//    private String proTitle;
    private BigDecimal proPrice;
    private Integer proNumber;
    private Boolean proIsHot;
    private Integer proCount;
    private Boolean proIsNew;
    private Boolean proIsOnSale;
    private Integer proSalePercent;
    private BigDecimal proSalePrice;
    private String proBrand;
    private Date createTime;
    private Date updateTime;
    private List<Img> imgList;
}
