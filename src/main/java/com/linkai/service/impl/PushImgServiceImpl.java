package com.linkai.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.linkai.entity.Img;
import com.linkai.entity.PushImg;
import com.linkai.mapper.ImgMapper;
import com.linkai.mapper.PushImgMapper;
import com.linkai.service.PushImgService;
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
public class PushImgServiceImpl extends ServiceImpl<PushImgMapper, PushImg> implements PushImgService {
    @Autowired
    private PushImgMapper pushImgMapper;
    @Autowired
    private ImgMapper imgMapper;
    /**
     * 根据PushId得到Img类
     *
     * @param pushId pushId
     * @return lsit
     */
    @Override
    public List<Img> getImgsByPushId(Integer pushId) {
        final QueryWrapper<PushImg> pushImgQueryWrapper = new QueryWrapper<>();
        pushImgQueryWrapper.eq("push_id",pushId);
        final List<PushImg> pushImgs = pushImgMapper.selectList(pushImgQueryWrapper);
        //得到imgList
        List<Img> imgList = new ArrayList<>();
        pushImgs.forEach(pushImg -> {
            imgList.add(imgMapper.selectById(pushImg.getImgId()));
        });
        return imgList;
    }
}
