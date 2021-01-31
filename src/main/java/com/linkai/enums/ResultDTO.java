package com.linkai.enums;

import com.linkai.exception.CustomizeException;
import lombok.Data;

/**
 * @Created by Intellij IDEA.
 * @author: 陈亚萌
 * @Date: 2020/2/10
 */
@Data
public class ResultDTO<T> {
    private Integer code;
    private String message;
    private T data;
    public static ResultDTO errorOf(Integer code, String message){
        ResultDTO resultDTO=new ResultDTO();
        resultDTO.setCode(code);
        resultDTO.setMessage(message);
        return resultDTO;
    }

    /**
     * 一般的response提示（例如：用户未登录）
     * @param noLogin
     * @return
     */
    public static Object errorOf(CustomizeErrorCode noLogin){
        return errorOf(noLogin.getCode(),noLogin.getMessage());
    }

    /**
     * 请求成功，但是不返回数据
     * @return 实体类
     */
    public static ResultDTO okOf(){
        ResultDTO resultDTO=new ResultDTO();
        resultDTO.setCode(200);
        resultDTO.setMessage("请求成功");
        return resultDTO;
    }

    /**
     * 请求成功后，返回数据，接收参数用户自定义
     * @param t
     * @param <T>
     * @return
     */
    public static <T> ResultDTO okOf(T t){
        ResultDTO resultDTO=new ResultDTO();
        resultDTO.setCode(200);
        resultDTO.setMessage("请求成功");
        resultDTO.setData(t);
        return resultDTO;
    }
    public static ResultDTO errorOf(CustomizeException ex){
        return errorOf(ex.getCode(),ex.getMessage());
    }


}
