package com.linkai.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author yamon
 * @since 2020-10-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Product对象", description="")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "产品id，主键")
      @TableId(value = "pro_id", type = IdType.AUTO)
    private Integer proId;

    @ApiModelProperty(value = "产品名称")
    private String proTitle;

    @ApiModelProperty(value = "产品价格")
    private BigDecimal proPrice;

    @ApiModelProperty(value = "库存量")
    private Integer proNumber;

    @ApiModelProperty(value = "产品分类")
    private Integer catId;

    @ApiModelProperty(value = "是否热门")
    private Boolean proIsHot;

    @ApiModelProperty(value = "点击量")
    private Integer proCount;

    @ApiModelProperty(value = "是否新品")
    private Boolean proIsNew;

    @ApiModelProperty(value = "商品是否打折")
    private Boolean proIsOnSale;

    @ApiModelProperty(value = "促销价")
    private BigDecimal proSalePrice;

    @ApiModelProperty(value = "首页展示图")
    private String proIndexImg;

    @ApiModelProperty(value = "商品品牌")
    private String proBrand;

    @ApiModelProperty(value = "商品描述")
    private String proDesc;

    @ApiModelProperty(value = "打折折率")
    private Integer proSalePercent;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;

    @ApiModelProperty(value = "产品更新时间")
      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "产品创建时间")
      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "是否是首页商品")
    private Integer proIsIndex;

    @ApiModelProperty(value = "首图更新时间")
    private Date proIsIndexImgUpdateTime;


}
