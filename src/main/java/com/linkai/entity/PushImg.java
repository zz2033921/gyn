package com.linkai.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author yamon
 * @since 2020-10-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PushImg对象", description="")
public class PushImg implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键")
      @TableId(value = "push_img_id", type = IdType.AUTO)
    private Integer pushImgId;

    @ApiModelProperty(value = "推新历史主键")
    private Integer pushId;

    @ApiModelProperty(value = "图片id")
    private Integer imgId;

    @ApiModelProperty(value = "逻辑删除	")
    @TableLogic
    private Integer deleted;


}
