package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.ProSize;
import com.linkai.mapper.ProSizeMapper;
import com.linkai.service.ProSizeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yamon
 * @since 2020-09-17
 */
@Service
public class ProSizeServiceImpl extends ServiceImpl<ProSizeMapper, ProSize> implements ProSizeService {

    @Autowired
    private ProSizeMapper proSizeMapper;

    @Override
    public List<ProSize> selectBySizeId(Integer sizeId) {
        QueryWrapper<ProSize> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("size_id", sizeId);
        return proSizeMapper.selectList(queryWrapper);

    }

    @Override
    public void removeBySizeId(Integer sizeId) {
        final QueryWrapper<ProSize> wrapper = new QueryWrapper<>();
        wrapper.eq("size_id",sizeId);
        proSizeMapper.delete(wrapper);
    }
}
