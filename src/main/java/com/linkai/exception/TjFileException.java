package com.linkai.exception;

/**
 * @author Julia Jiang
 * @date 2019/10/10 9:42
 * @description
 */
public class TjFileException extends Exception{
    private Integer code;

    public TjFileException(String message, Integer code){
        super(message);
        this.code = code;
    }

    public Integer getCode(){
        return code;
    }

    public void setCode(Integer code){
        this.code = code;
    }
}
