package com.linkai.service;

import com.linkai.entity.ProColor;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author yamon
 * @since 2020-09-17
 */
public interface ProColorService extends IService<ProColor> {

    List<ProColor> selectBySizeId(Integer colorId);

    void removeBySizeId(Integer colorId);

}
