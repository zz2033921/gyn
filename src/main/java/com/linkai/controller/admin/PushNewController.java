package com.linkai.controller.admin;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.linkai.entity.Img;
import com.linkai.entity.PushImg;
import com.linkai.entity.PushNew;
import com.linkai.entity.PushPro;
import com.linkai.enums.ResultDTO;
import com.linkai.service.PushImgService;
import com.linkai.service.PushNewService;
import com.linkai.service.PushProService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author yamon
 * @Date 2020-10-19 19:56
 * @Description 商品退信
 * @Version 1.0
 */
@RestController
@RequestMapping("/admin/pushNew")
public class PushNewController extends BaseController {

    @Autowired
    private PushNewService pushNewService;
    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private PushProService pushProService;
    @Autowired
    private PushImgService pushImgService;

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView pushNewIndex() {
        ModelAndView modelAndView = new ModelAndView();
        final List<PushNew> list = pushNewService.list();
        modelAndView.addObject("pushNews",list);
        modelAndView.setViewName("/admin/pushNew/index");
        return modelAndView;
    }

    /**
     * 跳转页面
     *
     * @return ModelAndView
     */
    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView pushNewAdd() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("/admin/pushNew/add");
        return modelAndView;
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Integer> saveOne(String title, String desc, @RequestParam(value = "product[]", required = false) Integer[] product) {
        final PushNew pushNew = new PushNew();
        pushNew.setPushTitle(title);
        pushNew.setPushDesc(desc);
        final boolean save = pushNewService.save(pushNew);
        if (save) {
            if (product != null && product.length > 0) {
                //保存成功
                List<PushPro> pushPros = new ArrayList<>();
                for (Integer proId : product) {
                    final PushPro pushPro = new PushPro();
                    pushPro.setProId(proId);
                    pushPro.setPushId(pushNew.getPushId());
                    pushPros.add(pushPro);
                }
                pushProService.saveBatch(pushPros);
                return super.getReturnValueSaveInfo(true, pushNew.getPushId());
            }
            return super.getReturnValueSaveInfo(true, pushNew.getPushId());
        }
        return super.getReturnValueSaveInfo(false, 0);
    }

    /**
     * 跳转页面
     *
     * @return ModelAndView
     */
    @RequestMapping(value = "/addPushNewImg/{pushId}", method = RequestMethod.GET)
    public ModelAndView addPushNewImg(@PathVariable Integer pushId) {
        ModelAndView modelAndView = new ModelAndView();
        final PushNew pushNew = pushNewService.getById(pushId);
        //商品
        List<String> products = pushProService.getProductNameByPushId(pushId);
        stringRedisTemplate.opsForValue().set("pushId",pushNew.getPushId().toString());
        modelAndView.addObject("pushNew", pushNew);
        modelAndView.addObject("products", products);
        modelAndView.setViewName("/admin/pushNew/pushNewImg");
        return modelAndView;
    }

    /**
     * 跳转到展示页面
     * @param pushId pushId
     * @return model
     */
    @RequestMapping(value = "/showOnePushNew/{pushId}", method = RequestMethod.GET)
    public ModelAndView showOnePushNew(@PathVariable Integer pushId) {
        ModelAndView modelAndView = new ModelAndView();
        final PushNew pushNew = pushNewService.getById(pushId);
        //商品
        List<String> products = pushProService.getProductNameByPushId(pushId);
        //图片
        List<Img> imgs = pushImgService.getImgsByPushId(pushId);
        modelAndView.addObject("pushNew", pushNew);
        modelAndView.addObject("products", products);
        modelAndView.addObject("imgs", imgs);
        modelAndView.setViewName("/admin/pushNew/show");
        return modelAndView;
    }
    /**
     * 跳转到展示页面
     * @param pushId pushId
     * @return model
     */
    @RequestMapping(value = "/modifyOnePushNew/{pushId}", method = RequestMethod.GET)
    public ModelAndView modifyOnePushNew(@PathVariable Integer pushId) {
        ModelAndView modelAndView = new ModelAndView();
        final PushNew pushNew = pushNewService.getById(pushId);
        //商品
        List<String> products = pushProService.getProductNameByPushId(pushId);
        modelAndView.addObject("pushNew", pushNew);
        modelAndView.addObject("products", products);
        modelAndView.setViewName("/admin/pushNew/modify/show");
        return modelAndView;
    }

    /**
     * 更新推新记录和对应商品
     * @param pushId id
     * @param pushTitle title
     * @param pushDesc desc
     * @param transProduct product
     * @return list
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Integer> updateOne(Integer pushId,String pushTitle, String pushDesc,
                                        @RequestParam(value = "transProduct[]", required = false) Integer[] transProduct) {
        final PushNew pushNew = new PushNew();
        pushNew.setPushId(pushId);
        pushNew.setPushTitle(pushTitle);
        pushNew.setPushDesc(pushDesc);
        final boolean save = pushNewService.updateById(pushNew);
        if (save) {
            if (transProduct != null && transProduct.length > 0) {
                final QueryWrapper<PushPro> pushProQueryWrapper = new QueryWrapper<>();
                pushProQueryWrapper.eq("push_id",pushId);
                pushProService.remove(pushProQueryWrapper);
                //保存成功
                List<PushPro> pushPros = new ArrayList<>();
                for (Integer proId : transProduct) {
                    final PushPro pushPro = new PushPro();
                    pushPro.setProId(proId);
                    pushPro.setPushId(pushNew.getPushId());
                    pushPros.add(pushPro);
                }
                pushProService.saveBatch(pushPros);
                return super.getReturnValueSaveInfo(true, pushNew.getPushId());
            }
            return super.getReturnValueSaveInfo(true, pushNew.getPushId());
        }
        return super.getReturnValueSaveInfo(false, 0);
    }
    /**
     * 更新推新记录和对应商品
     * @param pushId id
     * @return list
     */
    @RequestMapping(value = "/modifyPushNewImg/{pushId}", method = RequestMethod.GET)
    public ModelAndView showPushNewImg(@PathVariable Integer pushId) {
        final ModelAndView modelAndView = new ModelAndView();
        //找到所有的图片
        final List<Img> imgsByPushId = pushImgService.getImgsByPushId(pushId);
        stringRedisTemplate.opsForValue().set("pushId",pushId.toString());
        modelAndView.addObject("imgs",imgsByPushId);
        modelAndView.setViewName("/admin/pushNew/modify/showImg");

        return modelAndView;
    }

    /**
     * 批量删除
     * @param selects selects
     * @return flag
     */
    @RequestMapping(value = "/deleteBatchPushNew", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteSize(@RequestParam("selects[]") String[] selects) {
        int count =0;
        for (String select : selects) {
            //先删除商品pushId
            final QueryWrapper<PushPro> pushProQueryWrapper = new QueryWrapper<>();
            pushProQueryWrapper.eq("push_id",select);
            pushProService.remove(pushProQueryWrapper);
            //再删除图片
            final QueryWrapper<PushImg> pushImgQueryWrapper = new QueryWrapper<>();
            pushImgQueryWrapper.eq("push_id",select);
            pushImgService.remove(pushImgQueryWrapper);
            //最后i删除pushNew
            pushNewService.removeById(select);
            count++;
        }
        return super.updateInfo(count == selects.length);
    }

    /**
     * 删除单个推新记录
     * @param pushId pushId
     * @return flag
     */
    @RequestMapping(value = "/deleteOnePushNew", method = RequestMethod.POST)
    @ResponseBody
    public ResultDTO<Boolean> deleteOnePushNew(Integer pushId) {
        //先删除有可能依赖的库
        //商品
        final QueryWrapper<PushPro> pushProQueryWrapper = new QueryWrapper<>();
        pushProQueryWrapper.eq("push_id",pushId);
        pushProService.remove(pushProQueryWrapper);
        //图片
        final QueryWrapper<PushImg> pushImgQueryWrapper = new QueryWrapper<>();
        pushImgQueryWrapper.eq("push_id",pushId);
        pushImgService.remove(pushImgQueryWrapper);
        //逻辑删除记录
        final boolean b = pushNewService.removeById(pushId);
        return super.successDeleteInfo(b);
    }


}
