package com.linkai.dto;

import com.linkai.entity.Color;
import com.linkai.entity.Img;
import com.linkai.entity.Size;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author yamon
 * @Date 2020-09-20 19:51
 * @Description 商品详情页
 * @Version 1.0
 */
@Data
public class ProductDetailDto implements Serializable {
    private Integer proId;
    private String proTitle;
    private BigDecimal proPrice;

    private Integer proNumber;
    private Boolean proIsHot;
    private Boolean proIsNew;
    private BigDecimal proSalePrice;
    /**
     * 流行程度,点击量
     */
    private Integer proCount;
    /**
     * 商品品牌名称
     */
    private String proBrand;
    /**
     * 商品简要描述
     */
    private String proDesc;

    private List<Img> imgList = new ArrayList<>();
    private List<Size> sizeList = new ArrayList<>();
    private List<Color> colorList = new ArrayList<>();

}
