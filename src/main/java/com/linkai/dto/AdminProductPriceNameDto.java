package com.linkai.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @Author yamon
 * @Date 2020-10-05 20:23
 * @Description
 * @Version 1.0
 */
@Data
public class AdminProductPriceNameDto {
    private Integer proId;
    private String proTitle;
    private BigDecimal proPrice;
    private BigDecimal proSalePrice;
    private Integer proSalePercent;
}
