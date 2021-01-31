package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.ProColor;
import com.linkai.mapper.ProColorMapper;
import com.linkai.service.ProColorService;
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
public class ProColorServiceImpl extends ServiceImpl<ProColorMapper, ProColor> implements ProColorService {
    @Autowired
    private ProColorMapper proColorMapper;
    @Override
    public List<ProColor> selectBySizeId(Integer colorId) {
        QueryWrapper<ProColor> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("col_id", colorId);
        return proColorMapper.selectList(queryWrapper);
    }

    @Override
    public void removeBySizeId(Integer colorId) {
        final QueryWrapper<ProColor> wrapper = new QueryWrapper<>();
        wrapper.eq("col_id",colorId);
        proColorMapper.delete(wrapper);
    }
}
