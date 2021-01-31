package com.linkai.controller.front.category;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.linkai.entity.Product;
import com.linkai.enums.CustomizeVariable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @Author yamon
 * @Date 2020-09-21 20:35
 * @Description
 * @Version 1.0
 */
@Controller
@RequestMapping("/category")
public class CategoryIndexController extends BaseCategoryController{

    /**
     * 查看单个商品信息
     * @return object
     */
    @RequestMapping(value = "/shop",method = RequestMethod.GET)
    public ModelAndView showAllProduct(@RequestParam(value = "pageNum",required = false)Integer pageNum){
        if (pageNum==null){
            pageNum=1;
        }
        ModelAndView modelAndView = new ModelAndView();
        PageHelper.startPage(pageNum,6,"create_time desc");
        List<Product> productList = productService.listAllIndexProduct();
        PageInfo<Product> productPageInfo = new PageInfo<>(productList);
        modelAndView.addObject("page",productPageInfo);
        modelAndView.addObject("tag", CustomizeVariable.ALL_PRODUCT);
        modelAndView.setViewName("/front/shop");
        return modelAndView;
    }
}
