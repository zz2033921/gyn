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
 * @since 2020-09-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Platform对象", description="")
public class Platform implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "商品服务平台")
      @TableId(value = "plat_id", type = IdType.AUTO)
    private Integer platId;

    @ApiModelProperty(value = "服务平台名称")
    private String platName;

    @ApiModelProperty(value = "服务平台简介")
    private String platDesc;

      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;

    @ApiModelProperty(value = "网站url")
    private String platUrl;


}
