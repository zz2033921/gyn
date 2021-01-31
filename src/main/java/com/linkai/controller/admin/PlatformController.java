package com.linkai.controller.admin;

import com.linkai.entity.Platform;
import com.linkai.enums.ResultDTO;
import com.linkai.service.PlatformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

/**
 * @Author yamon
 * @Date 2020-09-06 9:48
 * @Description
 * @Version 1.0
 */
@Controller
@RequestMapping("/admin/platform")
public class PlatformController extends BaseController{
    @Autowired
    private PlatformService platformService;
    /**
     * 商品服务平台首页
     * @return view
     */
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView modelAndView = new ModelAndView();
        final List<Platform> list = platformService.list();
        modelAndView.addObject("platforms",list);
        modelAndView.setViewName("/admin/platform/index");
        return modelAndView;
    }

    /**
     * 保存一个服务平台
     * @param platform 服务平台
     * @return entity
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> saveOnePlatform(@ModelAttribute Platform platform){
        final boolean save = platformService.save(platform);
        return super.successSaveInfo(save);
    }

    /**
     * 删除一个服务平台
     * @param platId
     * @return
     */
    @RequestMapping(value = "/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteOnePlatform(@RequestParam("platId")Integer platId){
        final boolean delete = platformService.removeById(platId);
        return super.successDeleteInfo(delete);
    }

    /**
     * 获取一个服务平台的信息
     * @param platId
     * @return
     */
    @RequestMapping(value = "/getOneInfo",method = RequestMethod.GET)
    @ResponseBody
    public ResultDTO<Platform> getOnePlatform(@RequestParam("platId")Integer platId){
        final ResultDTO<Platform> resultDTO = new ResultDTO<>();
        final Platform platform = platformService.getById(platId);
        if (platform!=null){
            resultDTO.setCode(200);
            resultDTO.setMessage("查询成功");
            resultDTO.setData(platform);
        }else {
            resultDTO.setCode(400);
            resultDTO.setMessage("查询失败");
        }
        return resultDTO;
    }

    /**
     * 更新一个服务平台信息
     * @param platform
     * @return
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> updatePlatform(@ModelAttribute Platform platform){
        System.out.println("获取的对象为"+platform);
        final boolean update = platformService.updateById(platform);
        return super.updateInfo(update);
    }

    /**
     * 批量删除服务平台信息
     * @param
     * @return
     */
    @RequestMapping(value = "/deleteSome",method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteSomeInfo(@RequestParam("selects[]") Integer[] selects){
        final boolean remove = platformService.removeByIds(Arrays.asList(selects));
        return super.successDeleteInfo(remove);
    }


}
