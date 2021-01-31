package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linkai.dto.IndexPushNewDto;
import com.linkai.entity.PushImg;
import com.linkai.entity.PushNew;
import com.linkai.mapper.ImgMapper;
import com.linkai.mapper.PushImgMapper;
import com.linkai.mapper.PushNewMapper;
import com.linkai.service.PushNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author yamon
 * @since 2020-10-28
 */
@Service
public class PushNewServiceImpl extends ServiceImpl<PushNewMapper, PushNew> implements PushNewService {
    @Autowired
    private PushNewMapper pushNewMapper;
    @Autowired
    private PushImgMapper pushImgMapper;
    @Autowired
    private ImgMapper imgMapper;

    /**
     * 保存推送商品和商品id
     *
     * @param title   标题
     * @param desc    描述
     * @param product 商品
     * @return flag
     */
    @Override
    @Deprecated
    public boolean savePushNewInfoAndProduct(String title, String desc, Integer[] product) {

        return false;
    }

    /**
     * 展示所有的推新商品
     *
     * @return list
     */
    @Override
    public List<IndexPushNewDto> listAllPushNewProduct() {

        return pushNewMapper.listAllPushNewProduct();
    }

    /**
     * 展示单个推新商品
     *
     * @param pushId pushId
     * @return object
     */
    @Override
    public IndexPushNewDto getPushNewByPushId(Integer pushId) {
        final PushNew pushNew = pushNewMapper.selectById(pushId);
        //set
        final IndexPushNewDto indexPushNewDto = new IndexPushNewDto();
        indexPushNewDto.setPushId(pushNew.getPushId())
                .setPushDesc(pushNew.getPushDesc())
                .setPushTitle(pushNew.getPushTitle())
                .setCreateTime(pushNew.getCreateTime());
        //根据pushId得到imgIds 然后存到list中
        final QueryWrapper<PushImg> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("push_id", pushId);
        final List<PushImg> pushImgs = pushImgMapper.selectList(queryWrapper);
        List<Integer> imgIds  = new ArrayList<>();
        pushImgs.forEach(pushImg ->{
            imgIds.add(pushImg.getImgId());
        });
        imgIds.forEach(imgId->{
            indexPushNewDto.getImgs().add(imgMapper.selectById(imgId).getImgUrl());
        });
        return indexPushNewDto;
    }
}
