package com.linkai.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @Author yamon
 * @Date 2020-10-26 19:47
 * @Description
 * @Version 1.0
 */
@Data
public class AdminProductIdAndNameDto implements Serializable {
    private Integer proId;
    private String proTitle;
}
