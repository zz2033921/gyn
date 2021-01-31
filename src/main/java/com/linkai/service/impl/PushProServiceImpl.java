package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linkai.entity.PushPro;
import com.linkai.mapper.ProductMapper;
import com.linkai.mapper.PushProMapper;
import com.linkai.service.PushProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author yamon
 * @since 2020-10-19
 */
@Service
public class PushProServiceImpl extends ServiceImpl<PushProMapper, PushPro> implements PushProService {
    @Autowired
    private PushProMapper pushProMapper;
    @Autowired
    private ProductMapper productMapper;
    /**
     * 获得对应商品名称
     *
     * @param pushId pushId
     * @return list
     */
    @Override
    public List<String> getProductNameByPushId(Integer pushId) {
        final QueryWrapper<PushPro> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("push_id",pushId);
        final List<PushPro> list = pushProMapper.selectList(queryWrapper);
        List<String> productName = new ArrayList<>();
        list.forEach(pushPro -> {
            productName.add(productMapper.selectOneProductByProId(pushPro.getProId()).getProTitle());
        });
        return productName;
    }
}
