package com.linkai.service;

import com.linkai.entity.ProSize;
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
public interface ProSizeService extends IService<ProSize> {

    List<ProSize> selectBySizeId(Integer sizeId);

    void removeBySizeId(Integer sizeId);
}
