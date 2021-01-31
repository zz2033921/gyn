package com.linkai.controller.admin;


import com.linkai.entity.Color;
import com.linkai.entity.ProColor;
import com.linkai.entity.ProSize;
import com.linkai.entity.Size;
import com.linkai.enums.ResultDTO;
import com.linkai.service.ColorService;
import com.linkai.service.ProColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.sql.ResultSet;
import java.util.Collection;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author yamon
 * @since 2020-09-09
 */
@Controller
@RequestMapping("/admin/color")
public class ColorController extends BaseController{
    @Autowired
    private ColorService colorService;
    @Autowired
    private ProColorService proColorService;

    /**
     *新增一个颜色
     * @param colDesc 颜色描述
     * @return 标志
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> save(@RequestParam(value = "colDesc")String colDesc){
        final Color entity = new Color();
        entity.setColDesc(colDesc);
        final boolean save = colorService.save(entity);
        return super.successSaveInfo(save);
    }

    /**
     * list all
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    @ResponseBody
    public List<Color> list(){
        return colorService.list();
    }

    /**
     * get one color
     * @param colId
     * @return
     */
    @RequestMapping(value = "/getOne", method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Color> getOne(Integer colId) {
        final Color byId = colorService.getById(colId);
        return super.requestInfo(byId);
    }
    /**
     * 更新一个color
     * @param color color
     * @return color
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> update(@ModelAttribute Color color){
        final boolean b = colorService.updateById(color);
        return super.updateInfo(b);
    }
    /**
     * 删除一条color信息
     * @param colorId colorId
     * @return sizeId
     */
    @RequestMapping(value = "/delete",method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Boolean> delete(Integer colorId){
        List<ProColor> proSizes = proColorService.selectBySizeId(colorId);
        if (!proSizes.isEmpty()){
            //删除sizeId的所有信息 prosize的表
            proColorService.removeBySizeId(colorId);
        }
        final boolean b = colorService.removeById(colorId);
        return super.successDeleteInfo(b);
    }
}

