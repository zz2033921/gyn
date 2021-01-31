package com.linkai.controller.front.product;

import com.github.pagehelper.PageInfo;
import com.linkai.controller.front.category.BaseCategoryController;
import com.linkai.dto.IndexProductDto;
import com.linkai.dto.IndexPushNewDto;
import com.linkai.enums.CustomizeVariable;
import com.linkai.service.PushNewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Author yamon
 * @Date 2020-10-10 19:57
 * @Description 商品控制类
 * @Version 1.0
 */
@Controller
@RequestMapping("/product")
public class FrontProductController extends BaseCategoryController {
    @Autowired
    private PushNewService pushNewService;
    /**
     * 打折商品首页
     * @return view
     */
    @RequestMapping(value = "/sale/index",method = RequestMethod.GET)
    public ModelAndView saleIndex(@RequestParam(value = "pageNum",required = false)Integer page){
        ModelAndView modelAndView = new ModelAndView();
        if (page==null){
            page =1;
        }
        final PageInfo<IndexProductDto> pageInfo = super.getSaleProductsWithPage(page, 6, "create_time desc");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag", CustomizeVariable.ON_SALE_PRODUCT.getName());
        modelAndView.setViewName("/front/productZone/saleList");
        return modelAndView;
    }
    /**
     * 最新商品首页
     * @return view
     */
    @RequestMapping("/newest")
    public ModelAndView newestProductIndex(@RequestParam(value = "pageNum",required = false)Integer page){
        ModelAndView modelAndView = new ModelAndView();
        if (page==null){
            page =1;
        }
        final PageInfo<IndexProductDto> pageInfo = super.getNewestProductsWithPage(page, 6, "create_time desc");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag",CustomizeVariable.NEWEST_PRODUCT.getName());
        modelAndView.setViewName("/front/productZone/newestProduct");
        return modelAndView;
    }
    /**
     * 最新商品首页
     * @return view
     */
    @RequestMapping("/hot")
    public ModelAndView hotProductIndex(@RequestParam(value = "pageNum",required = false)Integer page){
        ModelAndView modelAndView = new ModelAndView();
        if (page==null){
            page =1;
        }
        final PageInfo<IndexProductDto> pageInfo = super.getHotProductsWithPage(page, 6, "create_time desc");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag",CustomizeVariable.HOT_PRODUCT.getName());
        modelAndView.setViewName("/front/productZone/hotProduct");
        return modelAndView;
    }
    /**
     * 推新首页
     * @return view
     */
    @RequestMapping("/push")
    public ModelAndView pushNewIndex(@RequestParam(value = "pageNum",required = false)Integer page){
        ModelAndView modelAndView = new ModelAndView();
        if (page==null){
            page =1;
        }
        final PageInfo<IndexPushNewDto> pageInfo = super.getPushNewProductsWithPage(page, 6, "create_time desc");
        modelAndView.addObject("page",pageInfo);
        modelAndView.addObject("tag",CustomizeVariable.PUSH_NEW.getName());
        modelAndView.setViewName("/front/productZone/pushNew");
        return modelAndView;
    }
    /**
     * 推新首页
     * @return view
     */
    @RequestMapping("/push/view/{pushId}")
    public ModelAndView pushNewView(@PathVariable("pushId") Integer pushId){
        ModelAndView modelAndView = new ModelAndView();
        final IndexPushNewDto pushNew = pushNewService.getPushNewByPushId(pushId);
        modelAndView.addObject("pushNew",pushNew);
        modelAndView.setViewName("/front/productZone/pushNewDetail/view");
        return modelAndView;
    }








}
