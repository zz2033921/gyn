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
 * @since 2020-09-17
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="ProColor对象", description="")
public class ProColor implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "主键id")
      @TableId(value = "pro_color_id", type = IdType.AUTO)
    private Integer proColorId;

    @ApiModelProperty(value = "颜色id")
    private Integer colorId;

    @ApiModelProperty(value = "商品id")
    private Integer proId;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;


}
