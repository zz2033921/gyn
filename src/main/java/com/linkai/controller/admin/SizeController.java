package com.linkai.controller.admin;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.ProSize;
import com.linkai.entity.Size;
import com.linkai.enums.ResultDTO;
import com.linkai.service.ProSizeService;
import com.linkai.service.SizeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSetMetaData;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author yamon
 * @since 2020-09-07
 */
@Controller
@RequestMapping("/admin/size")
public class SizeController extends BaseController {
    @Autowired
    private SizeService sizeService;

    @Autowired
    private ProSizeService proSizeService;



    /**
     * 查找所有的尺寸大小
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public List<Size> listAll() {
        return sizeService.list();
    }

    /**
     * 保存size大小
     *
     * @return boolean
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveSize(String sizeDesc) {
        final Size entity = new Size();
        entity.setSizeDesc(sizeDesc);
        final boolean save = sizeService.save(entity);
        //保存外键
        return super.successSaveInfo(save);
    }

    /**
     * 得到一个size对象
     * @param sizeId size
     * @return size
     */
    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Size> getOne(@RequestParam(value = "sizeId") Integer sizeId) {
        final Size byId = sizeService.getById(sizeId);
        return super.requestInfo(byId);
    }

    /**
     * 更新一个size
     * @param size size
     * @return szie
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> update(@ModelAttribute Size size){
        final boolean b = sizeService.updateById(size);
        return super.updateInfo(b);
    }

    /**
     * 删除一条尺寸信息
     * @param sizeId sizeId
     * @return sizeId
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Boolean> delete(Integer sizeId){
        List<ProSize> proSizes = proSizeService.selectBySizeId(sizeId);
        if (!proSizes.isEmpty()){
            //删除sizeId的所有信息 prosize的表
            proSizeService.removeBySizeId(sizeId);
        }
        final boolean b = sizeService.removeById(sizeId);
        return super.successDeleteInfo(b);
    }


}

