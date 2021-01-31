
package com.linkai.controller.admin;
import com.linkai.enums.CustomizeErrorCode;
import com.linkai.enums.ResultDTO;

/**
 * @Author yamon
 * @Date 2020-09-06 8:48
 * @Description 包含所有的返回信息，只要继承这个类就可以获得方法
 * @Version 1.0
 */
public class BaseController {

    /**
     * 设置请求成功、失败消息
     * @param t 传进来的类
     * @param <T> 泛型类
     * @return t
     */
    public <T> ResultDTO<T> requestInfo(T t) {
        ResultDTO<T> resultDTO = new ResultDTO<>();
        if (t !=null){
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_REQUEST_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_REQUEST_INFO.getMessage());
        }else{
            resultDTO.setCode(CustomizeErrorCode.FAIL_REQUEST_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_REQUEST_INFO.getMessage());
        }
        resultDTO.setData(t);
        return resultDTO;
    }

    /**
     * 设置请求成功、失败消息
     * @param t 传进来的类
     * @param <T> 泛型类
     * @return t
     */
    public <T> ResultDTO<T> returnObject4SaveInfo(T t) {
        ResultDTO<T> resultDTO = new ResultDTO<>();
        if (t !=null){
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_SAVE_INFO.getMessage());
        }else{
            resultDTO.setCode(CustomizeErrorCode.FAIL_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_SAVE_INFO.getMessage());
        }
        resultDTO.setData(t);
        return resultDTO;
    }

    /**
     * 返回保存的信息
     * @param flag flag
     * @return result
     */
    public ResultDTO<Boolean> successSaveInfo(Boolean flag){
        ResultDTO<Boolean> resultDTO = new ResultDTO<>();
        if (flag) {
            //更新成功
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_SAVE_INFO.getMessage());
        } else {
            resultDTO.setCode(CustomizeErrorCode.FAIL_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_SAVE_INFO.getMessage());
        }
        resultDTO.setData(flag);
        return resultDTO;
    }


    /**
     * 返回保存的信息
     * @param flag flag
     * @return result
     */
    public <T> ResultDTO<T> getReturnValueSaveInfo(Boolean flag,T t){
        ResultDTO<T> resultDTO = new ResultDTO<>();
        if (flag) {
            //更新成功
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_SAVE_INFO.getMessage());
        } else {
            resultDTO.setCode(CustomizeErrorCode.FAIL_SAVE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_SAVE_INFO.getMessage());
        }
        resultDTO.setData(t);
        return resultDTO;
    }

    /**
     * 删除成功的信息
     * @param flag flag
     * @return result
     */
    public ResultDTO<Boolean> successDeleteInfo(Boolean flag){
        ResultDTO<Boolean> resultDTO = new ResultDTO<>();
        if (flag) {
            //更新成功
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_DELETE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_DELETE_INFO.getMessage());
        } else {
            resultDTO.setCode(CustomizeErrorCode.FAIL_DELETE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_DELETE_INFO.getMessage());
        }
        resultDTO.setData(flag);
        return resultDTO;
    }

    /**
     * 更新信息
     * @param flag 是否成功
     * @return true 成功，false 失败
     */
    public ResultDTO<Boolean> updateInfo(Boolean flag){
        ResultDTO<Boolean> resultDTO = new ResultDTO<>();
        if (flag) {
            //更新成功
            resultDTO.setCode(CustomizeErrorCode.SUCCESS_UPDATE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.SUCCESS_UPDATE_INFO.getMessage());
        } else {
            resultDTO.setCode(CustomizeErrorCode.FAIL_UPDATE_INFO.getCode());
            resultDTO.setMessage(CustomizeErrorCode.FAIL_UPDATE_INFO.getMessage());
        }
        resultDTO.setData(flag);
        return resultDTO;
    }
}
