package com.linkai.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.Version;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableField;
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
 * @since 2020-09-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Size对象", description="")
public class Size implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "尺寸主键id")
      @TableId(value = "size_id", type = IdType.AUTO)
    private Integer sizeId;

    @ApiModelProperty(value = "尺寸描述")
    private String sizeDesc;

      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;


}
