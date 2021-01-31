package com.linkai.exception;


import com.linkai.enums.ICustomizeErrorCode;
import lombok.Getter;

/**
 * @Created by Intellij IDEA.
 * @author: 陈亚萌
 * @Date: 2020/2/10
 * @Desciption:自定义异常类
 */
@Getter
public class CustomizeException extends RuntimeException {
    private String message;
    private Integer code;
    public CustomizeException(ICustomizeErrorCode errorCode){
        this.code=errorCode.getCode();
        this.message=errorCode.getMessage();
    }

}
