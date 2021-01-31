package com.linkai.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.linkai.dto.IndexPushNewDto;
import com.linkai.entity.PushNew;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author yamon
 * @since 2020-10-28
 */
@Repository
public interface PushNewMapper extends BaseMapper<PushNew> {

    List<IndexPushNewDto> listAllPushNewProduct();

    IndexPushNewDto getOnePushNewByPushId(Integer pushId);
}
