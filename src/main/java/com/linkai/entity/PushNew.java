package com.linkai.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 
 * </p>
 *
 * @author yamon
 * @since 2020-10-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="PushNew对象", description="")
public class PushNew implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "推新历史主键")
      @TableId(value = "push_id", type = IdType.AUTO)
    private Integer pushId;

    @ApiModelProperty(value = "推新历史标题")
    private String pushTitle;

    @ApiModelProperty(value = "推新历史描述")
    private String pushDesc;

    @ApiModelProperty(value = "创建时间")
      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;


}
