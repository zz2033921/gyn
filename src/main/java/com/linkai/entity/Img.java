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
 * @since 2020-09-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value="Img对象", description="")
public class Img implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "图像id")
      @TableId(value = "img_id", type = IdType.AUTO)
    private Integer imgId;

    @ApiModelProperty(value = "图片名称")
    private String imgTitle;

    @ApiModelProperty(value = "图片后缀名")
    private String imgType;

    @ApiModelProperty(value = "图片大小")
    private Double imgSize;

    @ApiModelProperty(value = "图片保存路径")
    private String imgUrl;

    @ApiModelProperty(value = "图片下载次数")
    private Integer imgDownloadCount;

    @ApiModelProperty(value = "产品id")
    private Integer proId;

    @ApiModelProperty(value = "创建时间")
      @TableField(fill = FieldFill.INSERT)
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
      @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "服务器地址")
    private String imgLocalUrl;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic
    private Integer deleted;


}
