package com.linkai.dto;

import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * @Author yamon
 * @Date 2020-09-17 20:09
 * @Description
 * @Version 1.0
 */
@Data
public class AdminProductDto implements Serializable {
    private Integer proId;

    private String proTitle;

    private BigDecimal proPrice;

    private Integer proNumber;

    private Integer proCount;

    private Integer catId;
    private String categoryDesc;
    private Date createTime;
    private Date updateTime;
}
