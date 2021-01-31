package com.linkai.enums;

/**
 * @Created by Intellij IDEA.
 * @author: 陈亚萌
 * @Date: 2020/1/19
 */
public enum CustomizeErrorCode implements ICustomizeErrorCode{
    /**
     * 通用模块
     */
    SUCCESS_SAVE_INFO(1000,"保存成功"),
    FAIL_SAVE_INFO(1001,"保存失败"),
    SUCCESS_UPDATE_INFO(1002,"修改成功"),
    FAIL_UPDATE_INFO(1003,"修改失败！"),
    SUCCESS_DELETE_INFO(1004,"删除成功"),
    FAIL_DELETE_INFO(1005,"删除失败"),
    SUCCESS_REQUEST_INFO(1006,"请求成功"),
    FAIL_REQUEST_INFO(1007,"请求失败"),
    SUCCESS_UPLOAD_INFO(1008,"上传成功"),
    FAIL_UPLOAD_INFO(1009,"上传失败"),
    /*
    * 异常控制模块
    * */
    UNKNOWN_ERROR(2000,"未知名错误"),
    NO_NUMBER_MATCH(6000,"没有匹配项"),

    /**
     * 前台模块
     *
     * */
    PASSWORD_HAD_EXIST(2001,"密码已经存在"),
    PASSWORD_IS_EMPTY(2002,"密码为空，请重新输入"),
    OLD_PW_NEW_IS_EMPTY(2003,"参数有误，请重新输入"),
    PASSWORD_WRONG(2004,"密码输入错误"),
    TEL_NO_EXIST(2005,"您没有添加手机号，是否前往添加！"),
    TEL_WRONG(2006,"手机号错误，请重新输入"),
    /**
     * 管理员模块
     *
     * */
    ;

    private Integer code;
    private String message;
    CustomizeErrorCode(Integer code, String message) {
        this.message = message;
        this.code=code;
    }
    @Override
    public String getMessage() {
        return message;
    }

    @Override
    public Integer getCode() {
        return code;
    }
}
