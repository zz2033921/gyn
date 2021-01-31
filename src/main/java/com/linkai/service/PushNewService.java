package com.linkai.service;

import com.linkai.dto.IndexPushNewDto;
import com.linkai.entity.PushNew;
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
public interface PushNewService extends IService<PushNew> {
    /**
     * 保存推送商品和商品id
     * @param title 标题
     * @param desc 描述
     * @param product 商品
     * @return flag
     */
    boolean savePushNewInfoAndProduct(String title, String desc, Integer[] product);

    /**
     * 展示所有的推新商品
     * @return list
     */
    List<IndexPushNewDto> listAllPushNewProduct();

    /**
     * 展示单个推新商品
     * @param pushId pushId
     * @return object
     */
    IndexPushNewDto getPushNewByPushId(Integer pushId);
}
