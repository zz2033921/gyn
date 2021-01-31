package com.linkai.enums;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author: JS
 * @date: 2019/2/9
 * @description: 响应状态
 */
@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum ResponseStatus {

    /**
     * 处理失败
     *
     * */
    FAILED(-1,"failed"),

    /**
     * 处理成功
     *
     * */
    SUCCESS(1,"success"),
    ;

    /**
     * 状态码
     * */
    private final int statusCode;

    /**
     * 状态描述
     * */
    private final String statusDesc;

    ResponseStatus(int statusCode, String statusDesc) {
        this.statusCode = statusCode;
        this.statusDesc = statusDesc;
    }

    public int getStatusCode(){return this.statusCode;}

    public String getStatusDesc(){return this.statusDesc;}

}