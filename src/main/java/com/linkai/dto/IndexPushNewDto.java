package com.linkai.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author yamon
 * @Date 2020-11-04 20:05
 * @Description
 * @Version 1.0
 */
@Data
@Accessors(chain = true)
public class IndexPushNewDto implements Serializable {

    private Integer pushId;


    private String pushTitle;

    private String pushDesc;


    private Date createTime;


    private List<String> imgs = new ArrayList<>();


}
