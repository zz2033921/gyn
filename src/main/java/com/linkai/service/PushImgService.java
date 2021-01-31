package com.linkai.service;

import com.linkai.entity.Img;
import com.linkai.entity.PushImg;
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
public interface PushImgService extends IService<PushImg> {
    /**
     * 根据PushId得到Img类
     * @param pushId pushId
     * @return lsit
     */
    List<Img> getImgsByPushId(Integer pushId);
}
