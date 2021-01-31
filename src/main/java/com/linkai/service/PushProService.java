package com.linkai.service;

import com.linkai.entity.PushPro;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yamon
 * @since 2020-10-19
 */
public interface PushProService extends IService<PushPro> {
    /**
     * 获得对应商品名称
     * @param pushId pushId
     * @return list
     */
    List<String> getProductNameByPushId(Integer pushId);
}
